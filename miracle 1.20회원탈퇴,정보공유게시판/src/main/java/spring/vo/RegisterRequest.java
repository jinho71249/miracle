package spring.vo;

public class RegisterRequest {
	private String user_Id;
	private String user_Pwd;
	private String user_Pwdck;
	private String user_Name;
	private String user_Tel;
	private String user_Birth;
	private String user_Email;
	private int user_Admin;
	
	public RegisterRequest() {}
	
	
	
	public RegisterRequest(String user_Id, String user_Pwd, String user_Pwdck, String user_Name, String user_Tel,
			String user_Birth, String user_Email, int user_Admin) {
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.user_Pwdck = user_Pwdck;
		this.user_Name = user_Name;
		this.user_Tel = user_Tel;
		this.user_Birth = user_Birth;
		this.user_Email = user_Email;
		this.user_Admin = user_Admin;
	}



	public boolean isPassWordEqualToConfirmPassword() {
		return user_Pwd.equals(user_Pwdck);
	}
	
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Pwd() {
		return user_Pwd;
	}
	public void setUser_Pwd(String user_Pwd) {
		this.user_Pwd = user_Pwd;
	}
	public String getUser_Pwdck() {
		return user_Pwdck;
	}
	public void setUser_Pwdck(String user_Pwdck) {
		this.user_Pwdck = user_Pwdck;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getUser_Tel() {
		return user_Tel;
	}
	public void setUser_Tel(String user_Tel) {
		this.user_Tel = user_Tel;
	}
	public String getUser_Birth() {
		return user_Birth;
	}
	public void setUser_Birth(String user_Birth) {
		this.user_Birth = user_Birth;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}

	public int getUser_Admin() {
		return user_Admin;
	}

	public void setUser_Admin(int user_Admin) {
		this.user_Admin = user_Admin;
	}
	
	
	
}
