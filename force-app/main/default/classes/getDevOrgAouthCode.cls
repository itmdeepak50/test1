public class getDevOrgAouthCode {
    @AuraEnabled
    public static void getAouthcode(){
        
        
        String data = null;
        try{
            
                string  clientId='3MVG9pRzvMkjMb6ngoou2wuHLWHWT6mbfyC1LkySZ_D_MRL8EK7ymdQS_yZPvy3lFA.ZdCL1XHWKpXx44kUQm';   
                string  clientSecret='3ABA0AFDEF19CC8CEAA775F3F0327558D69C13A604FCCA329C43DAED2CA93115';   
                string  username= 'dev.sharma@cloudanalogy.com';  
                string  password= 'Salesforce@17dtPgKcBrMnYISWlhX2aydUbI';  
            Http http=new Http();
            httprequest req = new httprequest();
            req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
            req.setMethod('POST');
            req.setBody('grant_type=password' + 
                            '&client_id=' + clientId + 
                            '&client_secret=' + clientSecret + 
                            '&username=' + username + 
                            '&password=' + password);       
            req.setHeader('Content-Type','application/x-www-form-urlencoded');  
            req.setTimeout(2 * 60 * 1000);  
            System.debug('hii value are 1 ');
            httpresponse res = http.send(req);
            System.debug('status:: '+res.getStatus());
            System.debug('status code=> '+res.getStatusCode());
            
            if (res.getStatusCode()==200){
                system.debug('Hii your responce was redy');
                system.debug(res.getStatusCode());
                system.debug('value are for Account response '+res.getBody());
                data=res.getBody();
         
               map<string,Object> resultMap = (map<string,Object>)JSON.deserializeUntyped(data);
               String accesstoken = (String)resultMap.get('access_token');
                tokenDev__c  token =new tokenDev__c ();
                token.id='a0f5g000000JUZHAA4';
                token.devOrgToken__c=accesstoken;
                update token;
                
                
                
          
            }else{
                system.debug('Hii your responce was not reddy');
                system.debug(res.getBody());
            }
            
        }
        catch(Exception e){
            System.debug(e.getMessage()+'>>>>>>>>>>>>>>>>>>>>>'+e.getLineNumber());
        } 
    
    }
 
}