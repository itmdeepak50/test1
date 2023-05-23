public class ParseXmlHouseholds {
    List<Household__c> Householdlist = new List<Household__c>();
	List<House_Hold_Link__c> HouseholdAccountList = new List<House_Hold_Link__c>();
    
    public void XmlparsingPostHouseholdData(String xml){
        //System.debug('IN XmlparsingPostHouseholdData  ' +xml);
        
        try{
            Dom.Document doc = new Dom.Document();
            doc.load(xml);
            DOM.XmlNode rootNode=doc.getRootElement();
            DOM.XmlNode []all = rootNode.getChildelements();
            
            for ( Dom.XMLNode childElement : all) {
                String Id;
                
                system.debug('First Loop ==> '+childElement.getName() + '-' + childElement.getText());
                
                
                if(childElement.getName()=='household'){
                    //accountData(childElement.getChildElements());
                    if(childElement.getChildElements().size()>0){
                        System.debug('Success');
                    }
                    this.recursion(childElement.getChildElements(), childElement.getName(), '');
                }
            }
            
            /*for(Household__c h : HouseholdList1){
                System.debug('h => '+h);
            }*/
            Schema.SObjectField externalId = HouseHold__c.Fields.HouseHold_Id__c;
            Database.upsert(this.HouseholdList, externalId, false);
            
            /*for(House_Hold_Link__c haaaa : HouseholdAccountList1){
                System.debug('haaaa => '+haaaa);
            }*/
            Schema.SObjectField externalId1 = House_Hold_Link__c.Fields.Id__c;
            Database.upsert(this.HouseholdAccountList, externalId1, false);
            
        }catch(Exception e)
        {
            System.debug('Line==> '+e.getLineNumber()+'Exception==> '+e.getMessage());
        }
    }
    
    
    public void recursion(DOM.XmlNode[] childData, String name, String temp){
        list<DOM.XmlNode>accountElementsData = new list<DOM.XmlNode>();
        System.debug('\nname => '+name);
        
        
        if(name == 'household'){
            Household__c H1 = new Household__c();
            for(DOM.XmlNode HouseholdInstance : childData)
            {
                System.debug('		=> '+H1);
                if(HouseholdInstance.getName()=='email')
                {
                    H1.Email__c = HouseholdInstance.getText();
                }
                if(HouseholdInstance.getName()=='first-name')
                {
                    H1.First_Name__c = HouseholdInstance.getText();
                }
                
                else if(HouseholdInstance.getName()=='full-name')
                {
                    H1.Name = HouseholdInstance.getText();
                }
                
                else if(HouseholdInstance.getName()=='id')
                {
                    H1.Household_Id__c = HouseholdInstance.getText();
                }
                
                else if(HouseholdInstance.getName()=='last-name')
                {
                    H1.Last_Name__c = HouseholdInstance.getText();
                }
                /*if(HouseholdInstance.getName()=='accounts')
                {
                    accountInsideData(HouseholdInstance.getChildElements());
                }*/
                else if(HouseholdInstance.getName() == 'accounts'){
                    System.debug('		Inside its Accounts == ');
                    if(HouseholdInstance.getChildElements().size() > 0){
                        this.recursion(HouseholdInstance.getChildElements(), 'accounts', H1.Household_Id__c);
                    }
                    //this.recursion(HouseholdInstance.getChildElements()[0].getChildElements(), 'account', (String)H1.Household_Id__c);
                }
            }
            System.debug('\n\n		=>'+H1);
            this.Householdlist.add(H1);
        }
        
        else if(name == 'accounts'){
            for(DOM.XmlNode acc : childData){
                this.recursion(acc.getChildElements(), 'account', temp);
            }
            //this.recursion(accountNodeData, 'account', temp);
        }
        
        else if(name == 'account'){
            
            House_Hold_Link__c HA1 = new House_Hold_Link__c();
            HA1.Household_Id__c = temp;
            for(DOM.XmlNode AccountInstance : childData)
            {
                if(AccountInstance.getName()=='current-net-value'){
                    HA1.Currentnetvalue__c = Decimal.valueOf(AccountInstance.getText());
                }
                
                else if(AccountInstance.getName()=='id'){
                    HA1.Id__c = AccountInstance.getText();
                    HA1.Household__r = new Household__c(Household_Id__c = temp);
                }
                
                else if(AccountInstance.getName()=='last-update'){
                    HA1.Last_Update__c = Date.valueOf(AccountInstance.getText());
                }
                
                else if(AccountInstance.getName()=='name'){
                    HA1.name = AccountInstance.getText();
                }
                
                else if(AccountInstance.getName()=='institution-name'){
                    HA1.Institution_Name__c = AccountInstance.getText();
                }
                
                else if(AccountInstance.getName()=='institution-id'){
                    HA1.Institution_Id__c = AccountInstance.getText();
                }
                
                else if(AccountInstance.getName()=='account-number'){
                    HA1.Account_Number__c = AccountInstance.getText();
                }
                
                else if(AccountInstance.getName()=='balance'){
                    System.debug('		Inside its Balance');
                    DOM.XmlNode value = AccountInstance.getChildElement('value',null);
                    DOM.XmlNode period = AccountInstance.getChildElement('period',null);
                    
                    HA1.Value__c = Decimal.valueOf(value.getText());
                    HA1.Period__c = Date.valueOf(period.getText());
                }
                
                else if(AccountInstance.getName()=='account-type'){
                    System.debug('		Inside its Account-type');
                    DOM.XmlNode accType = AccountInstance.getChildElement('name',null);
                    HA1.Account_Type__c = accType.getText();
                }
                System.debug('		=>		=> '+HA1);
                
            }
            System.debug('		=>'+HA1+'\n\n\n\n');
            this.HouseholdAccountList.add(HA1);
        }
        else{
            this.recursion(childData[0].getChildElements(), '', '');
        }
        

    }
    
    
    
  
    
}