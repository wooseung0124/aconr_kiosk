package kiosk.menu.dto;

public class MenuDto {
	private String stoNum;  //사업자 번호
	private String category;  //메뉴 카테고리
	private String name; //메뉴이름
	private int price; //메뉴 가격
	private String imageUrl;  //메뉴 이미지 주소 
	private String description; //메뉴 상세설명
	private String isSold; //메뉴 솔드아웃 체크
	
	public MenuDto() {}

	public MenuDto(String stoNum, String category, String name, int price, String imageUrl, String description,
			String isSold) {
		super();
		this.stoNum = stoNum;
		this.category = category;
		this.name = name;
		this.price = price;
		this.imageUrl = imageUrl;
		this.description = description;
		this.isSold = isSold;
	}

	public String getStoNum() {
		return stoNum;
	}

	public void setStoNum(String stoNum) {
		this.stoNum = stoNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIsSold() {
		return isSold;
	}

	public void setIsSold(String isSold) {
		this.isSold = isSold;
	}
	
}
