public class OpportunityWrapperClass {
    public static void main(){
        Wrapper wr =new Wrapper(); 
        Opportunity opp=[select name,stageName from Opportunity where id='0065g00000CRKn6AAH'];
        List<OpportunityLineItem> opplinelist=[select Name ,Quantity from OpportunityLineItem where OpportunityId =: opp.Id];
        wr.Name=opp.Name;
        wr.StageName=opp.StageName;
        wr.create(opplinelist);
        string str=Json.serialize(wr);
        System.debug('Json Data:: '+str); 
    }
    
        public class Wrapper {
        public String Name;
        public string StageName;
        public List<OppLine> opplinelist ;
            
            public void create(List<OpportunityLineItem> oplist){
                opplinelist = new List<OppLine>();
                for(OpportunityLineItem opp: oplist){
                 Oppline o = new Oppline();
                 o.Name=opp.Name;
                 o.Quantity=Integer.valueOf(opp.Quantity);
                 opplinelist.add(o);
                }
                
            }
        
    }
    public class Oppline{
        public String Name;
        public Integer Quantity;  
    }
    
}