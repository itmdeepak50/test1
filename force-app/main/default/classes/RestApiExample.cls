@RestResource(urlMapping='/Accounts/*')
global with sharing class RestApiExample {

    @HttpPost
    global static Id CrateAccount(String name){
       return name;
    }
    
    
    
}