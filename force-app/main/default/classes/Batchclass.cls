global class Batchclass Implements  DataBase.Batchable<sObject>,Database.Stateful{
    
    
    global Map<String, List<PersonAccount__c>> emailAndPersonAccountMap = new Map<String, List<PersonAccount__c>>();
    global Map<String,PersonAccount__c> emailAndPersonAccountMaps = new Map<String, PersonAccount__c>();
    global list<PersonAccount__c> listAccoutTobeDelete=new List<personAccount__c>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        String query = 'SELECT Id, Name, Email__c FROM PersonAccount__c WHERE Email__c != NULL ORDER BY LastModifiedDate DESC';
        return Database.getQueryLocator(query);
    }
    
    
    global void execute (Database.BatchableContext BC,List<PersonAccount__c> personAccountList ){
        try{
            
            // except last modified record will added into listAcccountToBeDelete
            for(PersonAccount__c personAccount : personAccountList){
                if(!emailAndPersonAccountMaps.containsKey(personAccount.Email__c)){
                    emailAndPersonAccountMaps.put(personAccount.Email__c, personAccount);
                }
                else{
                    listAccoutTobeDelete.add(personAccount);
                }
            }
            if(listAccoutTobeDelete.size()>0){
                for(PersonAccount__c pccList: listAccoutTobeDelete){
                    pccList.Email__c='';
                }
                update listAccoutTobeDelete;
            }
        }catch(Exception e){
            System.debug(e.getLineNumber()+'>>>>>>>>>>>.'+e.getMessage());
        }
        
    }
    
    global void finish(Database.BatchableContext BC) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}