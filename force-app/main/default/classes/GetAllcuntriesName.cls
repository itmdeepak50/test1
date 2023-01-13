public class GetAllcuntriesName {
    
    @AuraEnabled 
    public static Map<String,object> getCountriesCode(){
        Http http =new Http();
        HttpRequest request = new HttpRequest();
        String url='https://openexchangerates.org/api/currencies.json';
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('hii I am out of the block');
        List<String> conNameList=new List<String>();
        // If the request is successful, parse the JSON response.
        Map<String ,object> NameMap=new Map<String,object>();
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            System.debug('hii iam in that block');
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('results::: '+results);
            
            /*for(String ab:results.keySet()){
                System.debug(ab);
                conNameList.add(ab);
                
            }*/
            
            NameMap.putAll(results);
            
        }
        //return conNameList;
        return NameMap;
    }
    
   
    @AuraEnabled
    public static String getCuntriesName(String code1,String code2 ,String amount,string apikey){
        String convAmount=null;
        try{    
            Http http =new Http();
            HttpRequest request = new HttpRequest();
            ApiKeys__c key= [select getApikey__c from ApiKeys__c limit 1];
            String url='https://v6.exchangerate-api.com/v6/'+key.getApiKey__c+'/pair';
            url+='/'+code1;
            url+='/'+code2;
            url+='/'+amount;
            
            
            request.setEndpoint(url);
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            System.debug('hii I am out of the block');
            
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                // Deserialize the JSON string into collections of primitive data types.
                System.debug('hii iam in that block');
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                system.debug('results::: '+results);
                System.debug(results.get('conversion_result'));
                
                convAmount=String.valueOf(results.get('conversion_result'));
            }else{
            String url1='https://v6.exchangerate-api.com/v6/'+apikey+'/pair';
            url1+='/'+code1;
            url1+='/'+code2;
            url1+='/'+amount;    
            request.setEndpoint(url1);
            request.setMethod('GET');
            HttpResponse response1 = http.send(request);
            System.debug('hii I am out of the block i else block');
            System.debug(url1);    
                
                if(response1.getStatusCode() == 200) {
                // Deserialize the JSON string into collections of primitive data types.
                System.debug('hii iam in that block in esle block');
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response1.getBody());
                system.debug('results1::: '+results);
                System.debug(results.get('conversion_result'));
                convAmount=String.valueOf(results.get('conversion_result'));
                
                
                } 
                
            }
            
        }catch(Exception e){
            System.debug(e.getLineNumber()+'=================='+e.getMessage());
        }
        return convAmount;
    }
}