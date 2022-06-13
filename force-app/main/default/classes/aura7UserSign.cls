public class aura7UserSign {
    
    @AuraEnabled
    public static User__c getsignField(String userName ,String userPassword){
        
         System.debug('name   '+userName+'     '+userPassword );
        
        
        List<User__c> userList=[SELECT Name, Password__c from User__c where Name=:userName AND Password__c=:userPassword];
        System.debug('List     '+userList);
        User__c userInstence =new User__c();
             if(userList.size()>0){
        for(User__c var:userList){
        userInstence.Name=var.Name;
        userInstence.Password__c=var.Password__c;
            }
             }else{
                 System.debug('kuch nhi hai bhai');
             }
       
      return userInstence;
    }
    
}