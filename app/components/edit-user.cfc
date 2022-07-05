component {    

    this.user = createObject('component', 'controllers.user');

    public struct function getUserInfo() {
        return this.user.getUserInfo(getAuthUser());
    }

    public boolean function editUserInfo(required login, required password, required firstname, required surname) {
        isSuccess = this.user.editUserInfo(login, password, firstname, surname);
        if(isSuccess) {
            cflogout();
            cflogin() {
                cfloginuser(name=login, password=password, roles="user");
            }
        }
        return isSuccess;
    }
}