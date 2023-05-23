public class HelperforCreateHouseholds {    
    public static void helperMethod(list<Household__c> HouseholdList){
        
        set<Id> AccountIds = new set<Id>();
        
        for(Household__c Hou : HouseholdList)
        {
            if(Hou.Matched_Account__c!=null)
            {
                AccountIds.add(Hou.Matched_Account__c);
            }
        }
        
        list<House_Hold_Link__c> HouseholdAccountList = [Select Id,name,Household__r.Matched_Account__c,Account_Type__c,Household_Id__c from House_Hold_Link__c 
                                                         where Household__c In (Select Id from Household__c where Matched_Account__c =:AccountIds)];
       
        list<SalesforceRecordType__c>CustomSettinglist = [Select Name,SalesforceData__c from SalesforceRecordType__c];
        map<String,String>BlueLeafMap = new map<String,String>();
        for(SalesforceRecordType__c s1 : CustomSettinglist)
        {
            BlueLeafMap.put(s1.name,s1.SalesforceData__c);
        }
        
        System.debug('m1==> '+BlueLeafMap);
        
        list<Contact>conlist = new list<Contact>();
        SYstem.debug('HouseholdAccountList==> '+HouseholdAccountList[0].Household_Id__c);
        
        if(HouseholdAccountList.size()>0)
        {
            for(House_Hold_Link__c HA1 : HouseholdAccountList)
            {
                for(Household__c H1 : HouseholdList)
                {
                    if(H1.Household_Id__c == Ha1.Household_Id__c)
                    {
                        Contact con = new Contact();
                        con.LastName = HA1.name.SUBSTRING(0,2);
                        con.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(BlueLeafMap.get(Ha1.Account_Type__c)).getRecordTypeId();
                        con.AccountId = HA1.Household__r.Matched_Account__c;
                        conlist.add(con);
                    }
                }
            }
        }
        
        System.debug('conlis===> '+conlist);
        
        if(conlist.size()>0)
        {
            Upsert conlist;
        }
    
    }
    
}