public class SendOtpUsingEmail {
    @AuraEnabled
    public static void sendEmail(String email , String otp){
        try{
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'deepak.soni@cloudanalogy.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('deepak soni');
        mail.setPlainTextBody('debjgdsa jdygaud');
       
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
        }catch(Exception e){
            System.debug(e.getMessage()+'     '+e.getLineNumber());
            
        }
        
    }
    
    
    
}