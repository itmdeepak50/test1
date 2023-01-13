public class HandlerclassOnAccounttrigger {

    public static void main(List<Account> acc){
        
       List<Account> accList= [select id ,NumberOfEmployees ,name from account where id IN:acc];
       System.debug(accList[0].id); 
       System.debug(accList[0].name); 
       System.debug(accList[0].NumberOfEmployees); 
    }
    
    
}