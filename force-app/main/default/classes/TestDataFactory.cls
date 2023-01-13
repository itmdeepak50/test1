@isTest
public class TestDataFactory {
//Account Creation//
     public static Account createAccount(Boolean doInsert){
        Account acc = new Account();
        acc.Name = 'Test Account';
        if(doInsert){
            insert acc;
        }
        return acc;
    }
   
    public static List<Contact>createContact(Id accId,integer n){
        List<Contact> conRecord=new List<Contact>();
        for(integer i=0;i<n;i++){
        Contact conInstance=new contact();
        conInstance.lastname='TestContact';
        conInstance.AccountId=accId;
        conRecord.add(conInstance);
       
        }
      insert conRecord;
       return conRecord;
        
        
        
        
    }
    
    
    
}