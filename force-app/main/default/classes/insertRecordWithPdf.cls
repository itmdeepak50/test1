public class insertRecordWithPdf {

@auraEnabled   
    public static void downloadpdf(String accid){
        
        PageReference pdfPage = new PageReference('/apex/Testform');
        pdfPage.getParameters().put('Id', accid);
        
        Blob pdfContent = pdfPage.getContent();
        //create attachment record with PDF
        system.debug(' pdfContent '+pdfContent);
        Attachment attach1= new Attachment();
        attach1.ParentId = accid;
        attach1.Name = 'Test Attachment for PDF';
        attach1.Body = pdfContent;
        attach1.contentType = 'application/pdf';
        insert attach1;
        
    }
}