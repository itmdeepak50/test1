@RestResource(urlMapping='/api/v1')
global without sharing class WebhookQuickBookPost {
 	@Httpget
    global static void handleRequest(){
        String a=null;
        String b='hii, this is deepak soni';
        RestResponse response = RestContext.response;
        try{
            RestRequest request = RestContext.request;
            a= request.requestBody.toString();
           
            //response.responseBody=bb;
            //response.statusCode=200;
            
            //getDatafromQuickbook.main('Account');
            //deserilizedwebhookResponse.deserilizedData(a);
            System.debug('Body are get method::'+a);
        }catch(Exception e){
            System.debug('Excepetion Happend::'+e.getMessage());
        }
    }
    
    
    
    @HttpPost
    global static String handlepostRequest(){
        String a=null;
        String b='hii, this is deepak soni';
        RestResponse response = RestContext.response;
        try{
            RestRequest request = RestContext.request;
            a= request.requestBody.toString();
            System.debug('Request has been inserted into bibuket>>><>>>>>>>'+a);
            DesrilizepullRequest bitpull = DesrilizepullRequest.parse(a);
            DesrilizepullRequest.cls_author authorinfo = bitpull.pullrequest.author;
            DesrilizepullRequest.cls_destination commitinfo = bitpull.pullrequest.destination;         
            
            
            BitbuketPullRequest__c bitbuket =new BitbuketPullRequest__c();
            bitbuket.name='Test Request';
            bitbuket.commits__c=bitpull.pullrequest.description;
            bitbuket.Pull_Name__c=authorinfo.display_name;
            insert bitbuket;

           
            //response.responseBody=bb;
            //response.statusCode=200;
            
            //getDatafromQuickbook.main('Account');
            //deserilizedwebhookResponse.deserilizedData(a);
          
            /*System.debug('Body are ::'+request.params);
            Map<string,String> m=new Map<string,String>(request.params);
            System.debug('Map data are '+ m.get('data[merges][EMAIL]'));  
            System.debug('Map value are ' + m);*/
            
        }catch(Exception e){
            System.debug('Excepetion Happend::'+e.getMessage());
        }
       return 'Deepak';
    }
    
    
    public class Name{
        public String name;
    } 
    
    
    
    
}