package spring.vo;

public class BoardVO {
	/* BoardTbl의 테이블 생성 SQL
	 * 
	 * CREATE TABLE BoardTbl(
		board_Title VARCHAR2(200) NOT NULL, -- 제목 
		board_Content VARCHAR2(4000) NOT NULL, -- 내용
		board_User_Id VARCHAR2(50) NOT NULL, --  유저아이디 외래키 
		board_Num NUMBER , -- 글번호 (기본키)
		board_Pic VARCHAR2(100), -- 사진
		board_Views NUMBER NOT NULL, -- 조회수
		CONSTRAINT BoardTbl_Num_pk PRIMARY KEY(board_Num),
		CONSTRAINT BoardTbl_UserTbl_fk FOREIGN KEY(board_User_Id) REFERENCES UserTbl(user_Id)
);	
 */
	//자료를 담는 변수
	private String bdPic; // 게시글 사진
	private String bdTle; // 제목
	private String bdUid; // 작성자 아이디
	private int bdView; // 조회수
	
	
	// getter / setter 메소드
	public String getBdPic() {
		return bdPic;
	}
	public void setBdPic(String bdPic) {
		this.bdPic = bdPic;
	}
	public String getBdTle() {
		return bdTle;
	}
	public void setBdTle(String bdTle) {
		this.bdTle = bdTle;
	}
	public String getBdUid() {
		return bdUid;
	}
	public void setBdUid(String bdUid) {
		this.bdUid = bdUid;
	}
	public int getBdView() {
		return bdView;
	}
	public void setBdView(int bdView) {
		this.bdView = bdView;
	}
	

	
	
	
	

}
