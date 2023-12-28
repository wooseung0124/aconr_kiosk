package kiosk.menu.dto;

public class UpdateMenuDto {
	private String stoNum;
	private String name;
	
	public UpdateMenuDto() {}

	public UpdateMenuDto(String stoNum, String name) {
		super();
		this.stoNum = stoNum;
		this.name = name;
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
	
	
}
