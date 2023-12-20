package kiosk.menu.dto;

public class MenuDto {

	private String sto_num;
	private String name;
	private int price;
	private String description;
	private String imageUrl;
	private String is_sold;
	private String category;
	
	public MenuDto() {
		
	}

	public MenuDto(String sto_num, String name, int price, String description, String imageUrl, String is_sold,
			String category) {
		super();
		this.sto_num = sto_num;
		this.name = name;
		this.price = price;
		this.description = description;
		this.imageUrl = imageUrl;
		this.is_sold = is_sold;
		this.category = category;
	}

	public String getSto_num() {
		return sto_num;
	}

	public void setSto_num(String sto_num) {
		this.sto_num = sto_num;
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

	public String getIs_sold() {
		return is_sold;
	}

	public void setIs_sold(String is_sold) {
		this.is_sold = is_sold;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
	
	
}
