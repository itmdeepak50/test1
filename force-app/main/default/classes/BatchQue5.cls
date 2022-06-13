global class BatchQue5 Implements DataBase.Batchable<sObject>,Schedulable  {
    
   global List<Opportunity> start(Database.BatchableContext Bc){
        
       List<Opportunity> oppList=new List<opportunity>();
       
       for(integer i=0;i<5;i++){
           opportunity oppInstence =new Opportunity();
           oppInstence.Name='Demoopp'+i;
           oppInstence.CloseDate=date.today();
           oppInstence.StageName='Closed Won';
           oppList.add(oppInstence);
           
       
       }
        return oppList;
    }
    
    global void execute (Database.BatchableContext BC,List<Opportunity> oppList ){
        
        
        try{
          insert opplist;
          System.debug(oppList);
            
        }catch(Exception e){
            System.debug(e.getLineNumber()+'>>>>>>>>>>>.'+e.getMessage());
        }
        
    }
    
     global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
  
      global void execute(System.SchedulableContext sc ) {
          
       
          
    }
    
}