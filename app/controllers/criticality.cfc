component {

    public array function getCriticality() {
        try {
            result = queryExecute("SELECT * FROM criticality").reduce( ( res, row ) => {
                res.append( row );
                return res;
            }, [] );
            return result;
        } catch (any e) {
            return [];
        }
        
    }
    
}