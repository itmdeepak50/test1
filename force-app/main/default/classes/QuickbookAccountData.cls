public class QuickbookAccountData {
    
    
    public static boolean mapAccData(String accData)
    {    
      
        System.debug('work from home'+accData);
        boolean chek=false;
        boolean status=false;
         List<Account__c> AccInsertList=new List<Account__c>();
        
        Map<String,Object> datamap=new Map<String,object>();
        Map<String,Object> currencyRefrence=new Map<String,object>();
        Map<String,Object> currencyRefrence1=new Map<String,object>();
        
        
        Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(accData);
        datamap =(Map<String,Object>) response_Map.get('QueryResponse');
        System.debug('hii value are here');
        System.debug('value to late::'+datamap);
        
        
        // accMap =(Map<String,Object>) response_Map.get('Account');
        List<Object> AccList =(List<Object>) datamap.get('Account');
       
        
        for(integer i=0;i<AccList.size();i++){
            Account__c accInstence =new Account__c();
            currencyRefrence = (Map<String,Object>) AccList[i]; 
            accInstence.Name=  String.valueOf(currencyRefrence.get('Name'));
            accInstence.AccountType__c= String.valueOf(currencyRefrence.get('AccountType'));
            accInstence.CurrentBalance__c=String.valueOf(currencyRefrence.get('CurrentBalance'));
            accInstence.ExternalId__c= String.valueOf(currencyRefrence.get('Id'));
            accInstence.Status__c=boolean.valueOf(currencyRefrence.get('Active'));
            accInstence.SyncToken__c=string.valueOf(currencyRefrence.get('SyncToken'));
            AccInsertList.add(accInstence);
             
            
        }
        for(Account__c ab: AccInsertList){
            System.debug('ids are '+ ab.ExternalId__c);
        }
           System.debug('Final List Size :: '+ AccInsertList.size());
           Database.upsert(AccInsertList, Account__c.ExternalId__c,false);
           //upsert AccInsertList ExternalId__c;
           chek=true;
        
        if(chek){
            status=true;
        }else{
            status=false;
        }
        
           return status;
        
    }
    
    public static void dserelizedAccountData(String value){
    
     Map<String,object> response_map1 =new Map<String ,object>();   
     Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(value);
     response_map1=(Map<String,object>) response_map.get('Account');
     System.debug(response_map1.get('Id'));
     String ids = String.valueOf(response_map1.get('Id'));
     String SyncToken=String.valueOf(response_map1.get('SyncToken'));  
     System.debug('get Account '+value);
        System.debug('token value '+SyncToken);
     AccountUpdation.updateAccount(ids,SyncToken);        
    }
    
}