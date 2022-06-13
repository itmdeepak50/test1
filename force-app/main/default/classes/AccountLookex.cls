public class AccountLookex {

    public static void main(){
       Account accInstence = new Account();
        accInstence.Name='acc1';
        insert accInstence;
               
        Contact conInstence=new Contact();
        conInstence.LastName='con2';
        conInstence.AccountId=accInstence.id;
        insert conInstence;
    }
}