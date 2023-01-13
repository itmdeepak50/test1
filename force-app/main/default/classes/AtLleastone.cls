public class AtLleastone {

    public static void main(){
      List<Opportunity> oppList=[select  AccountId from Opportunity where hasOpportunityLineItem=true And  AccountId!=null];
      List<Opportunity> oppList1=[select  AccountId from Opportunity where hasOpportunityLineItem=false And  AccountId!=null];
        for(Opportunity opp: oppList){
            integer i=0;
            for(Opportunity opp1 : oppList1){
               if(opp.AccountId==opp1.AccountId){
                //opplist[i].AccountId='';
                  oppList[i].clear();
               }
            }
            i++;
        }
   System.debug(oppList);
    }
    
}