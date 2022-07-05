component {
    
    this.user = createObject('component', 'controllers.user');

    public boolean function addUser(required login, required password, required firstname, required surname) {
        return this.user.addUser(login, password, firstname, surname);
    }
}