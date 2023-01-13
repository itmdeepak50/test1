public class oAuthConnection {
    public static String clientId ='617232843102';
    public static String clientSecret = '64a2ef751b73406bbdd30aba6a78fc567464a714cd562c8e96';   
    @AuraEnabled
    public static Map<String, String> connectToMailchimp () {
        Map<String, String> returnMap = new Map<String, String>();
        try{
            
            String redirectURI = 'https://cloudanalogy-5ca-dev-ed.lightning.force.com/c/Applications.app';
            String url= 'https://login.mailchimp.com/oauth2/authorize';
            url+='?response_type=code&client_id='+clientId+'&redirect_uri='+ EncodingUtil.urlEncode(redirectURI, 'UTF-8');
            returnMap.put('url',url);
        } catch(Exception ex) {
            system.debug('Exception Error');
            system.debug(ex.getLineNumber()+':'+ex.getMessage()+':'+ex.getCause());
            returnMap.put('Error','Exception error while generating url'+'Line:'+ex.getLineNumber()+':Message '+ex.getMessage()+': Cause '+ex.getCause());
        }
        return returnMap;
    }   
    @AuraEnabled
    public static String doFetchAccessToken(String code, String redirectUri){
               
        String getTokenEndpoint = 'https://login.mailchimp.com/oauth2/token';
        String oAuthCode = code;
        String requestBody = 'grant_type=authorization_code&client_id='+clientId+'&client_secret='+clientSecret+'&redirect_uri='+EncodingUtil.urlEncode(redirectUri, 'UTF-8')+'&code='+code;
        String errorMessage ='';
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(getTokenEndpoint);
        httpReq.setBody(requestBody);
        
        try{
            httpRes = http.send(httpReq);
            
            if(httpRes.getStatusCode() == 200){
                Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                system.debug('response: '+httpRes.getBody());
                return String.valueOf(response_Map.get('access_token'));
            }else{
                system.debug('Unexpected Error with Mailchimp API'+
                             'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode());
            }
        }catch(System.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint'
                    +'Goto Remote Site Setting and add '+' '+ getTokenEndpoint +' Endpoint';
                system.debug( errorMessage);
                //return null;
            }else{
                errorMessage = 'Unexpected Error'
                    +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
                system.debug(errorMessage);
                //return null;
            }
        }
        return httpRes.getBody();
    }
}