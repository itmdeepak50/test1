global class SchedulBatchQue5 implements Schedulable {
   
    global void execute(System.SchedulableContext sc ) {
       
        /*Passing today date to the Batch Class
        Date.today() Returns the current date in the current user's time zone.*/
     BatchApexExample btt=new BatchApexExample();
     Database.executeBatch(btt);

       
    }
   
}