public class BatchQue4DeleteAccountDeletionJob {
    
    public static void deleteAccountJob(){
        try{
        Id detailId = [SELECT Id FROM CronJobDetail WHERE Name='delete Account evrey day at 12:00'][0].Id;
        if (detailId != null) {
            Id jobId = [SELECT Id from CronTrigger WHERE CronJobDetailId = :detailId][0].Id;
            System.abortJob(jobId);
        }
        }catch(Exception e){
            
            System.debug(e.getLineNumber()+'>>>>>>'+e.getMessage());
        } 
    }
    
}