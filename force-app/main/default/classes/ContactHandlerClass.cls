public class ContactHandlerClass {

    public static void contacthandle(List<contact> conlist){
        System.debug('Changevalue  '+conlist[0].lastname);
        String emails = conlist[0].email;
        List<String> emaillist = new List<String>();

        for(contact ab : [select email from contact]){
            emaillist.add(ab.email);
        }
        if(emaillist.contains(emails)){
            conlist[0].email.addError('do not allow the duplicate contact in the list');
        }
        
        
        
    }
    
    
}