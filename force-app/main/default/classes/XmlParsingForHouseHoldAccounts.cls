public class XmlParsingForHouseHoldAccounts {

       
    public static List<AccountData> ParseAccountsData(String xml){
        
         List<AccountData> data = new List<AccountData>();
            Dom.Document doc = new Dom.Document();
            doc.load(xml);
            DOM.XmlNode rootNode=doc.getRootElement();
            DOM.XmlNode []all = rootNode.getChildelements();
            DOM.XmlNode []acc;
            

            list<Household__c> Householdlist = new list<Household__c>();

            for(DOM.XmlNode child : all)
            {    
                if(child.getName()=='accounts'){
                    acc = child.getChildElements();
                   System.debug('RIGHT');
                }
               
             
            }    
        AccountData accdata;
        for(DOM.XmlNode ab : acc){
            accdata = new AccountData();
            accdata.process(ab);
            data.add(accdata);
        }
        
    System.debug('ALL NODES DATA ARE:: '+data);
        return data;
}
    
    public class AccountData{
      public  String currentNetvalue;
      public  String id;
      public  String lastupdate;
      public String name;
      public  String institutionName;
      public  String institutionId;
      public  String accountNumber;
     public   String value;
      public  String period;
      public  String accTypename;
        public void process(DOM.XmlNode inNode){
          AccountType acctype;
          Balance balancedata;
          for(Dom.XmlNode innerNode :inNode.getChildElements())
              
              if(innerNode.getName()=='current-net-value'){
                  
                  currentNetvalue = innerNode.getText();
                  
              }else if(innerNode.getName()=='id'){
                  
                   id = innerNode.getText();
                  
              }else if(innerNode.getName()=='last-update'){
                  lastupdate = innerNode.getText();
                  
              }else if(innerNode.getName()=='name'){
                  name = innerNode.getText();
                  
              }else if(innerNode.getName()=='institution-name'){
                  institutionName = innerNode.getText();
                  
              }else if(innerNode.getName()=='institution-id'){
                  institutionId = innerNode.getText();
                  
              }else if(innerNode.getName()== 'account-number'){
                  
                      accountNumber = innerNode.getText();
                 
              }else if(innerNode.getName()=='balance'){
                  balancedata = new Balance();
                  balancedata.getBalance(innerNode);
                  value = balancedata.value;                 
                  period = balancedata.period;
                  
              }else if(innerNode.getName()=='account-type'){
                  acctype = new AccountType();
                  acctype.getAccountType(innerNode);
                  accTypename = acctype.name;
              }
           }    
       }
    
    public class Balance{
         String value;
         string period;
        public void getBalance(DOM.XmlNode node){
            for(DOM.XmlNode innerNode : node.getChildElements() ){
                
                if(innerNode.getName()=='value'){
                    value = innerNode.getText();
                    
                }else if(innerNode.getName()=='period'){
                    period = innerNode.getText();
                }
            }
            
        }
        
    }
    
    public class AccountType{
        String name;
        public void getAccountType(DOM.XmlNode node){
            
            for(DOM.XmlNode innerNode :node.getChildElements()){
                if(innerNode.getName()=='name'){
                    name = innerNode.getText();
                }
                
            }
            
        }
        
    }
    
}