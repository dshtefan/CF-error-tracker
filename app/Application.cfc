component {
    this.name = "AppName";
    this.datasources = {
        db = {
            database = "getit",
            driver = "PostgreSQL",
            host = "postgres",
            port = "5432",
            username = "postgres",
            password = "123"
        }
    }
    this.datasource = "db";
    this.sessionManagement = true;
    this.loginStorage = "session";    
    this.sessionTimeout = createTimespan(0, 1, 0, 0);
    this.customTagPaths = getDirectoryFromPath(getCurrentTemplatePath()) & "customtags";

    public boolean function onRequestStart(required targetPage) {
        if (find("login.cfm", targetPage) !== 0) {
            if(isUserLoggedIn()) {
                location("./index.cfm", false);
            }
        } else {
            if(!isUserLoggedIn()) {
                if (find("new-user.cfm", targetPage) !== 0) {
                    return true;
                }
                location("./login.cfm", false);
            }
        }
        return true;
    }
}