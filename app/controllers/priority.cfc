component {

    public array function getPriorities() {
        try {
            result = queryExecute("SELECT * FROM priority").reduce( ( res, row ) => {
                res.append( row );
                return res;
            }, [] );
            return result;
        } catch (any e) {
            return [];
        }
        
    } 
}