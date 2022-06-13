public class Top5 {

    
    public static void getTopFiveAcc(){
        List<id> ids = new List<id>();
        List<Contact> con = [select AccountId from contact where Accountid!=null];
        for(Contact ab : con){
            ids.add(ab.AccountId);
        }
        List<Account> acc = [select id ,(select id from contacts)from  Account where Id IN:ids];
        System.debug(acc);                
    }
}