package spring.vo;

public class User {
	private String user_Id;
	private String user_Pwd;
	private String user_Name;
	private String user_Tel;
	private String user_Birth;
	private String user_Email;
	private int user_alarm;
	private String user_NumList;
	private int user_Admin;
	
	public User() {}
	
	
	public User(String user_Id, String user_Pwd, String user_Name, String user_Tel, String user_Birth,
			String user_Email, int user_alarm, String user_NumList, int user_Admin) {
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.user_Name = user_Name;
		this.user_Tel = user_Tel;
		this.user_Birth = user_Birth;
		this.user_Email = user_Email;
		this.user_alarm = user_alarm;
		this.user_NumList = user_NumList;
		this.user_Admin = user_Admin;
	}

	public User(String user_Id, String user_Pwd, String user_Name, String user_Tel, String user_Birth,
			String user_Email, int user_Admin) {
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.user_Name = user_Name;
		this.user_Tel = user_Tel;
		this.user_Birth = user_Birth;
		this.user_Email = user_Email; 
		this.user_Admin = user_Admin;
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
	public int getUser_alarm() {
		return user_alarm;
	}
	public void setUser_alarm(int user_alarm) {
		this.user_alarm = user_alarm;
	}
	public String getUser_NumList() {
		return user_NumList;
	}
	public void setUser_NumList(String user_NumList) {
		this.user_NumList = user_NumList;
	}
	public int getUser_Admin() {
		return user_Admin;
	}
	public void setUser_Admin(int user_Admin) {
		this.user_Admin = user_Admin;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	
	
}
