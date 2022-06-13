public class testaa {
    
    public static void main(){
        calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        Double x = 2.0;
        Double y = 2.0;
        Double result = calculator.doAdd(x,y);
        System.debug(result);
        
        
    }
    
    
}