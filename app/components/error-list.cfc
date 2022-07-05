component {

    this.error = createObject('component', 'controllers.error');
    
    public function getErrorList() {
        return this.error.getErrorList();
    }
}