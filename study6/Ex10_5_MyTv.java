package study6;

public class Ex10_5_MyTv {
	public static void main(String[] args) {
		Ex10_5_Tvconrtol tv = new Ex10_5_Tvconrtol();
		Ex10_5_Tvconrtol radio =new Ex10_5_Tvconrtol();
		tv.power();
		tv.channel = 11;
		tv.channelDown(); //10
		System.out.println("전원:"+tv.power);
		System.out.println("채널:"+tv.channel);
		tv.channelUp();
		tv.channelUp();
		System.out.println("전원:"+tv.power);
		System.out.println("채널:"+tv.channel);
		tv.power();
		System.out.println("전원:"+tv.power);
		System.out.println("채널:"+tv.channel);
		System.out.println("---------------");
		
		System.out.println("radio전원:"+radio.power);
		System.out.println("radio채널"+radio.channel);
		radio.power();
		System.out.println("radio전원:"+radio.power);
		radio.channelUp();
		radio.channelUp();
		radio.channelUp();
		System.out.println("tv채널:"+tv.channel);
		System.out.println("radio채널:"+radio.channel);
	}
}
