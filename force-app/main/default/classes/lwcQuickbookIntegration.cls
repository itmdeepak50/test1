public class lwcQuickbookIntegration {
    
    
    //public static String client_Ids = 'ABo5zRoPRJnZopy3joLAQ1U208MqU5n3rzJlDSqwEF0N7jaRa4';
    
    //public static String consumer_Secret = 'UOjvqGp9Ev3jzJZM19a7bRPVn7FhsVBEHWx7PnPg';
    
    public static String redirect_URI = 'https://cloudanalogy-5ca-dev-ed.lightning.force.com/c/Applications.app';
    public static String redirect_URI1 = 'https://cloudanalogy-5ca-dev-ed.lightning.force.com/c/RegisterApplication.app';
    
    @AuraEnabled (cacheable=true)
    public static string getAuthcode(String passCode){
        String value=null;
        List<Quickbook__c> quickBookList=[select id,Client_id__c from Quickbook__c where Passcode__c =: passCode] ;  
        if(quickBookList.size()>0){
            String authorization_endpoint ='https://appcenter.intuit.com/connect/oauth2';
            String scope = 'com.intuit.quickbooks.accounting';
            String final_EndPoint = authorization_endpoint+'?client_id='+quickBookList[0].Client_id__c+'&response_type=code&scope='+
                scope+'&state=123445633443&redirect_uri='+redirect_URI;
            PageReference pageRef = new PageReference(final_EndPoint);
            value=pageRef.getUrl();
        }else{
            value=null;
        }
        return value;
    }
    @AuraEnabled
    public static String getAccessToken(String aouthCode, String relamid ){
        
        Quickbook__c clientData= [select id, Client_id__c , Client_secret__c from Quickbook__c where realmId__c =: relamid];
        System.debug('1 is :'+clientData.Client_id__c + '2 is  '+clientData.Client_secret__c);
        system.debug('relamid is  :'+relamid);
        System.debug('code are here   :'+aouthCode);
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(clientData.Client_id__c+':'+clientData.Client_secret__c));
        String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
        
        String oAuthCode =aouthCode;
        String requestBody = 'grant_type=authorization_code&code='+oAuthCode+'&redirect_uri='+redirect_URI;
        String errorMessage ='';
        String accessToken=null; 
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Basic '+encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        httpRes = http.send(httpReq);
        if(httpRes.getStatusCode() == 200){
            Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
            accessToken =String.valueOf(response_Map.get('access_token'));
            System.debug('token Number are   :'+accessToken);
            System.debug('your current id is there  ::'+clientData.id);
            Quickbook__c updateToken=new Quickbook__c();
            updateToken.id=clientData.id;
            updateToken.Token__c=accessToken;
            update updateToken;                   
            
        }
        return accessToken;
        
    }
    
     @AuraEnabled (cacheable=true)
     public static String  getRegisterNewUser(List<String> objData){
        String value=null;
            List<Quickbook__c> qbooklist=[select Client_id__c from Quickbook__c where Client_id__c=: objData[1] limit 1];
         if(qbooklist.size()>0){
            String authorization_endpoint ='https://appcenter.intuit.com/connect/oauth2';
            String scope = 'com.intuit.quickbooks.accounting';
            String final_EndPoint = authorization_endpoint+'?client_id='+qbooklist[0].Client_id__c+'&response_type=code&scope='+
                scope+'&state=123445633443&redirect_uri='+redirect_URI1;
            PageReference pageRef = new PageReference(final_EndPoint);
            value=pageRef.getUrl();
         }else{
             value=null;
         }
      return value;
    }
     
}