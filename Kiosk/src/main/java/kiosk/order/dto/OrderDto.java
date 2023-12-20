package kiosk.order.dto;

public class OrderDto {
	private String stoNum;
	private int tableNum;
	private String menu;
	private int price;
	private int count;
	
	public OrderDto() {}

	public OrderDto(String stoNum, int tableNum, String menu, int price, int count) {
		super();
		this.stoNum = stoNum;
		this.tableNum = tableNum;
		this.menu = menu;
		this.price = price;
		this.count = count;
	}

	public String getStoNum() {
		return stoNum;
	}

	public void setStoNum(String stoNum) {
		this.stoNum = stoNum;
	}

	public int getTableNum() {
		return tableNum;
	}

	public void setTableNum(int tableNum) {
		this.tableNum = tableNum;
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
