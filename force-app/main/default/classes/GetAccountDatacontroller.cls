public class GetAccountDatacontroller {
    
    @AuraEnabled
    public static string getDataAccountDataFromBlueLeaf(String RecordId){
        try{
        System.debug('RecordId====> '+RecordId);
        String resp = '';
        String ApiKey ='61c1b6069e26ddffb40c5da130d0171a93a69d24aaba3ca6b897f49e2b89eafc';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        household__c hs = [Select Household_Id__c from Household__c where Id=:RecordId];
        req.setEndpoint('https://secure.blueleaf.com/api/v1/households/'+hs.Household_Id__c+'.xml');
        String EncodedAccessToken =  EncodingUtil.Base64Encode(Blob.valueOf(ApiKey));
        req.setHeader('Authorization','Basic '+EncodedAccessToken);
        req.setMethod('GET');
        System.debug('REQUEST');
        httpresponse res = new HttpResponse();
        res=http.send(req);
        if(res.getStatusCode()==200){
        list<XmlParsingForHouseHoldAccounts.AccountData>Accountdatalist = XmlParsingForHouseHoldAccounts.ParseAccountsData(res.getBody());
            GetAccountDatacontroller.CreatelistOfAccountData(Accountdatalist,RecordId);
            resp = resp+'Successful';
        }
        else{
            resp = resp+'Unsuccessful';
        }
        return resp;
      }
        catch(Exception e)
        {
            System.debug('Exception====> '+e.getLineNumber()+'Message==> '+e.getMessage());
            return e.getMessage();
        }
      //  return resp;
    }
    
    @AuraEnabled
    public static void CreatelistOfAccountData(list<XmlParsingForHouseHoldAccounts.AccountData> Aclist,String RecordId){
        
        list<House_Hold_Link__c> HouseHoldlinklist = new list<House_Hold_Link__c>();
        for(XmlParsingForHouseHoldAccounts.AccountData xv : Aclist)
        {
            House_Hold_Link__c hh = new House_Hold_Link__c();
            hh.Account_Number__c = xv.accountNumber;
            hh.Account_Type__c = xv.accTypename;
            hh.Currentnetvalue__c = Decimal.valueOf(xv.currentNetvalue);
            hh.Id__c = xv.id;
            hh.Institution_Id__c = xv.institutionId;
            hh.Institution_Name__c = xv.institutionName;
            hh.Period__c = Date.valueOf(xv.period);
            hh.Value__c = Decimal.valueOf(xv.value);
           // hh.Last_Update__c = Datetime.valueOf(xv.lastupdate);
            hh.Name = xv.name;
            hh.Household__c = RecordId;
            HouseHoldlinklist.add(hh);
        }
        Database.upsert(HouseHoldlinklist, House_Hold_Link__c.Id__c);
        
        
    }
  
}