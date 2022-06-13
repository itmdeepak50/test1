public class AccountPdfGenrator {
    
    public static void GenratePDF(){
        
        PageReference page = new PageReference('apex/Mypdfgenrator');
        Blob pdf;
        pdf = page.getContentAsPDF();
        
        Attachment att = new Attachment();
        att.Body = pdf;
        att.Name = 'SampleAccount.pdf';
        att.IsPrivate = false;
        att.ParentId = '0015g00000bsc18AAA';
        insert att;
        
    }
    
    
}