package wanted.sell.dto;

public class SellDTO
{
	private String idx;					// 판매글 번호
	private String brand;				// 브랜드
	private String model;				// 모델명
	private String grade;				// 등급
	private String year;					// 연식
	private String km;					// 주행거리
	private String fuel;					// 연료
	private String transmission;			// 변속기
	private String title;				// 판매글 제목
	private String contents;				// 판매글 상세내용
	private int price;					// 판매 금액
	private java.sql.Date regidate;		// 판매글 등록 날짜
	private String id;					// 차량을 판매하는 회원 아이디
	
	// 기본생성자
	public SellDTO() {}
	
	// 인자생성자
	public SellDTO(String idx, String brand, String model, String grade, 
			String year, String km, String fuel, String transmission,
			String title, String contents, int price, java.sql.Date regidate, String id)
	{
		this.idx = idx;
		this.brand = brand;
		this.model = model;
		this.grade = grade;
		this.year = year;
		this.km = km;
		this.fuel = fuel;
		this.transmission = transmission;
		this.title = title;
		this.contents = contents;
		this.price = price;
		this.regidate = regidate;
		this.id = id;
	}
	
	// getter() & setter()
	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getKm() {
		return km;
	}
	public void setKm(String km) {
		this.km = km;
	}
	
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	
	public String getTransmission() {
		return transmission;
	}
	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
