public class Script1_Team {
    public static void main(){
        List<Team__c> team_list=new List<Team__c>();
        Team__c team_o=new Team__c();
        team_o.name='xyz';
        team_o.logo__c='hjkdhf';
        team_o.Country__c='india';
        team_list.add(team_o);
        insert team_list;  
        
         List<Player__c> p_name = new List<Player__c>();
         Player__c p = new Player__c();   
          p.name='deepak';
          p.Jersey_Number__c=10;
          p.Type__c='batsman';
          p_name.add(p);  
         insert p_name;
        
         List<Playing_Eleven__c> pn=new list<Playing_Eleven__c>();
             Playing_Eleven__c pn_obj=new Playing_Eleven__c();
              pn_obj.Player__c=p.id;
               pn_obj.Teamid__c= team_o.id;
               pn.add(pn_obj);
               insert pn;
                              
    }    
}