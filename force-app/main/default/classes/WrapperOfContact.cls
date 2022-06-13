public class WrapperOfContact {
    @AuraEnabled 
    public List<condata> con;
    public class condata{
        @AuraEnabled
        public String name;
        @AuraEnabled
        public String phone;
        @AuraEnabled
        public String email;
        @AuraEnabled
        public String acname;
        @AuraEnabled
        public String nameUrl;
        @AuraEnabled
        public String accnameurl;
        @AuraEnabled
        public id conId;
    }
    
}