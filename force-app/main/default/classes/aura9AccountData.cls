public class aura9AccountData {
    @AuraEnabled
    public static List<Account> getAccountData(){
        
        List<Account> accList=[SELECT Name,Phone,Site from Account limit 10];
        accList.sort();
        System.debug(accList);
        return accList;
        
    }
    
}