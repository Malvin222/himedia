package Study9;

public class Product_Ans {
	
		private String name = "생산품명";
		private int price;
		private String maker ="한국";
		
		public int discount() {
			int result = getPrice()-(getPrice()/10);
			return result;
		}
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getMaker() {
			return maker;
		}
		public void setMaker(String maker) {
			this.maker = maker;
		}



}
