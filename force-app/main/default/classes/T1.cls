public class T1 {
    public static void main(list<Household__C>HouseholdList)
    {
        try{
            set<Id> AccountIds = new set<Id>();
            
            for(Household__c Hou : HouseholdList)
            {
                AccountIds.add(Hou.Id);
            }
            
            List<House_Hold_Link__c>HouseholdAccountList = [Select Id,Name, HouseHold_id__c, House_Hold_Link__c.HouseHold__r.Matched_Account__c,Account_Type__c from House_Hold_Link__c 
                                                            where House_Hold_Link__c.HouseHold__r.Matched_Account__c!=null And House_Hold_Link__c.HouseHold__c In :AccountIds];
            
            list<SalesforceRecordType__c>CustomSettinglist = [Select Name,SalesforceData__c from SalesforceRecordType__c];
            map<String,String>BlueLeafMap = new map<String,String>();
            for(SalesforceRecordType__c s1 : CustomSettinglist)
            {
                BlueLeafMap.put(s1.name,s1.SalesforceData__c);
            }
            
            System.debug('m1==> '+BlueLeafMap);
            
            list<Contact>conlist = new list<Contact>();
            System.debug('HouseholdAccountList==> '+HouseholdAccountList);
            
            list<contact>FailedContactList = new list<Contact>();
            
            if(HouseholdAccountList.size()>0)
            {
                for(House_Hold_Link__c HA1 : HouseholdAccountList)
                {
                    Contact con = new Contact();
                    con.LastName = HA1.name.SUBSTRING(0,2);
                    if(BlueLeafMap.containsKey(HA1.Account_Type__c))
                    {
                        con.RecordTypeId =  Schema.SObjectType.Contact.getRecordTypeInfosByName().get(BlueLeafMap.get(Ha1.Account_Type__c)).getRecordTypeId();
                        System.debug('RecordTypeId==> '+con.RecordTypeId);
                        con.AccountId = HA1.Household__r.Matched_Account__c;
                        conlist.add(con);
                        
                    }
                    else if(!BlueLeafMap.containsKey(HA1.Account_Type__c))
                    {
                        FailedContactList.add(con);
                    }
                    else if(HA1.Account_Type__c == null)
                    {
                        FailedContactList.add(con);
                    }
                }
            }
            
            System.debug('conlis===> '+conlist);
            
            if(conlist.size()>0)
            {
                //    Upsert conlist;
            }
            
        }catch(Exception e)
        {
            System.debug('Exception==> '+e.getMessage()+' '+e.getLineNumber());
        }
    }
}