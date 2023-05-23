public class LeadAssignRule {

   
    
    
    public static void LeadAssign(List<Lead> Leads){
        
       
        
        Set<String> country = new Set<String>();
        
        for(Lead ab :Leads){
            country.add(ab.country__c);
        }
     country.remove(null);
     System.debug('country set is'+country);
     Map<String,List<id>> LeadMap = new Map<String,List<id>>();
     Map<String,list<String>> UserMap = new Map<String,list<String>>();
     Map<String,Integer> countryIndex = new Map<String,Integer>{'Aus'=>0};
    
      List<LeadAssignSetting__c> LeadSetting =  LeadAssignSetting__c.getAll().values();
        
      for(LeadAssignSetting__c ld : LeadSetting){
            countryIndex.put(ld.Country__c,Integer.valueof(ld.LastIndex__c));
      }    
         
     if(country.size()!=0){
     List<User> userList = [select id ,name,country__c  from user where Country__c IN :country order by CreatedDate];      
     System.debug('List of user'+userList);
         for(user ab : userList){
             if(!UserMap.containsKey(ab.Country__c)){
                 UserMap.put(ab.Country__c,new list<String>{ab.id});
             } else{
                 UserMap.get(ab.Country__c).add(ab.id);
             }
         }
         System.debug('USER MAP IS'+UserMap); 
     } 
        /*for(Lead ab : Leads){
            if(!LeadMap.containsKey(ab.Country__c)){
                LeadMap.put(ab.Country__c,new List<id>{ab.id});
                
            }else{
                LeadMap.get(ab.Country__c).add(ab.Id);
            }
         
        }*/
   
        for(Lead ab : Leads){
            if(UserMap.get(ab.Country__c).size() - 1 > countryIndex.get(ab.Country__c)){
           		ab.OwnerId =  UserMap.get(ab.Country__c)[countryIndex.get(ab.Country__c) + 1];
                countryIndex.put(ab.Country__c, countryIndex.get(ab.Country__c) + 1);
            }
            else{
                ab.OwnerId =  UserMap.get(ab.Country__c)[0];
                countryIndex.put(ab.Country__c, 0);
            }
        }   
        
        
        for(LeadAssignSetting__c ab : LeadSetting){
           ab.LastIndex__c  = countryIndex.get(ab.Country__c);
        }
        
        update LeadSetting;
        
    
}
  
}