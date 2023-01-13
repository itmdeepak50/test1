public class WrapperOfRecords {
    @AuraEnabled 
   public List<userData> users;
    public class userData{
         @AuraEnabled 
        public string name;
         @AuraEnabled 
        public List<accountData> acc;
    }    
    public class accountData{
         @AuraEnabled 
        public string name;
         @AuraEnabled 
        public string ids;
         @AuraEnabled 
        public List<contact> con;
    }
    
    public class contactData{
         @AuraEnabled 
        public string name;
    }
    
}