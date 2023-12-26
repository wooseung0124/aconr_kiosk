package kiosk.menu.dto;

public class MenuDto {

	private String stoNum;
	private String name;
	private int price;
	private String description;
	private String imageUrl;
	private String isSold;
	private String category;
	
	public MenuDto() {
		
		
		
	}

	public MenuDto(String stoNum, String name, int price, String description, String imageUrl, String isSold,
			String category) {
		super();
		this.stoNum = stoNum;
		this.name = name;
		this.price = price;
		this.description = description;
		this.imageUrl = imageUrl;
		this.isSold = isSold;
		this.category = category;
	}

	public String getStoNum() {
		return stoNum;
	}

	public void setStoNum(String stoNum) {
		this.stoNum = stoNum;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getIsSold() {
		return isSold;
	}

	public void setIsSold(String isSold) {
		this.isSold = isSold;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
	
	
}
