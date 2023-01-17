@RestResource(urlMapping='/Accounts/*')
global with sharing class RestApiExample {

    @HttpPost
    global static Id CrateAccount(String name){
<<<<<<< HEAD
       return name;
=======
        Account accInstence=new Account(name=name);
        
        insert accInstence;
        
        
      return  accInstence.Id;
>>>>>>> testing_branch
    }
    
    
    
}