package model;

public class RoomDTO {
	
	private int room_num;
	private String room_type;
	private int room_price;
	private String room_person;
	private String room_grade;
	
	
	private int peakseason;
	private int offseason;
	
	public RoomDTO() {
	}
	
	public RoomDTO(int room_num, String room_type, int room_price, String room_person, String room_grade,
			int peakseason, int offseason) {
		super();
		this.room_num = room_num;
		this.room_type = room_type;
		this.room_price = room_price;
		this.room_person = room_person;
		this.room_grade = room_grade;
		this.peakseason = peakseason;
		this.offseason = offseason;
	}
	
	public int getPeakseason() {
		return peakseason;
	}
	public void setPeakseason(int peakseason) {
		this.peakseason = peakseason;
	}
	public int getOffseason() {
		return offseason;
	}
	public void setOffseason(int offSeason) {
		this.offseason = offSeason;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getRoom_person() {
		return room_person;
	}
	public void setRoom_person(String room_person) {
		this.room_person = room_person;
	}
	public String getRoom_grade() {
		return room_grade;
	}
	public void setRoom_grade(String room_grade) {
		this.room_grade = room_grade;
	}
	
	
}
