public class ControllerForBlueLeafDetailPageVf {
  
    public static String Name;
    public static String Email;
    @AuraEnabled
    public static String getRecords(String id)
    {
        System.debug('Id000 '+id);
        Household__c R1 = [Select Name,Email__c from Household__c where Id =:id];
        System.debug('R1 '+R1);
        if(R1!=null)
        {
            Name = R1.Name;
            Email = R1.Email__c;
           
        }
        System.debug('Name000==== '+Name);
        System.debug('EMail====== '+Email);
        
      try{
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://secure.blueleaf.com/api/v1/households.xml');
        String Apikey = '61c1b6069e26ddffb40c5da130d0171a93a69d24aaba3ca6b897f49e2b89eafc';
        String EncodedAccessToken =  EncodingUtil.Base64Encode(Blob.valueOf(ApiKey));
        req.setHeader('Authorization','Basic '+EncodedAccessToken);
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        String Body;
        if(Email!=null && Name!=null)
        {
         Body = 'email='+EncodingUtil.urlEncode(Email,'UTF-8')+'&full_name='+EncodingUtil.urlEncode(Name,'UTF-8');
        }
        
        req.setBody(Body);
        req.setMethod('POST');
        System.debug('REQUEST');
        httpresponse res = new HttpResponse();
        res=http.send(req);
        String response = '';
        if(res.getStatusCode()==200)
        {
            response = 'Successfully Created';
            System.debug('Request good'+res.getBody());
                    
        }
          else if(res.getStatusCode()==400)
          {
              response = 'Invalid Email Address';
          }
          else if(res.getStatusCode()==409){
              response = 'Email_In_Use';
          }
            
        SYstem.debug('hi '+res.getBody()+'statuscode '+res.getStatusCode()); 
        System.debug('Printingres000 '+response);
        return response;
        }catch(Exception e)
        {
            System.debug('Exception+++> '+e.getMessage()+' LineNumber===> '+e.getLineNumber());
            return e.getMessage();
        }     
        
   }
        
   
}