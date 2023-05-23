public  class CustomSettings {
    @AuraEnabled
    public static String getAuthneticationKey() {
        String AuthneticationKey = '';
        try{
        List<BlueLeafAPiKey__c> Apikey = [SELECT AuthenticationKey__c From BlueLeafAPiKey__c];
        System.debug('ApiKey==> '+Apikey);
        if(!ApiKey.isEmpty()){
            AuthneticationKey =  ApiKey[0].AuthenticationKey__c;  
        }else{
            AuthneticationKey =null;
        }
    }catch(Exception e){

        AuthneticationKey = 'Exception'; 
        System.debug('Exception '+ e.getMessage());
    }

        System.debug('Auth value'+AuthneticationKey);
        return AuthneticationKey; 

    }
}