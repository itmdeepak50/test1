public class XmlParsingBlueLeafAccountsandHoldings {
    public static String getAccounts(){
            try{
            String Apikey = CustomSettings.getAuthneticationKey();
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://secure.blueleaf.com/api/v1/households.xml?page=0');
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
                ParseXmlHouseholds xx = new ParseXmlHouseholds();
                xx.XmlparsingPostHouseholdData(xml);
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