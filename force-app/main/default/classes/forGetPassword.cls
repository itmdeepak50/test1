public class forGetPassword {
   
    @AuraEnabled
    public static List<User__c> insertData(String userName,String scquestion,String scanswer){
        System.debug('value is  '+ userName);
        List<User__c> userList=[select id,Name,Scquestion__c,Scanswer__c from User__c where Name=:userName AND Scquestion__c=:scquestion AND Scanswer__c=:scanswer limit 1];
        
        
        
        System.debug(userList);
        
        return userList;
        
    }
    
    @AuraEnabled
    public static User__c setpassword(String userId,String password1){
        
        User__c userInstence=new User__c();
        
        userInstence.Id=userId;
        userInstence.Password__c=password1;
        
        System.debug(userInstence);
        update userInstence;
        return userInstence;
        
    }
    
    @AuraEnabled
    public static  User__c sendEmail(String email , integer otp){
        User__c userInsetence =new User__c();
        try{
            
       
        
        for(User__c us : [select id from User__c where ContactEmail__c=:email limit 1]){
                userInsetence=us;
        }
       
            if(userInsetence.Id!=null){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Find OTP');
        mail.setPlainTextBody('Your OTP is This  :: '+ otp);
       
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
           
            }else{
                userInsetence=null;
            }    
            
            
           
        }catch(Exception e){
            System.debug(e.getMessage()+'     '+e.getLineNumber());
            
        }
        return userInsetence;
    }
    
    
    
}