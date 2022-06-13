public class lwcFirstquestion {
    @AuraEnabled
    public static String lwcTestAccount(String name,String Phone){
        
        Account accInstence=new Account();
        accInstence.Name=name;
        accInstence.Phone=phone;
        insert accInstence;
    return 'success';
    }
    
    
}