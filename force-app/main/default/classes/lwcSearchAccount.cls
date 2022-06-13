public class lwcSearchAccount {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountData(){
      /* System.debug('value are '+ accname);
       List<Account> accList=new List<Account>();
       if(accname!=''){ 
       String s='%'+accname+'%';
       accList=[select name from Account where name like:s];
       System.debug('hey you are  '+accname);
       System.debug(accList);
           
        }*/   
        
        
     List<Account> accList=new List<Account>();
       accList=[select name from Account ];
       
       System.debug(accList);   
        
        
         return accList;        
    }
      
        

    }