@RestResource(urlMapping='/request/*')
global with sharing class RestgetALLdata {
    @Httpget
    global static List<sObject> getAllData(){
         List<sObject>  sList =new List<sObject>();
        try{
        Restrequest request = RestContext.request;
        string acname= request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //List<Account> accList =[select id,name from Account];
        sList  = Database.query('select id ,name from'+' '+acname);
        }catch(Exception e){
            System.debug(e);
        }
         return sList;
        
    }
    
}