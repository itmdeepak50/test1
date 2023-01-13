global class BatchApexExample implements Database.Batchable<sObject>,Schedulable {
    global Database.QueryLocator start(Database.BatchableContext BC) {
       
            string query='Select id,Name From PersonAccount__c';
                return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<PersonAccount__c> accList) {
        
        
        List<PersonAccount__c> accList1 =new List<PersonAccount__c>();
        for(PersonAccount__c acc : accList) {        
           
            accList1.add(acc);
            System.debug('>>>>>>>>>>>'+acc);
        }
        try {
        
        Database.delete(accList1, false); 
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
    
    global void execute(System.SchedulableContext sc ) {
         BatchApexExample nn=new BatchApexExample();
         Database.executeBatch(nn);

    }
    
}