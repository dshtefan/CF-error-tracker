component {

    public struct function getStatusById(required id) {
        try {
            status = queryExecute("SELECT * FROM status WHERE id = '#id#'").reduce( ( res, row ) => {
                res.append( row );
                return res;
            }, [] );
            return status[1];
        } catch (any e) {
            return {};
        }
    }

    public array function getNextActionNames(required array statuses) {
        try {
            result = [];
            for (statusId in statuses) {
                result.append(getStatusById(statusId));
            }
            return result;
        } catch (any e) {
            return [];
        }
    }

}