public class getDatafromQuickbookquickEvent {
    @future(callout=true)
    public static void getDatafromevent(String objectName){
        
        String value=null;
       
        
        try{
          
            Http http=new Http();
            httprequest req = new httprequest();
           
            // Quickbook__c   token =[select Token__c from Quickbook__c limit 1];
             String token1=System.label.Accesstoken;
            System.debug(token1);
            // req.setEndpoint('https://na1.salesforce.com/services/data/v20.0/');
            
            String str='select name from Account';
            req.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365200552330/query?query=select+*+from+'+objectName+'');
            // https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365200552390/account/1?minorversion=62
            req.setMethod('GET');
            req.setHeader('Accept','application/json'); // When you use setMethod as 'GET' To get response in xml format.
            req.setHeader('Authorization','Bearer '+token1);
            req.setTimeout(60000);
            System.debug('hii value are 1 ');
            httpresponse res = http.send(req);
            System.debug('status:: '+res.getStatus());
            System.debug('status code=> '+res.getStatusCode());
                       
            if (res.getStatusCode()==200){
                system.debug('Hii your responce was redy');
                system.debug(res.getStatusCode());
                value=res.getBody();
                system.debug(value);
                QuickbookAccountData.mapAccData(value);
             
              
            }else{
                system.debug('Hii your responce was not reddy');    
                system.debug(res.getStatusCode());
            }
        }catch(Exception e){
            System.debug(e.getMessage()+'>>>>>>>>>>>>>>>>>>>>>'+e.getLineNumber());
        } 
    
        
    }
    
}