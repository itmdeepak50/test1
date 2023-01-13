public class addMemberInmailchimps {
    
    public static void addMember(){
        
        String str='{"status": "subscribed",  "merge_fields":{"FNAME": "testCa","LNAME":"test","PLANINFO":"you get a travel plan with couple($680)"},"email_address":"test123@logdots.com"}';
        HttpRequest req = new HttpRequest();
        String endpoint = 'https://us6.api.mailchimp.com/3.0/lists/a908257055/members/';
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json'); 
        req.setBody(str);
        String username = 'deepak';
        String password = '39c6720a01ef98017335e19c6f35d76d-us6';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' +EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        System.debug(authorizationHeader);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
   
        if(res.getStatusCode()==200){
            
            System.debug(res.getBody());
            
        }  else{
            System.debug(res.getBody());
            System.debug('status was recorded'+res.getStatusCode());
        }   
        
     
    }
    
}