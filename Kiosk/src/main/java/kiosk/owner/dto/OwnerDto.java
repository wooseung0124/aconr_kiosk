package kiosk.owner.dto;

public class OwnerDto {
	private String sto_num; 
	   private String sto_name;
	   private String o_name;
	   private String email;
	   private String pwd;
	
	   public OwnerDto() {}

	public OwnerDto(String sto_num, String sto_name, String o_name, String email, String pwd) {
		super();
		this.sto_num = sto_num;
		this.sto_name = sto_name;
		this.o_name = o_name;
		this.email = email;
		this.pwd = pwd;
	}

	public String getSto_num() {
		return sto_num;
	}

	public void setSto_num(String sto_num) {
		this.sto_num = sto_num;
	}

	public String getSto_name() {
		return sto_name;
	}

	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
