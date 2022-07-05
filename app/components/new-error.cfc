component {

    this.error = createObject('component', 'controllers.error');
    this.priority = createObject('component', 'controllers.priority');
    this.criticality = createObject('component', 'controllers.criticality');
    
    public array function getPriorities() {
        return this.priority.getPriorities();
    }
    
    public array function getCriticality() {
        return this.criticality.getCriticality();
    }

    public boolean function addError(
        required shortdescription, 
        required fulldescription, 
        required priorityid, 
        required criticalityid, 
        required comment
    ) {
        return this.error.addError(shortdescription, fulldescription, priorityid, criticalityid, comment);
    }
}