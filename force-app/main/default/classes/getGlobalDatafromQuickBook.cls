public class getGlobalDatafromQuickBook {
    
    public static void getDatafrom(String ids){
        String value=null;
         try{
             
            Http http=new Http();
            httprequest req = new httprequest();
           // Quickbook__c   token =[select Token__c from Quickbook__c limit 1];
            String token1='eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..1dFXnTyFBaug-lIxjjRuow.qmbrcKITOCgF4j72xpjRSQZW0J799-yAlXrENIz2T-apLqg_AQRno1lsAJj7GgIOP2tXc1qipGoVi_svVkFT_-XQLq-GPcaXzXBACphH3N7SgHDWnOpWIIHAiYBOeysxFMokwcQU8ZA-GEez5hTkpQZQQkGIJ55KhdSDCfrDTD8rc-nlcSLUGKiP3jmUNyg9Hjx2NmCbHyxoH9Kqi7spY_nytQl39lRj_c3WWss-GFWntIFKlnYfgaln7gXjFH3oRQqgJ9djjRzpmyNZs6T7Vt7NkpM83fc3TSPl7BsVL84rPew9yjbG2JBas4pSRmiz-DwFv8wW5C1ZDyW0bYwAceSCzirPbUNgEm9HZ6cLIfWSW5La9dILlJoxZhbvxzMIH8pwiMqBw4jxq71jaieOFmD6gAuah2KO4EgVnjF8_Gl0VI1sFgvRhOiMQy5kIAhTSUDMzWn3Nl8bS8TIKqGQGsH9TeFt2d_Zvo-6Cmna_MBabnAHoP2hBk1umaQSuBLnjm-l6RyazxlDkojUuZi3ycwJZGWSCnRdu1sfD83UOm7AvFUiZOoqzQIG81DBhr4ksTqqiNGBLyWRyzMgSDCArc-nUIrnF4LQD2UAAXwk54DPwF9dVTzXPFiawb3-gc40vqMASu2h1089QaiF7xFwtv-4o642LfDW79VhPlaX-wOrIeI9CUJ6EW0ipglnXXX-Cv42DpsGUvQfrdXNZRvF8u1Xh1mm9J5w37ImJkp0Z5aBSZviEA3TxZWxlGh9tndf.C05uwMMffHgG-4wGLZG_mg';
            System.debug(token1);
            // req.setEndpoint('https://na1.salesforce.com/services/data/v20.0/');
            
          
            req.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365200552330/account/'+ids+'?minorversion=62');
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