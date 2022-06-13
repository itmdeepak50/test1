public class SerilizeAccountUpdate {

    public static String serAccupdate(List<Account__C> accList){
      wrapperAccData wrAcdata=new wrapperAccData();
        wrAcdata.Name=accList[0].Name;
        wrAcdata.AccountType=accList[0].Accounttype__c;
        wrAcdata.Id=accList[0].ExternalId__c;
        wrAcdata.SyncToken=accList[0].SyncToken__c;
        String str=Json.serialize(wrAcdata);
        PostQuickAccData.PostAccupdateData(str);
        System.debug(str);
        return str;
    }
    
    
    public class wrapperAccData{
        public String Name;
        public String AccountType;
        public String Id;
        public String SyncToken;
        
    }
    
}