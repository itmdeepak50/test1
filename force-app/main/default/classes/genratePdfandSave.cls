public class genratePdfandSave {
public String inputText1{get;set;}
public String inputText2{get;set;}
public String inputText3{get;set;}
public String inputText4{get;set;}    
    
public void saveTextValue(){
Account  a = new Account();
 
a.Name =  inputText1;  // Field Assignment1
a.Phone =  inputText2;
a.BillingCountry= inputText3;
a.BillingCity=inputText4;    
insert  a; // DML Operations
savefileaspdf(a);    
 
}
    
public static void savefileaspdf(Account a){
    try{
Attachment att=new Attachment();        
            string ss;
            String pdfText;
            pdfText = '<HTML><BODY>';
            pdfText = pdfText + '<H2>Account Records in PDF</H2>';
            //pdfText
            pdfText = pdfText +('<p>' +'ID   :'+a.Id+ '<br>' +'Name   :'+a.Name+ '<br>'+'Country   :' 
                                    +a.BillingCountry+ '<br>'+'City   :'+a.BillingCity+ '<\br></p>');
            pdfText = pdfText + '</BODY></HTML>';
            System.debug(pdfText);
            Blob pdfContent = Blob.toPdf(pdfText);
            Blob body =pdfcontent;           
            att.Body=body;
            att.ParentId=a.Id;
            att.Name='test';
            insert att;
    }catch(exception e){ 
        System.debug(e.getLineNumber()+'>>>>>>>>>>'+e.getMessage());
    }
        
}   
    
    
    
    
    
    
}