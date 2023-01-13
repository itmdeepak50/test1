public class pricebookentry {

    public static void main(){
        
        Product2 pb= new Product2();
        pb.Name='pro';
        insert pb;
        
        
        Pricebook2 pbb=new Pricebook2();
        pbb=[select id from pricebook2 where isStandard=true];
        
        Pricebook2 cpb=new Pricebook2();
        cpb.Name='custom pb';
        insert cpb;
        
        PricebookEntry pben=new PricebookEntry();
       
        
        
        
    }
    
    
    
}