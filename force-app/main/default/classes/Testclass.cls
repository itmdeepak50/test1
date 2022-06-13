public class Testclass {

    public  static void main(){
        
        List<PersonAccount__c> personAccountList = new List<PersonAccount__c>();
        personAccountList = [SELECT Id, Name, Email__c FROM PersonAccount__c WHERE Email__c != NULL ORDER BY LastModifiedDate DESC];
        Map<String, List<PersonAccount__c>> emailAndPersonAccountMap = new Map<String, List<PersonAccount__c>>();
        for(PersonAccount__c personAccount : personAccountList){
            if(!emailAndPersonAccountMap.containsKey(personAccount.Email__c)){
                emailAndPersonAccountMap.put(personAccount.Email__c, new List<PersonAccount__c>());
            }
            emailAndPersonAccountMap.get(personAccount.Email__c).add(personAccount);
        }
       
        
        System.debug(emailAndPersonAccountMap);
        
        List<PersonAccount__c> updatePersonAccountList = new List<PersonAccount__c>();
        for(String email : emailAndPersonAccountMap.keySet()){
            if((emailAndPersonAccountMap.get(email)).size()>1){
                for(Integer i=1; i<(emailAndPersonAccountMap.get(email)).size(); i++){
                    PersonAccount__c personAccount = (emailAndPersonAccountMap.get(email))[i];
                    personAccount.Email__c = '';
                    updatePersonAccountList.add(personAccount);
                }
            }
        }
        if(updatePersonAccountList.size()>0){
            update updatePersonAccountList;
        }
        
        
    }
    
}