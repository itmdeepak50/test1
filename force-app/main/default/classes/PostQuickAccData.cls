public class PostQuickAccData {
    @future(callout=true)
    public Static void PostAccData(List<String> acc){
        
        String body =  SerilizeAccount.serilizeAccData(acc);        
        Http http=new Http();
        httprequest req = new httprequest();
        Quickbook__c   token =[select Token__c from Quickbook__c limit 1];
        String token1=system.label.Accesstoken;
        System.debug(token1);
       
        String str='select name from Account';
        req.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365200552330/account?minorversion=62');
        
        req.setMethod('POST');
        req.setHeader('Accept' , 'application/json');
        req.setHeader('Content-Type' , 'application/json');
      //  req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); // When you use setMethod as 'GET' To get response in xml format.
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
            QuickbookAccountData.dserelizedAccountData(res.getBody());
      
        }else{
            system.debug('Hii your responce was not reddy');
            
            system.debug(res.getBody());
        }
        
     
    }
    
     @future(callout=true)
    public Static void PostAccupdateData(String body){
        
          
        Http http=new Http();
        httprequest req = new httprequest();
        Quickbook__c   token =[select Token__c from Quickbook__c limit 1];
        String token1=system.label.Accesstoken;
        System.debug(token1);
       
        String str='select name from Account';
        req.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365200552330/account?minorversion=62');
        
        req.setMethod('POST');
        req.setHeader('Accept' , 'application/json');
        req.setHeader('Content-Type' , 'application/json');
      //  req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); // When you use setMethod as 'GET' To get response in xml format.
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
            QuickbookAccountData.dserelizedAccountData(res.getBody());
      
        }else{
            system.debug('Hii your responce was not reddy');
            
            system.debug(res.getBody());
        }
        
     
    }
    
  
}