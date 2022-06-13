public class Script2_harshit {
    
    public static void main(){
        try{
        List<Opportunity> opp_list=new List<Opportunity>();
        for(OpportunityContactRole opp: [SELECT ContactId ,OpportunityId FROM OpportunityContactRole WHERE Opportunityid!=null]){
            for(Contact con:[SELECT id,Accountid from Contact where Accountid!=null]){
                if(opp.ContactId==con.id){
                    Opportunity op_obj=new Opportunity();
                    op_obj.id=opp.OpportunityId;
                    op_obj.Same_Contact__c=true;
                    opp_list.add(op_obj);
                }  
                }
            }
            update opp_list;
            System.debug(opp_list);
        
       
        
      }catch(Exception e){
            System.debug(e.getLineNumber()+'>>>>>>>>>>>'+e.getMessage());
        }
            
    }
}