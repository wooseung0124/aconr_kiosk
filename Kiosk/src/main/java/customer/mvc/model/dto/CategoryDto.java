package customer.mvc.model.dto;

public class CategoryDto {
	private String stoNum;
	private String category;
	
	public CategoryDto() {
		
	}

	public CategoryDto(String stoNum, String category) {
		super();
		this.stoNum = stoNum;
		this.category = category;
	}



	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStoNum() {
		return stoNum;
	}

	public void setStoNum(String stoNum) {
		this.stoNum = stoNum;
	}
	
	
}
