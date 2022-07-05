component {
    public array function getErrorList() {
        try {
            result = queryExecute(
            "SELECT 
                error_info.id, 
                errordate, 
                shortdescription,
                fulldescription,
                login,
                priorityname,
                criticalityname
            FROM public.error_info 
            LEFT JOIN public.app_user ON app_user.id = userid
            LEFT JOIN public.priority ON priority.id = priorityid
            LEFT JOIN public.criticality ON criticality.id = criticalityid"
            ).reduce( ( res, row ) => {
                row.statusname = getLastStatusByErrorId(row.id).statusname;
				res.append( row );
				return res;
			}, [] );
            return result;
        } catch (any e) {
            return [];
        }
        
    }

    public boolean function addError(required shortdescription, required fulldescription, required priorityid, required criticalityid, required comment) {
        transaction { 
            try {
                userinfo = queryExecute("SELECT id FROM app_user WHERE login = '#getAuthUser()#'"
                ).reduce( ( res, row ) => {
                    res.append( row );
                    return res;
                }, [] );

                userid = userinfo[1].id;

                newError = queryExecute(
                    "INSERT INTO error_info (shortdescription, fulldescription, userid, priorityid, criticalityid) 
                        VALUES (:shortdescription, :fulldescription, #userid#, #priorityid#, #criticalityid#) RETURNING id", 
                    {shortdescription: shortdescription, fulldescription: fulldescription}
                    ).reduce( ( res, row ) => {
                        res.append( row );
                        return res;
                    }, [] );

                errorid = newerror[1].id

                res = queryExecute("INSERT INTO error_log (actionid, actioncomment, userid, errorid) VALUES (#1#, :comment, #userid#, #errorid#)", 
                    {comment: comment});

                transaction action="commit"; 
                return true;
            } catch(any e) { 
                transaction action="rollback"; 
                return false;
            } 
        }
    }

    public array function getErrorLogByErrorId(required errorId) {
        try {
            errorLog = queryExecute("
                SELECT actiondate, actioncomment, login, statusname
                FROM error_log 
                LEFT JOIN public.status ON status.id = error_log.actionid
                LEFT JOIN public.app_user ON app_user.id = error_log.userid
                WHERE errorid = '#errorId#'
                "
            ).reduce( ( res, row ) => {
                res.append( row );
                return res;
            }, [] );
            return errorLog;
        } catch (exType exName) {
            return {};
        }
    }
    
    public struct function getLastLogOfErrorByErrorId(required errorid) {
        try {
            result = queryExecute("SELECT * FROM error_log WHERE errorid = '#errorid#' ORDER BY actiondate DESC LIMIT 1").reduce( ( res, row ) => {
                res.append( row );
                return res;
            }, [] );
            return result[1];
        } catch (any e) {
            return {};
        }
    }

    public struct function getLastStatusByErrorId(required errorId) {
        try {
            lastErrorLog = getLastLogOfErrorByErrorId(errorId);
            status = createObject('component', 'controllers.status');
            return status.getStatusById(lastErrorLog.actionid);
        } catch (any e) {
            return {};
        }
    }

    public struct function getErrorById(required errorId) {
        transaction {
            try {
                errorInfo = queryExecute("
                    SELECT error_info.id, errordate, shortdescription, fulldescription, login, priorityname, criticalityname 
                    FROM error_info
                    LEFT JOIN public.app_user ON app_user.id = error_info.userid
                    LEFT JOIN public.priority ON priority.id = error_info.priorityid
                    LEFT JOIN public.criticality ON criticality.id = error_info.criticalityid
                    WHERE error_info.id = '#errorId#'
                ").reduce( ( res, row ) => {
                    res.append( row );
                    return res;
                }, [] )[1];
                errorLog = getErrorLogByErrorId(errorId);
                lastStatus = getLastStatusByErrorId(errorId);
                result = {
                    errorInfo: errorInfo,
                    errorLog: errorLog,
                    lastStatus: lastStatus
                };
                transaction action="commit"; 
                return result;
            } catch (any e) {
                transaction action="rollback"; 
                return {};
            }
        }
        
    }

    public boolean function isErrorExist(required errorId) {
        try {
            res = queryExecute("SELECT * FROM error_info WHERE id = '#errorId#'")
            return res.id == errorId;
        } catch (any e) {
            return false;
        }
    }

    public boolean function updateErrorStatus(required status, required comment, required userid, required errorid) {
        try {
            queryExecute("
            INSERT INTO error_log (actioncomment, actionid, userid, errorid) VALUES ('#comment#', #status#, #userid#, #errorid#) 
            ")
            return true;
        } catch (any e) {
            return false;
        }
    }
    
}