package Study9;

public class Goods extends GoodsInfo {
	public void quantityUp(int n) {
		quantity +=n;
	} 
	public void quantityDown(int n) {
		quantity -=n;
		if(quantity<0) {
			quantityZero();
		}
	}
	public static void main(String[] args) {
		Goods goods = new Goods();
		System.out.println("상품 잔량: "+goods.quantity);
		goods.quantityUp(100);
		goods.quantityDown(50);
		System.out.println("상품 잔량: "+goods.quantity);
		goods.quantityDown(60);
		System.out.println("상품 잔량: "+goods.quantity);
	}
}
