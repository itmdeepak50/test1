public class BatchQue7DeleteOpportunitycreationJob {

     public static void deleteOpportunityCreationJob(){
        try{
        Id detailId = [SELECT Id FROM CronJobDetail WHERE Name='run 4 Time every 6 hour'][0].Id;
        if (detailId != null) {
            Id jobId = [SELECT Id from CronTrigger WHERE CronJobDetailId = :detailId][0].Id;
            System.abortJob(jobId);
        }
        }catch(Exception e){
            
            System.debug(e.getLineNumber()+'>>>>>>'+e.getMessage());
        } 
    }
    
    
}