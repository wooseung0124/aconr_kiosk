package customer.mvc.model.dto;

public class MenuDto {

	private String stoNum; // 사업자번호
	private String name; // 메뉴이름
	private int price; // 메뉴가격
	private String description; // 설명란
	private String imageUrl; // 이미지 URL
	private String sell; // 판매가능여부(yes/no)
	private String category; // 메뉴카테고리
	
	public MenuDto() {
		
	}

	public MenuDto(String stoNum, String name, int price, String description, String imageUrl, String sell,
			String category) {
		super();
		this.stoNum = stoNum;
		this.name = name;
		this.price = price;
		this.description = description;
		this.imageUrl = imageUrl;
		this.sell = sell;
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

	public String getSell() {
		return sell;
	}

	public void setSell(String sell) {
		this.sell = sell;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
	
	
}
