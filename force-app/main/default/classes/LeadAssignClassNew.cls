public with sharing class LeadAssignClassNew {
    
    public static void MethodLeadAssignClassNew(List<Lead> LeadList) {
        
        List<Lead> LeadList1 = [select id,country__c from lead where id IN : LeadList order by country__c];
        
        Set<String> country = new Set<String>();
        
        for(Lead Leads : LeadList){
            country.add(Leads.country__c);
        }
        
        
        // Map<String,List<id>> countryMemberMap = new Map<String,List<id>>();
        Map<String,List<Country_Member__c>> countryMemberMap = new Map<String,List<Country_Member__c>>();
        Map<String,integer> countryIndex = new Map<String,Integer>();
        Map<String,decimal>  UpdateLastIndex = new  Map<String,decimal>();
        Map<Id, Decimal> temp = new Map<Id, Decimal>();
        List<country__c> countryList = [select id, name , (select id, name , User__c,index__c , LastAssignmentDate__c from Country_Members__r order by index__c asc) from country__c where name IN:country ];
        for(country__c countrys :countryList ){
            
            for(Country_Member__c bc : countrys.Country_Members__r){
                if(!countryMemberMap.containsKey(countrys.name)){
                    
                    countryMemberMap.put(countrys.name , new List<Country_Member__c>{bc});
                    UpdateLastIndex.put(countrys.name, countrys.Country_Members__r[countrys.Country_Members__r.size()-1].index__c);
                    countryIndex.put(countrys.name , 0);
                }else{
                    
                    countryMemberMap.get(countrys.name).add(bc);
                    
                }
            }
            
        }
        System.debug('LastIndex = '+UpdateLastIndex);
        System.debug('Value of Mapis '+countryMemberMap);
        List<Lead> updateLead  = new List<Lead>();
        Integer index =0;
        for(Lead ab : LeadList1){
            if(countryMemberMap.containsKey(ab.country__c)){
                if(countryMemberMap.get(ab.country__c).size()>1){
                    
                    Lead Leadobject = new Lead();
                    Leadobject.OwnerId = countryMemberMap.get(ab.country__c)[countryIndex.get(ab.country__c)].User__c;
                    
                    temp.put(countryMemberMap.get(ab.country__c)[countryIndex.get(ab.country__c)].id, UpdateLastIndex.get(ab.country__c) + 1);
                    UpdateLastIndex.put(ab.country__c , UpdateLastIndex.get(ab.country__c) + 1);
                    
                    Leadobject.id = ab.id;
                    countryIndex.put(ab.country__c,countryIndex.get(ab.country__c)+1);
                    updateLead.add(Leadobject);
                    System.debug('LEAD IS '+Leadobject);
                    System.debug('Country INDEX '+countryIndex);
                    
                    System.debug('Country size '+countryMemberMap.get(ab.country__c).size());
                    System.debug('Country size '+countryIndex.get(ab.country__c));
                    
                    
                    if(countryMemberMap.get(ab.country__c).size() == countryIndex.get(ab.country__c)){
                        
                       countryIndex.put(ab.country__c,0);
                    }
                }else{
                    
                    Lead Leadobject = new Lead();
                    Leadobject.OwnerId = countryMemberMap.get(ab.country__c)[0].User__c;
                    temp.put(countryMemberMap.get(ab.country__c)[countryIndex.get(ab.country__c)].id, UpdateLastIndex.get(ab.country__c) + 1);
                    UpdateLastIndex.put(ab.country__c , UpdateLastIndex.get(ab.country__c) + 1);
                    
                    Leadobject.id = ab.id;
                    updateLead.add(Leadobject);
                    
                }
                
            }
   
        }
        
        update updateLead;
        
        List<Country_Member__c> updatelastassign = new List<Country_Member__c>();
        for(id ab :temp.keyset()){
            Country_Member__c ob = new Country_Member__c();
            ob.id =ab;
            ob.Index__c = temp.get(ab);
            updatelastassign.add(ob);
            
        }
        
        
          update updatelastassign;
        
        
        
    }
  
}