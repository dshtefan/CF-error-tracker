component {

    this.error = createObject('component', 'controllers.error');
    this.status = createObject('component', 'controllers.status');
    this.user = createObject('component', 'controllers.user');
    this.statusMap = {
        1: [2],
        2: [3],
        3: [2, 4],
        4: []
    }

    public struct function getErrorById(required id) {
        result = this.error.getErrorById(id);
        arraySort(
            result.errorlog,
            function (e1, e2){
                return compare(e1.actiondate, e2.actiondate);
            }
        );
        return result;
    }

    public boolean function isErrorExist(required id) {
        return this.error.isErrorExist(id);
    }

    public array function getNextActionNames(required currentStatus) {
        return this.status.getNextActionNames(this.statusMap[currentStatus]);
    }

    public boolean function updateErrorStatus(required status, required comment, required errorid) {
        userinfo = this.user.getUserInfo(getAuthUser());
        return this.error.updateErrorStatus(status, comment, userinfo.id, errorid);
    }
    
}