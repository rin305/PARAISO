package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class ManagerDAO {
	private DBConnectionMgr pool=null;
	
	private Connection con=null;
	private PreparedStatement pstmt=null;//sql실행 목적
	private ResultSet rs=null;//select
	private String sql="";//실행시킬 SQL 구문 저장 목적


	
	//2.생성자를 통해서 자동으로 객체를 얻어올 수 있도록 연결
	public ManagerDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		}catch(Exception e) {
			System.out.println("DB연결실패=>"+e);//e.toString
		}
	}
	//회원목록리스트구하기
	public ArrayList<MemberDTO> memberList() {
	    ArrayList<MemberDTO> list=new ArrayList<MemberDTO>();
	    try {
	    	con=pool.getConnection();
	    	sql="select * from member";
	      pstmt=con.prepareStatement(sql);
	      rs=pstmt.executeQuery(); // rs->커서
	      while(rs.next()) {
	         String mem_id=rs.getString("mem_id");
	         String mem_pw=rs.getString("mem_pw");
	         String mem_name=rs.getString("mem_name");
	         String mem_gender=rs.getString("mem_gender");
	         String mem_birth=rs.getString("mem_birth");
	         String mem_phone=rs.getString("mem_phone");
	         String mem_addr=rs.getString("mem_addr");
	         String mem_addr2=rs.getString("mem_addr2");
	         String mem_zip=rs.getString("mem_zip");
	         String mem_email=rs.getString("mem_email");
	         String mem_grade=rs.getString("mem_grade");
	         Date mem_date=rs.getDate("mem_date");
//	        
	         // 묶고->담고
	         MemberDTO vo=new MemberDTO(mem_id,mem_pw,mem_name,mem_gender,mem_birth,mem_phone,mem_addr,mem_addr2,mem_zip,mem_email,mem_grade,mem_date);
	        
	         list.add(vo);         
	      }
	    } catch (Exception e) {
	       e.printStackTrace();
	    }finally {
	      pool.freeConnection(con, pstmt, rs);;
	    }    
	    return list;
	   }
	//매출목록리스트구하기
	public ArrayList<PayDTO> payList() {
	    ArrayList<PayDTO> list=new ArrayList<PayDTO>();
	    try {
	    	con=pool.getConnection();
	    	sql="select * from reservation";
	      pstmt=con.prepareStatement(sql);
	      rs=pstmt.executeQuery(); // rs->커서
	      while(rs.next()) {
	         int rsv_num=rs.getInt("rsv_num");
	         String mem_id=rs.getString("mem_id");
	         int  room_num=rs.getInt("room_num");
	         String rsv_name=rs.getString("rsv_name");
	         int pay_num=rs.getInt("pay_num");
	         String rsv_cancel=rs.getString("rsv_cancel");
	         String rsv_start=rs.getString("rsv_start");
	         String rsv_end=rs.getString("rsv_end");
	         int rsv_price=rs.getInt("rsv_price");
	         String rsv_person=rs.getString("rsv_person");
	       
//	        
	         // 묶고->담고
	         PayDTO vo=new PayDTO(rsv_num,mem_id,room_num,rsv_name,pay_num,rsv_cancel,rsv_start,rsv_end,rsv_price,rsv_person);
	        
	         list.add(vo);         
	      }
	    } catch (Exception e) {
	       e.printStackTrace();
	    }finally {
	      pool.freeConnection(con, pstmt, rs);;
	    }    
	    return list;
	   }
	
	//방가격수정리스트
	
	
}
