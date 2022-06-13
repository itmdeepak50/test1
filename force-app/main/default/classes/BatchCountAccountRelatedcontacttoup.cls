global  class BatchCountAccountRelatedcontacttoup  implements Database.Batchable<sObject>,Schedulable {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
       
        string query='select id, accountid from contact where Accountid!=null';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> conList) {
        Map<Id,Integer> conMap=new Map<Id,Integer>();
        if(conList.size()>0){
        for(Contact conRecord : conlist){
            if(!conMap.containsKey(conRecord.AccountId)) {
                
                conMap.put(conRecord.AccountId,1);
            }else{
                integer count=conMap.get(conRecord.AccountId);
                count++;
                conMap.put(conRecord.AccountId,count);
            }
            
        }
        }
        
        List<Account> accList=new List<Account>();
        for(id accId: conMap.keySet()){
            Account accInstence =new Account();
            accInstence.Id=accId;
            accInstence.Count__c=conMap.get(accId);
            accList.add(AccInstence);
            
        }
        
        try {
            if(!conMap.isEmpty()){
         update accList;
            }
            
        } catch(Exception e) {
            System.debug(e);
        }
        
         
    }
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
     
    global void execute(System.SchedulableContext sc){
        
        BatchCountAccountRelatedcontacttoup bc= new BatchCountAccountRelatedcontacttoup();
        Database.executeBatch(bc);
    }
    
}