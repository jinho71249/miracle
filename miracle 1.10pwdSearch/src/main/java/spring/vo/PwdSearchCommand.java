package spring.vo;

public class PwdSearchCommand {

	private String user_Id;
	private String user_Tel;
	private String user_Birth;	
	
	public PwdSearchCommand(String user_Id, String user_Tel, String user_Birth) {
		this.user_Id = user_Id;
		this.user_Tel = user_Tel;
		this.user_Birth = user_Birth;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
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
	

}
