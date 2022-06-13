trigger InsertAccount on Account__c (before insert,after insert, after update) {

    if(trigger.isafter && trigger.isinsert){
        List<String> AccList=new List<String>();
        String Name;
        String AccountType;
        id ids;
        for(Account__c ab: trigger.new){
            Name=ab.Name;
            AccountType=ab.AccountType__c;
            ids =ab.Id;
        }
        Accountids__c acc_id=[select id from Accountids__c limit 1];
        Accountids__c acid=new Accountids__c();
        acid.Accountid__c= ids;
        acid.id=acc_id.id;
        system.debug('custom setteing ids'+acid);
        update acid;
        
         
        AccList.add(Name);
        AccList.add(AccountType);
        PostQuickAccData.PostAccData(AccList);
        
     
        
    }else if(trigger.isafter && trigger.isupdate){
        if(UserInfo.getUserName()=='soni@cloudanalogy.com'){
            if(trigger.old[0].ExternalId__c!=null){
            
            System.debug('hey you are eeqursion form');
            
            List<Account__c> accupdate=new List<Account__c>();
            Account__c accupdateInstence =new Account__c();
            accupdateInstence.Name=trigger.new[0].Name;
            accupdateInstence.AccountType__c=trigger.new[0].AccountType__c;
            accupdateInstence.ExternalId__c=trigger.new[0].ExternalId__c;
            accupdateInstence.SyncToken__c=trigger.new[0].SyncToken__c;
            accupdate.add(accupdateInstence);
            
             /*Accountids__c acc_id=[select id from Accountids__c limit 1];
             Accountids__c acid=new Accountids__c();
             acid.Accountid__c= trigger.new[0].Id;
             acid.id=acc_id.id;
             system.debug('custom setteing ids'+acid);
             update acid;*/
             SerilizeAccountUpdate.serAccupdate(accupdate);
        }
        }
    }
    
    
}