package spring.vo;

public class User {
	private String user_Id;
	private String user_Pwd;
	private String user_name;
	private String user_Tel;
	private String user_Birth;
	private String user_Eamil;
	private int user_alarm;
	private String user_NumList;
	private int user_Admin;
	
	
	public User() {}
	
	
	public User(String user_Id, String user_Pwd, String user_name, String user_Tel, String user_Birth,
			String user_Eamil, int user_alarm, String user_NumList, int user_Admin) {
		this.user_Id = user_Id;
		this.user_Pwd = user_Pwd;
		this.user_name = user_name;
		this.user_Tel = user_Tel;
		this.user_Birth = user_Birth;
		this.user_Eamil = user_Eamil;
		this.user_alarm = user_alarm;
		this.user_NumList = user_NumList;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getUser_Eamil() {
		return user_Eamil;
	}
	public void setUser_Eamil(String user_Eamil) {
		this.user_Eamil = user_Eamil;
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
	
	
}
