package kiosk.order.dto;

public class OrderDto {
	private String sto_num;
	private String menu;
	private int price;
	private int count;
	
	public OrderDto() {}

	public OrderDto(String sto_num, String menu, int price, int count) {
		super();
		this.sto_num = sto_num;
		this.menu = menu;
		this.price = price;
		this.count = count;
	}

	public String getSto_num() {
		return sto_num;
	}

	public void setSto_num(String sto_num) {
		this.sto_num = sto_num;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
