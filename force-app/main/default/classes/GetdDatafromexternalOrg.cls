public class GetdDatafromexternalOrg  {
    
    @AuraEnabled
    public static string getDatafromDevOrg(String conName){
         String data = null;
        try{
       
        String body='{"Name" : "'+conName+'"}';
        Http http=new Http();
        httprequest req = new httprequest();
        String token1='00D5g00000A3fp7!ARIAQCh49DbZaOYGhRECfAape9QA5dI.0Odbd418brzzcZwJXqjArtiVnpU7wJNrXCAAT2dT6QZZrsrtMw8X9e7QcQWw17.P';
        req.setEndpoint('https://cloudanalogy-60f-dev-ed.my.salesforce.com/services/apexrest/api/getData');
        req.setMethod('POST');
        req.setHeader('Accept','application/json'); 
        req.setHeader('Content-Type' , 'application/json');
        req.setHeader('Authorization','Bearer '+token1);
        req.setBody(body);
        System.debug('body ::'+body);
        System.debug('hii value are 1 ');
        httpresponse res = http.send(req);
        System.debug('status:: '+res.getStatus());
        System.debug('status code=> '+res.getStatusCode());
        
        if (res.getStatusCode()==200){
            system.debug('Hii your responce was redy');
            system.debug(res.getStatusCode());
            system.debug('value are for Account response '+res.getBody());
            data=res.getBody();
            
            
        }else{
            system.debug('Hii your responce was not reddy');
            system.debug(res.getBody());
        }
        
    }
     catch(Exception e){
      System.debug(e.getMessage()+'>>>>>>>>>>>>>>>>>>>>>'+e.getLineNumber());
     } 
        
     return data;
}
    
    @AuraEnabled
    public static String getConData(){
      String data = null;
        try{
        Http http=new Http();
        httprequest req = new httprequest();
       // String token1='00D5g00000A3fp7!ARIAQOYskHbkYK1oEev3rjnQiVGb4xo58AEMhiZElOc33luSVWzVjyuOLD81uspja8Y2UQZOIKDb3SUh_AAq3dibpEE4LgTO';
        
        String token1= tokenDev__c.getvalues('sessionId').devOrgToken__c;
            
        req.setEndpoint('https://cloudanalogy-60f-dev-ed.my.salesforce.com/services/apexrest/api/getconList');
        req.setMethod('POST');
        req.setHeader('Accept','application/json'); 
        req.setHeader('Content-Type' , 'application/json');
        req.setHeader('Content-Length', '0');
        req.setHeader('Authorization','Bearer '+token1);
        System.debug('hii value are 1 ');
        httpresponse res = http.send(req);
        System.debug('status:: '+res.getStatus());
        System.debug('status code=> '+res.getStatusCode());
        
        if (res.getStatusCode()==200){
            system.debug('Hii your responce was redy');
            system.debug(res.getStatusCode());
            system.debug('value are for Account response '+res.getBody());
            data=res.getBody();
            System.debug(data);
            
            
        }else{
            
            system.debug('Hii your responce was not reddy');
            system.debug(res.getBody());
            throw new AuraHandledException('error hai');
            
        }
        
    }
     catch(Exception e){
      System.debug(e.getMessage()+'>>>>>>>>>>>>>>>>>>>>>'+e.getLineNumber());
         throw e;
     } 
    return data;    
     
}
    
    
    
}