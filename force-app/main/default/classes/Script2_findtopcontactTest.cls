@isTest

public class Script2_findtopcontactTest {
@TestSetup
static void createTestData() {
    Account acc = TestDataFactory.createAccount(true);
    List<Contact> cont = TestDataFactory.createContact(acc.id,5);
  
}
  
 @isTest public static void TestMethed(){
        
   Script2_FindTopcontact.main();
  
    }
    
}