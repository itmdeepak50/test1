public class Script4_harshitTriggerOnOpportunity {

    public static void stopUpdatingOpportunity(List<Opportunity> oppList){
        
        Set<Id> AccId=new Set<Id>();
        
        for(Opportunity var:oppList){
            AccId.add(var.AccountId);
        }
        List<Account> accRecord=new List<Account>([SELECT id FROM Account WHERE id IN: AccId AND Working_in__c='Asia']);
        List<Opportunity> oppRecord=new List<Opportunity>([SELECT AccountId,id FROM Opportunity WHERE Accountid IN:accRecord AND StageName='Closed Won']);
        Map<id,List<Opportunity>> OppMap=new Map<id,List<Opportunity>>();
        
        
    }
    
}