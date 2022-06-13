public class Accountdata {
    
    @AuraEnabled
    public static List<Account> data(){
        
        List<Account> accInstence=[SELECT Id,Name,Phone FROM Account Limit 10];
        System.debug('list>>>>>>'+accInstence);
        return accInstence;
    }
    @AuraEnabled
    public static Account insertAccount(string accountName ,String accountPhone,Integer accountEmployee, String accountAccountNumber ,String accountWebsite){
        Account accInstence =new Account();
        accInstence.Name=accountName;
        accInstence.Phone=accountPhone;
        accInstence.NumberOfEmployees=accountEmployee;
        accInstence.AccountNumber=accountAccountNumber;
        accInstence.Website=accountWebsite;
        
        insert accInstence;
        return accInstence;
    }
    @AuraEnabled
    public static Wrapper getContactAndOpportunity(String accid){
        Wrapper wr = new Wrapper();
        List<Contact> conData=[SELECT Id, LastName from Contact where accountId=:accid];
        system.debug('conData'+conData);
        List<Opportunity> oppData=[SELECT Id, Name, StageName from opportunity where accountId=:accid];
        system.debug('oppData'+oppData);
        wr.contactList = conData;
        wr.opportunityList = oppData;
        wr.isTrue = true;
        return wr;
    }
    
    public class Wrapper{
        @AuraEnabled
        public List<Contact> contactList;
        @AuraEnabled
        public List<Opportunity> opportunityList;
        @AuraEnabled
        public Boolean isTrue;
    }
    
}