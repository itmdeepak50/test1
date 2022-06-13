public class AccoundRecords {
    
    public List<Account> accountList{get;set;}
    public string data{get;set;}
    
    public AccoundRecords(){
       data='Cloud Analogy';
        accountList=[Select Id,Name,Phone from Account limit 10];
    }
    
    public List<Account> getRecords(){
        
        List<Account> accList=new List<Account>();
        accList=[Select Id,Name,Phone from Account limit 10];
        return accList;
    }
 
}