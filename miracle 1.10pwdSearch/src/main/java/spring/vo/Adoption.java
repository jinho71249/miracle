package spring.vo;

public class Adoption {
	private String ado_Breed;           //품종
	private int ado_AniAge;             //동물나이
	private String ado_AniVaccin;       //접종여부
	private int ado_AniGender;          //성별
	private float ado_AniWeight;        //동물 몸무게
	private String ado_AniDiscovery;    //발견장소
	private String ado_AniCon;          //현재 상태
	private String ado_User_Id;         //등록자 아이디
	private String ado_User_Name;       //등록자 이름
	private String ado_Tel;             //등록자 연락처
	private String ado_AniCareplace;    //현재 동물 보호 장소
	private int ado_Num;                //등록글 번호
	private String ado_AniPic;          //동물 사진 경로
	private int ado_Views;              //조회수
	
	public Adoption() {}
	
	
	
	public Adoption(String ado_Breed, int ado_AniAge, String ado_AniVaccin, int ado_AniGender, float ado_AniWeight,
			String ado_AniDiscovery, String ado_AniCon, String ado_User_Id, String ado_User_Name, String ado_Tel,
			String ado_AniCareplace, int ado_Num, String ado_AniPic, int ado_Views) {
		this.ado_Breed = ado_Breed;
		this.ado_AniAge = ado_AniAge;
		this.ado_AniVaccin = ado_AniVaccin;
		this.ado_AniGender = ado_AniGender;
		this.ado_AniWeight = ado_AniWeight;
		this.ado_AniDiscovery = ado_AniDiscovery;
		this.ado_AniCon = ado_AniCon;
		this.ado_User_Id = ado_User_Id;
		this.ado_User_Name = ado_User_Name;
		this.ado_Tel = ado_Tel;
		this.ado_AniCareplace = ado_AniCareplace;
		this.ado_Num = ado_Num;
		this.ado_AniPic = ado_AniPic;
		this.ado_Views = ado_Views;
	}



	public String getAdo_Breed() {
		return ado_Breed;
	}
	public void setAdo_Breed(String ado_Breed) {
		this.ado_Breed = ado_Breed;
	}
	public int getAdo_AniAge() {
		return ado_AniAge;
	}
	public void setAdo_AniAge(int ado_AniAge) {
		this.ado_AniAge = ado_AniAge;
	}
	public String getAdo_AniVaccin() {
		return ado_AniVaccin;
	}
	public void setAdo_AniVaccin(String ado_AniVaccin) {
		this.ado_AniVaccin = ado_AniVaccin;
	}
	public int getAdo_AniGender() {
		return ado_AniGender;
	}
	public void setAdo_AniGender(int ado_AniGender) {
		this.ado_AniGender = ado_AniGender;
	}
	public float getAdo_AniWeight() {
		return ado_AniWeight;
	}
	public void setAdo_AniWeight(float ado_AniWeight) {
		this.ado_AniWeight = ado_AniWeight;
	}
	public String getAdo_AniDiscovery() {
		return ado_AniDiscovery;
	}
	public void setAdo_AniDiscovery(String ado_AniDiscovery) {
		this.ado_AniDiscovery = ado_AniDiscovery;
	}
	public String getAdo_AniCon() {
		return ado_AniCon;
	}
	public void setAdo_AniCon(String ado_AniCon) {
		this.ado_AniCon = ado_AniCon;
	}
	public String getAdo_User_Id() {
		return ado_User_Id;
	}
	public void setAdo_User_Id(String ado_User_Id) {
		this.ado_User_Id = ado_User_Id;
	}
	public String getAdo_User_Name() {
		return ado_User_Name;
	}
	public void setAdo_User_Name(String ado_User_Name) {
		this.ado_User_Name = ado_User_Name;
	}
	public String getAdo_Tel() {
		return ado_Tel;
	}
	public void setAdo_Tel(String ado_Tel) {
		this.ado_Tel = ado_Tel;
	}
	public String getAdo_AniCareplace() {
		return ado_AniCareplace;
	}
	public void setAdo_AniCareplace(String ado_AniCareplace) {
		this.ado_AniCareplace = ado_AniCareplace;
	}
	public int getAdo_Num() {
		return ado_Num;
	}
	public void setAdo_Num(int ado_Num) {
		this.ado_Num = ado_Num;
	}
	public String getAdo_AniPic() {
		return ado_AniPic;
	}
	public void setAdo_AniPic(String ado_AniPic) {
		this.ado_AniPic = ado_AniPic;
	}
	public int getAdo_Views() {
		return ado_Views;
	}
	public void setAdo_Views(int ado_Views) {
		this.ado_Views = ado_Views;
	}
	
	
}
