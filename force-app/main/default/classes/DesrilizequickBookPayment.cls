public class DesrilizequickBookPayment {
public cls_Payment Payment;
	//public String time;	//2022-01-10T22:39:49.850-08:00
	public class cls_Payment {
		public cls_CustomerRef CustomerRef;
		public cls_DepositToAccountRef DepositToAccountRef;
		public String TotalAmt;	//625
		public Integer UnappliedAmt;	//0
		public boolean ProcessPayment;
		public String domain;	//QBO
		public boolean sparse;
		public String Id;	//214
		public String SyncToken;	//0
		public cls_MetaData MetaData;
		public String TxnDate;	//2022-01-11
		public cls_CurrencyRef CurrencyRef;
		public List<cls_Line> Line;
	}
	public class cls_CustomerRef {
		public String value;	//102
		public String name;	//TakeTest testName
	}
	public class cls_DepositToAccountRef {
		public String value;	//4
	}
	public class cls_MetaData {
		public String CreateTime;	//2022-01-10T22:39:48-08:00
		public String LastUpdatedTime;	//2022-01-10T22:39:48-08:00
	}
	public class cls_CurrencyRef {
		public String value;	//USD
		public String name;	//United States Dollar
	}
	public class cls_Line {
		public String Amount;	//625
		public List<cls_LinkedTxn> LinkedTxn;
		public cls_LineEx LineEx;
	}
	public class cls_LinkedTxn {
		public String TxnId;	//194
		public String TxnType;	//Invoice
	}
	class cls_LineEx {
		//public cls_any[] any;
	}
	public class cls_any {
		public String name;	//{http://schema.intuit.com/finance/v3}NameValue
		public String declaredType;	//com.intuit.schema.finance.v3.NameValue
		public String scope;	//javax.xml.bind.JAXBElement$GlobalScope
		public cls_value value;
		public boolean nil;
		public boolean globalScope;
		public boolean typeSubstituted;
	}
	public class cls_value {
		public String Name;	//txnId
		public String Value;	//194
	}
	public static DesrilizequickBookPayment parse(String json){
		return (DesrilizequickBookPayment) System.JSON.deserialize(json, DesrilizequickBookPayment.class);
	}
    
    
    
    
    
    
}