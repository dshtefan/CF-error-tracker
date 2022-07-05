component {

    public struct function getUserInfo(login) {
        try {
            result = queryExecute("SELECT * FROM app_user WHERE login = '#login#'"
            ).reduce( ( res, row ) => {
                res.append( row );
                return res;
            }, [] );
            return {
                id: result[1].id,
                login: result[1].login,
                password: result[1].password,
                firstname: result[1].firstname,
                surname: result[1].surname
            };
        } catch (any e) {
            return {
                id: "",
                login: "",
                password: "",
                firstname: "",
                surname: ""
            };
        }

        
    }

    public boolean function editUserInfo(required login, required password, required firstname, required surname) {
        try {
            result = queryExecute(
                "UPDATE app_user 
                    SET (login, password, firstname, surname) = ('#login#', '#password#', '#firstname#', '#surname#')
                    WHERE login = '#getAuthUser()#'");
            return true;
        } catch (any e) {
            return false;
        }
        
    }

    public boolean function checkAuthData(required login, required password) {
        try {
            result = queryExecute("SELECT * FROM public.app_user WHERE login = :login AND password = :password ",
                {login: login, password: password});
            return result.len() > 0;
        } catch (any e) {
            return false;
        }
    }

    private boolean function isUserExist(required login) {
        result = queryExecute("SELECT * FROM public.app_user WHERE login = :login",
            {login: login});
        return result.len() > 0;
    }

    public boolean function addUser(required login, required password, required firstname, required surname) {
        try {
            if (isUserExist(login)) return false;
        
            res = queryExecute("INSERT INTO app_user (login, password, firstname, surname) VALUES (:login, :password, :firstname, :surname)", 
                {login: login, password: password, firstname: firstname, surname: surname});

            return true;
        } catch (exType exName) {
            return false;
        }
    }

    public array function getUserList() {
        try {
            result = queryExecute(
                "SELECT 
                    id,
                    login,
                    firstname,
                    surname 
                FROM public.app_user")
                .reduce( ( res, row ) => {
                    res.append( row );
                    return res;
                }, [] );            
            return result;
        } catch (any e) {
            return [];
        }
        
    }
}