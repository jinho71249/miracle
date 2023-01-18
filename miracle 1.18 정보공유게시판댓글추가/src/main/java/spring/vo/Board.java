package spring.vo;

public class Board {
	private String board_Title;
	private String board_Content;
	private String board_User_Id;
	private int board_Num;
	private String board_Pic;
	private int board_Views;
	
	public Board() {}
	
	public Board(String board_Title, String board_Content, String board_User_Id, int board_Num, String board_Pic,
			int board_Views) {

		this.board_Title = board_Title;
		this.board_Content = board_Content;
		this.board_User_Id = board_User_Id;
		this.board_Num = board_Num;
		this.board_Pic = board_Pic;
		this.board_Views = board_Views;
	}
	public String getBoard_Title() {
		return board_Title;
	}
	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}
	public String getBoard_Content() {
		return board_Content;
	}
	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}
	public String getBoard_User_Id() {
		return board_User_Id;
	}
	public void setBoard_User_Id(String board_User_Id) {
		this.board_User_Id = board_User_Id;
	}
	public int getBoard_Num() {
		return board_Num;
	}
	public void setBoard_Num(int board_Num) {
		this.board_Num = board_Num;
	}
	public String getBoard_Pic() {
		return board_Pic;
	}
	public void setBoard_Pic(String board_Pic) {
		this.board_Pic = board_Pic;
	}
	public int getBoard_Views() {
		return board_Views;
	}
	public void setBoard_Views(int board_Views) {
		this.board_Views = board_Views;
	}
	
	
}
