global class BatchinsertAccount Implements DataBase.Batchable<sObject>,Database.Stateful  {
    
    global List<Account> myList{
        set;get;
    }
    
    global BatchinsertAccount (List<Account> objList){
        myList = objList;
        System.debug(myList);
    }

    global List<Account> start(Database.BatchableContext Bc){
  
       return myList;
    }
    
    global void execute (Database.BatchableContext BC,List<Account> accList ){
        System.debug('acclist inside execute'+accList);
        
        try{
            
            insert acclist;
            
            
        }catch(Exception e){
            System.debug(e.getLineNumber()+'>>>>>>>>>>>.'+e.getMessage());
        }
        
    }
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
    
  
    
}