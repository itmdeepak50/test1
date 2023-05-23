public class TestingBluelivApi {
    @AuraEnabled
    public static String main(String ApiKey){
        try{
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://secure.blueleaf.com/api/v1/advisor.xml');
        String EncodedAccessToken =  EncodingUtil.Base64Encode(Blob.valueOf(ApiKey));
        req.setHeader('Authorization','Basic '+EncodedAccessToken);
        req.setMethod('GET');
     //   System.debug('REQUEST');
        httpresponse res = new HttpResponse();
        res=http.send(req);
        String response = '';
      //  System.debug('responsebody99 '+res.getBody());
        if(res.getStatusCode()==200)
        {
            response = 'Successfully AUthenticated';
       //     System.debug('Request good'+res.getBody());
                
        }
           
            return response;
        }catch(Exception e)
        {
            System.debug('Exception+++> '+e.getMessage()+' LineNumber===> '+e.getLineNumber());
            return 'Something Went wrong';
        }
    }
    
     @AuraEnabled
    public static String main2(String ApiKey){
        try{
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://secure.blueleaf.com/api/v1/households.xml');
        String EncodedAccessToken =  EncodingUtil.Base64Encode(Blob.valueOf(ApiKey));
        req.setHeader('Authorization','Basic '+EncodedAccessToken);
        req.setMethod('GET');
        System.debug('REQUEST');
        httpresponse res = new HttpResponse();
        res=http.send(req);
        String response = '';
        if(res.getStatusCode()==200)
        {
            response = 'Successfully Authenticated';
          //  System.debug('Request good'+res.getBody());
            String xml = res.getBody();
            System.debug('xml '+xml);
            if(xml!=null)
            {
                XmlParsingBlueleaf xx = new XmlParsingBlueleaf(xml);
            }
                
        }
            
            
        return response;
        }catch(Exception e)
        {
            System.debug('Exception+++> '+e.getMessage()+' LineNumber===> '+e.getLineNumber());
            return 'Something Went wrong';
        }
    }
    
       
    
}