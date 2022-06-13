@RestResource(urlMapping='/Accounts/*')
global with sharing class RestApiExample {

    @HttpPost
    global static Id CrateAccount(String name){
        Account accInstence=new Account(name=name);
        
        insert accInstence;
        
        
      return  accInstence.Id;
    }
    
    
    
}