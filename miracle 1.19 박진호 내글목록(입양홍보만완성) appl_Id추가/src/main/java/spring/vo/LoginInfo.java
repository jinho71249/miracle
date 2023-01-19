package spring.vo;

public class LoginInfo {
	private String user_Id;
	private String user_Pwd;
	
	
	public LoginInfo() {}
	
	public LoginInfo(String user_Id, String user_Pwd) {
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
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
	
	
}
