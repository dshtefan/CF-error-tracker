component {

    this.user = createObject('component', 'controllers.user');

    public function getUserList() {
        result = this.user.getUserList();
        arraySort(
            result,
            function (e1, e2){
                return compare(e1.id, e2.id);
            }
        );
        return result;
    }
    
}