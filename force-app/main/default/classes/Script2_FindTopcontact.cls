public class Script2_FindTopcontact {
    public  static void main(){
        Map<id,integer> con_map=new Map<id,integer>();
        List<Contact> con_list=[select id,Accountid from Contact where Accountid!=null];
        if(!con_list.isEmpty()){
        for(Contact var: con_list){
            if(!con_map.containsKey(var.AccountId)){
                
                con_map.put(var.AccountId,1);
            }else{
                integer total=con_map.get(var.AccountId);
                total++;
                con_map.put(var.AccountId,total);
            }
        } 
        }
        for(id ab:con_map.keyset()){
              System.debug(ab+''+con_map.get(ab));
        }
        System.debug(con_map);
        Map<integer,id> new_map=new Map<integer,id>();
        for(id ab:con_map.Keyset()){
            new_map.put(con_map.get(ab),ab);
        }
        List<integer> new_list=new List<integer>();
        for(integer ab:new_map.Keyset()){
            new_list.add(ab);
            System.debug(new_map.get(ab));
            
        }
        new_list.sort();


         for(integer acc:new_list){
        System.debug('Top five Account are>>>'+new_map.get(acc)+'>>> : '+acc);
    }
    
        
    }
    
   

}