public class aura8ConlookwithAcc {
    @AuraEnabled
    public static List<Account> getAccdata(){
        List<Account> accList= [ SELECT Id,Name from Account limit 10];
        return accList;
    }
    
    @AuraEnabled
    public static Contact insertconData(String accId,String lastName){
        Contact conInstence=new Contact();
        conInstence.AccountId=accId;
        conInstence.LastName=lastName;
        insert conInstence;
        return conInstence;
    }
    
    
}