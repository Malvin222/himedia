package Study9;

public class BankController {
	public static void main(String[] args) {
		BankServiceImpl my =new BankServiceImpl();
		my.setMoney(1000);
		my.moneyprint();
		my.moneyInput(500);
		my.moneyprint();
		my.moneyInput(1000);
		my.moneyprint();
		my.moneyOutput(5000);
		my.moneyprint();
		
	}

	
}
