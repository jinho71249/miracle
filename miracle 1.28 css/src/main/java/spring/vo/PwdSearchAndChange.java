package spring.vo;

public class PwdSearchAndChange {
	
	private String user_Pwd;
	private String changePwdChk;
	private String user_Id;
	
	public PwdSearchAndChange(String user_Pwd, String changePwdChk, String user_Id) {
	
		this.user_Pwd = user_Pwd;
		this.changePwdChk = changePwdChk;
		this.user_Id = user_Id;
	}

	public String getUser_Pwd() {
		return user_Pwd;
	}

	public void setUser_Pwd(String user_Pwd) {
		this.user_Pwd = user_Pwd;
	}

	public String getChangePwdChk() {
		return changePwdChk;
	}

	public void setChangePwdChk(String changePwdChk) {
		this.changePwdChk = changePwdChk;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	
	
	
	
	
	

}
