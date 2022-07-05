component {
    
    this.user = createObject('component', 'controllers.user');

    public boolean function login(required login, required password, roles = "user") {
        isExist = this.user.checkAuthData(login, password);
        if(isExist) {
            cflogin() {
                cfloginuser(name=login, password=password, roles=roles);
            }
        }
        return isExist;
    }
}