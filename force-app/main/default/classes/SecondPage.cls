public class SecondPage {
   
    public String strText {get;set;}
    public SecondPage() {
        strText = ApexPages.currentPage().getParameters().get('str');
        System.debug('test value are '+strText);
    }
    
    
    
}