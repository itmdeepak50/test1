public class BlueLeafBatchFile implements Database.Batchable<sObject> {
    public List<Household__c> HouseholdList;
    public BlueLeafBatchFile(List<Household__c> objList){
        this.HouseholdList = objList;
}
    public List<HouseHold__c> start(Database.BatchableContext BC) {
        return HouseholdList;
    }
    
    public void execute(Database.BatchableContext bc, List<Household__c> record){
        try{
            upsert(record) ;
           }
        catch(Exception e)
        {
            System.debug('Line '+e.getLineNumber()+'Exception=== '+e.getMessage());
        }
        
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('List Successfully Inserted');

    } 
    
    
}