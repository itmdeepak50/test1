public class vfdownloadPdf {
    public Account acc{get;set;}
    
    public  vfdownloadPdf() {
        //Assign "Account_[Ac].pdf" as a file name
       /* String fileName = 'Account_' + 'accNum' + '.pdf';
        String b= Apexpages.currentPage().getHeaders().put('content-disposition', 'attachment; filename=' + fileName);*/
        
        Id oppId = apexpages.currentpage().getparameters().get('id');
        System.debug(oppId);
        //query the opportunity
        acc = [select id,name from Account where id=: oppId];
    }        
        
        
        
        
        
      
    }