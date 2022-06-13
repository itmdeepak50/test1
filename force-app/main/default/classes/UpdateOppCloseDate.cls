public class UpdateOppCloseDate {
   
    
    
    @AuraEnabled
    public static List<Opportunity> getoppData(){
        
        List<Opportunity> oppList=[select id,name from Opportunity];
        System.debug(opplist);
        
        return oppList;
    }
    
    
     @AuraEnabled
    public static List<Opportunity> updatecloseDate(String accid){
        
        List<Opportunity> oppList1=[select id,name,closedate from Opportunity where Id=:accid];
        System.debug(opplist1);
        
        return oppList1;
    }
     @AuraEnabled
     public static Opportunity closedate(String oppId, Date oppclosedate ){
        
        Opportunity oppInstence=new Opportunity();
         
         oppInstence.Id=oppId;
         oppInstence.CloseDate=oppclosedate;
         update oppInstence;
         return oppInstence;
        
    }
    
    
    
}