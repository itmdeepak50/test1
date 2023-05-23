@RestResource(urlMapping='/testr/*')
global With Sharing class RestApiExample {

    @HttpPost
    global static String Demo(){
        String data;
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            data= request.requestBody.toString();
       return data;
    }
    
    
    
}