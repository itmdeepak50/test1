public class PaymentIvoc {
   public static void paymentDataInsert(String paymentBody){
      
            System.debug('INSIDE THE PAYMENT DATA INSERT METHOD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
            System.debug('=>>>>>>>>>>>>>><<<<<<<<<<>>>>'+paymentBody);
            DesrilizequickBookPayment paymentData = DesrilizequickBookPayment.parse(paymentBody);
            DesrilizequickBookPayment.cls_CustomerRef customerRef= paymentData.Payment.CustomerRef;
            DesrilizequickBookPayment.cls_Payment paymentRef =paymentData.Payment;
            DesrilizequickBookPayment.cls_LinkedTxn invoiceRef = paymentData.Payment.Line[0].LinkedTxn[0];
       
       
            System.debug('invoice ref'+invoiceRef);
            System.debug('PAYMENT DATA SUCCESSFULLY INSERTED --->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    
}
   }