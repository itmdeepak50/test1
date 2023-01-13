public class example {

    public static void main(){
  
       List<Contact> conlist = [select id, Accountid from Contact where AccountId != null];
            map<id, integer> map1 = new map<id, integer>();
            List<integer> intlist = new List<integer>();
            
            for(Contact con : conlist){
                if(!map1.containskey(con.Accountid)){
                    map1.put(con.Accountid, 1);
                }
                else{
                    integer count = map1.get(con.Accountid); 
                    count++;
                    map1.put(con.Accountid, count);
                    
                }
            }
            
            set<id> accset = new set<id>();
            map<integer, id> opmap = new map<integer, id>();
             for(Contact con : conlist){
                accset.add(con.Accountid);
                opmap.put(map1.get(con.AccountId), con.AccountId);
             }
        
              
        
          System.debug(opmap);
        
           integer coun  = 0;
            integer max = 0;
             set<id> newset = new set<id>();
             for(Contact con : conlist){
                 if(max< map1.get(con.AccountId) && coun <5){
                     max= map1.get(con.AccountId);
                     newset.add (con.AccountId);
                     coun++;
                 }
             }
           List<Account> acc1 = [select id, Name from Account where id IN : newset];
           system.debug('accounts are' + acc1);
        
        
    }
}