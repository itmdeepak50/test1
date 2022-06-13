global class NewTest Implements  DataBase.Batchable<sObject>,Database.Stateful{

    global Set<String> emailSet = new Set<String>();
    
    //global list<Account> listAccoutTobeDelete=new List<Account>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Email__c  FROM 	PersonAccount__c WHERE Email__c != NULL ORDERBY LastModifiedDate DESC' ;
        return Database.getQueryLocator(query);
    }
    
    global void execute (Database.BatchableContext BC,List<PersonAccount__c> personAccountList ){
        try{
            list<PersonAccount__c> listAccoutTobeDelete=new List<PersonAccount__c>();
            for(PersonAccount__c personAccount : personAccountList){
                /*if(!emailAndPersonAccountMaps.containsKey(personAccount.PersonEmail)){
emailAndPersonAccountMaps.put(personAccount.PersonEmail, personAccount);
}
else{
listAccoutTobeDelete.add(personAccount);
}*/
                if(!emailSet.contains(personAccount.Email__c)){
                    emailSet.add(personAccount.Email__c);
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
            System.debug('Error --- > '+e.getMessage());
            System.debug('Line --> '+e.getLineNumber());
        }
    }
    
    
    global void finish(Database.BatchableContext BC) {
        
    }
    
    
    
}