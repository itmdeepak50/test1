public class getDatafromQuickbook {
    @Auraenabled
    public static boolean  main(String objectName){
        String value=null;
        boolean result =false;
        
        try{
            
            Http http=new Http();
            httprequest req = new httprequest();
           // Quickbook__c   token =[select Token__c from Quickbook__c limit 1];
            String token1 = System.label.Accesstoken;
            //String token1='eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..brsVj50MeeBm18TZxRHfNw.U5szqkGV1zmVXJnJaKnvNle-sHA20Ee-9O8l3hTfArGL3CT4uuMCaNZWkJMvHy9P_Fjv-R1Yd_F7rAuLA05JG7VvSXSPS1iTgqBAIJ7vLafRyi6nBmWOomNJJeNuk3ZutDX3vgBz7Eo9b5JGsZkXpQx6NbyfBgu5e4nAUoX-esGUn9x9dHCJnGHOobRULJF-St4_5Ecu9Ay59nQeHGb-hExjVAlZLJaIVC2yn4kLz0QblkkvqCAaLecgsnoMDIp4xFdIff3LWDprnVjvkh50870B5jcZh_-LMAanWGpgt0j8R7zvfjE6flyXqdKrorswsNVrBLRCGMg4ealUgIF3Rcj5HNMiyTvhiWdpcMRbwkJDYY2XK-_0Lc5t7j6yBk88M7_Oi1eB1LuJS7bbl1l-PNPaANzcn_l2Vkiqw53hebuxPhwmJkCDfF5Ju7Wxr7g8u3BfvAjttJT1n6aDx33lEwgEJHGjMLsFANNTAY3oophzADNZKvxg4JnQBbZzi_x7RJzm7nPG1DbD7n5Sa1kIJn03vsqg8PlnPq-_k6z_jwgXB9nGDaQRB5FE52WVdjU2MsUL446OQ_Qo2MiXYb_Ra_YghnM_ejbZbwS-YTAPo2GjJL61Aibc1RS6ZBLuB22qBvcCzVLGXboBIVbYHQGscMXz4T0NW94vyCuqkgUu1sm0nGf2ga8QHAXFUWlTBDEUyfhrvgnkBVI8btYgvV6_KDmBnGeXqNzz574OCjVOiRCS0vODovEGLIcOwmG6bzJX.JUwAOG9B2WfYxMZYVrMUUQ';
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
                result=QuickbookAccountData.mapAccData(value);
             
              
            }else{
                system.debug('Hii your responce was not reddy');    
                system.debug(res.getStatusCode());
            }
        }catch(Exception e){
            System.debug(e.getMessage()+'>>>>>>>>>>>>>>>>>>>>>'+e.getLineNumber());
        } 
    return result;
    }
}