package Study9;

public class BankServiceImpl implements BankService {
	private int money;
	
	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public void moneyInput(int money) {
		this.money+=money;
	}

	@Override
	public void moneyOutput(int money) {
		if (this.money <money) {
			System.out.println("잔액이 부족합니다.");
		}else {
		this.money-=money;
		System.out.println("출금액 : "+money);
		}
	}

	@Override
	public void moneyprint() {
		System.out.println("잔액: "+money);
	}

}
