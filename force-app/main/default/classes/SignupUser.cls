public class SignupUser {
    
    @AuraEnabled
    public static User__c registerUser(User__c userObject){
        
        if(userObject!=null){
            
            insert userObject;
            System.debug(userObject);
            
        }else{
            
            System.debug('They have not find Data');
        }
        
        return userObject;
    }
    
    @AuraEnabled
    public static List<User__c> chekUserName(String username){
        
        List<User__c> user=new List<User__c>();
        user = [select Name from User__c where Name=: username limit 1];
        System.debug(user);
        return user;
    }
    
    

}