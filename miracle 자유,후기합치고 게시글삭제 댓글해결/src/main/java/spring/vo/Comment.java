package spring.vo;

public class Comment {
	private int com_Board_Num;
	private int com_Ado_Num;
	private String com_Name;
	private String com_Con;
	private String com_Pwd;
	private int com_Num;
	
	public Comment() {}


	public Comment(int com_Board_Num, int com_Ado_Num, String com_Name, String com_Con, String com_Pwd) {
		this.com_Board_Num = com_Board_Num;
		this.com_Ado_Num = com_Ado_Num;
		this.com_Name = com_Name;
		this.com_Con = com_Con;
		this.com_Pwd = com_Pwd;
	}
	
	public Comment(int com_Board_Num, int com_Ado_Num, String com_Name, String com_Con, String com_Pwd, int com_Num) {
		this.com_Board_Num = com_Board_Num;
		this.com_Ado_Num = com_Ado_Num;
		this.com_Name = com_Name;
		this.com_Con = com_Con;
		this.com_Pwd = com_Pwd;
		this.com_Num = com_Num;
	}

	public int getCom_Board_Num() {
		return com_Board_Num;
	}
	public void setCom_Board_Num(int com_Board_Num) {
		this.com_Board_Num = com_Board_Num;
	}
	public int getCom_Ado_Num() {
		return com_Ado_Num;
	}
	public void setCom_Ado_Num(int com_Ado_Num) {
		this.com_Ado_Num = com_Ado_Num;
	}
	public String getCom_Name() {
		return com_Name;
	}
	public void setCom_Name(String com_Name) {
		this.com_Name = com_Name;
	}
	public String getCom_Con() {
		return com_Con;
	}
	public void setCom_Con(String com_Con) {
		this.com_Con = com_Con;
	}
	public String getCom_Pwd() {
		return com_Pwd;
	}
	public void setCom_Pwd(String com_Pwd) {
		this.com_Pwd = com_Pwd;
	}
	public int getCom_Num() {
		return com_Num;
	}
	public void setCom_Num(int com_Num) {
		this.com_Num = com_Num;
	}
}