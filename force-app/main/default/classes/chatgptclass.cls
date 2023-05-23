public with sharing class chatgptclass {
    @AuraEnabled
    public Static String getQueryData(String searchString) {
        String ENDPOINT = 'https://api.openai.com/v1/completions';
        String key ='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';
        String orgid='org-WLODe1muSIuZZbPJNGoTEOYs';
        Http http = new Http();
        String reqBody = '{"model": "text-davinci-003","prompt":"'
            +searchString+
            '","max_tokens": 4000,"temperature": 0,'
            +'"stream": false,"top_p": 1}';
        System.debug('Query '+searchString+' '+reqBody);
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ENDPOINT);
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer '+String.escapeSingleQuotes(key).trim());
        request.setHeader('OpenAI-Organization',String.escapeSingleQuotes(orgid).trim());

        request.setTimeout(120000);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(reqBody);
        HttpResponse response = http.send(request);
        System.debug('Request body' +request);
       String body = response.getBody();
        
       System.debug('Response body is   :: '+body+'response code is '+response.getStatusCode());
        return body;




    }
}