public class AccountUpdation {

    public static void updateAccount(String ids,String stoken ){
        try{
        Accountids__c acid =[select Accountid__c from Accountids__c limit 1];        
        Account__c updateAcc= new Account__c ();
        updateAcc.ExternalId__c=ids;
        updateAcc.Id=acid.Accountid__c;
        updateAcc.SyncToken__c=stoken;    
        System.debug('value are '+ updateAcc);
        update updateAcc;
            }
        catch(Exception e){
            system.debug(e.getLineNumber()+'>>>>>>>>>>>'+e.getMessage());
            }
     
    }
  
}