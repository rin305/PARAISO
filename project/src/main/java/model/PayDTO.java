package model;

public class PayDTO {
	int rsv_num;
	String mem_id;
	int room_num;
	String rsv_name;
	int pay_num;
	String rsv_cancel;
	String rsv_start;
	String rsv_end;
	int rsv_price;
	String rsv_person;
	public int getRsv_num() {
		return rsv_num;
	}
	public void setRsv_num(int rsv_num) {
		this.rsv_num = rsv_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getRsv_name() {
		return rsv_name;
	}
	public void setRsv_name(String rsv_name) {
		this.rsv_name = rsv_name;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getRsv_cancel() {
		return rsv_cancel;
	}
	public void setRsv_cancel(String rsv_cancel) {
		this.rsv_cancel = rsv_cancel;
	}
	public String getRsv_start() {
		return rsv_start;
	}
	public void setRsv_start(String rsv_start) {
		this.rsv_start = rsv_start;
	}
	public String getRsv_end() {
		return rsv_end;
	}
	public void setRsv_end(String rsv_end) {
		this.rsv_end = rsv_end;
	}
	public int getRsv_price() {
		return rsv_price;
	}
	public void setRsv_price(int rsv_price) {
		this.rsv_price = rsv_price;
	}
	public String getRsv_person() {
		return rsv_person;
	}
	public void setRsv_person(String rsv_person) {
		this.rsv_person = rsv_person;
	}
	
	public PayDTO(int rsv_num, String mem_id, int room_num, String rsv_name, int pay_num, String rsv_cancel,
			String rsv_start, String rsv_end, int rsv_price, String rsv_person) {

		this.rsv_num = rsv_num;
		this.mem_id = mem_id;
		this.room_num = room_num;
		this.rsv_name = rsv_name;
		this.pay_num = pay_num;
		this.rsv_cancel = rsv_cancel;
		this.rsv_start = rsv_start;
		this.rsv_end = rsv_end;
		this.rsv_price = rsv_price;
		this.rsv_person = rsv_person;
	}
	
	public PayDTO() {
		super();
	}
	
	
	
	
	
}
