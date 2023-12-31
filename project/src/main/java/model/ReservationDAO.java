package model;


//DBConnectionMgr(DB접속,관리),BoardDTO(매개변수,반환형,데이터를 담는 역할)

//DB사용
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//ArrayList,List을 사용
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO { //MemberDAO

	private DBConnectionMgr pool=null;//1.연결객체선언
	//공통
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;//select
	private String sql="";//실행시킬 SQL구문 저장
	
	//2.생성자를 통해서 연결=>의존관계
	public ReservationDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {
			System.out.println("DB접속 오류=>"+e);
		}
	}//생성자
	
	
	public int getNewNum(){ //예약 번호 얻기
		int newNum=1;//저장할 게시물 번호 디폴트 설정값 1
		try {
			sql="select max(rsv_num) from reservation";
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
			if(rs.next()) {//레코드가 한개라도 존재한다면 최대값+1
				newNum=rs.getInt(1)+1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return newNum;
   }
	
	 public int getPayNewNum(){ //결제 번호 얻기
			int newNum=1;//저장할 게시물 번호 디폴트 설정값 1
			try {
				sql="select max(pay_num) from pay";
				con=pool.getConnection();
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery(sql);
				if(rs.next()) {//레코드가 한개라도 존재한다면 최대값+1
					if (rs.getInt(1) < 1) {
						newNum = 2;
					} 					
					else {
						newNum = rs.getInt(1)+1;
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(newNum);
			return newNum;
	   }
	
	
	//1. 예약이 없는 방 목록 얻어오기 
	   public List<ReservationDTO> getAvailableRooms(String person, String checkinDate, String checkoutDate) {
		    List<ReservationDTO> roomList = new ArrayList<>();
		    try {
		        con = pool.getConnection();
		        System.out.println("conn=>"+con);
		        StringBuffer sb = new StringBuffer();
		        sb.append("SELECT * FROM room WHERE room.room_person >= ? ");
		        sb.append("AND NOT EXISTS (SELECT * FROM reservation WHERE reservation.room_num = room.room_num ");
		        sb.append("AND ((reservation.rsv_start BETWEEN ? AND ? OR reservation.rsv_end BETWEEN ? AND ?)) ");
		        sb.append("AND reservation.rsv_cancel != '1') ");
		        sb.append("ORDER BY room.room_price ASC");
		        String sql = sb.toString();
		       pstmt = con.prepareStatement(sql);
		       pstmt.setString(1, person);
		       pstmt.setString(2, checkinDate);
		       pstmt.setString(3, checkoutDate);
		       pstmt.setString(4, checkinDate);
		       pstmt.setString(5, checkoutDate);
		       rs = pstmt.executeQuery();
		       while (rs.next()) {
			       System.out.println("room_num=>"+rs.getInt("room_num"));
			       System.out.println("room_type=>"+rs.getString("room_type"));
		           ReservationDTO room = new ReservationDTO();
		           room.setRoom_num(rs.getString("room_num"));
		           room.setRoom_type(rs.getString("room_type"));
		           room.setRoom_person(rs.getString("room_person"));
		           room.setRoom_price(rs.getString("room_price"));
		           roomList.add(room);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    return roomList;
		}
	   
	   //예약 리스트 확인
	   public List<ReservationDTO> getReserveInfo(String mem_id, String checkinDate, String checkoutDate) {
		    List<ReservationDTO> res = new ArrayList<>();

		    try {
		        con = pool.getConnection();
		        System.out.println("conn=>"+con);
		        StringBuffer sb = new StringBuffer();
		        sb.append("SELECT r.rsv_num, r.rsv_name, r.rsv_person, rm.room_type, r.rsv_start, r.rsv_end, r.rsv_price, r.rsv_cancel ");
		        sb.append("FROM reservation r ");
		        sb.append("JOIN room rm ON r.room_num = rm.room_num ");
		        sb.append("WHERE r.mem_id = ? AND ((r.rsv_start BETWEEN ? AND ?) OR (r.rsv_end BETWEEN ? AND ?)) ");
		        sb.append("ORDER BY r.rsv_num DESC");
		        String sql = sb.toString();
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1,mem_id);
		        pstmt.setString(2,checkinDate);
		        pstmt.setString(3,checkoutDate);
		        pstmt.setString(4,checkinDate);
		        pstmt.setString(5,checkoutDate);
		        rs = pstmt.executeQuery();
		       while (rs.next()) {
		    	   System.out.println("rsv_start=>"+rs.getString("rsv_start"));
		    	   ReservationDTO resInfo = new ReservationDTO();
		           resInfo.setRsv_num(rs.getString("rsv_num"));
		           resInfo.setRsv_name(rs.getString("rsv_name"));
		           resInfo.setRsv_person(rs.getString("rsv_person"));
		           resInfo.setRoom_type(rs.getString("room_type"));
		           resInfo.setRsv_start(rs.getString("rsv_start"));
		           resInfo.setRsv_end(rs.getString("rsv_end"));
		           resInfo.setRsv_price(rs.getString("rsv_price"));
				   resInfo.setRsv_cancel(rs.getString("rsv_cancel"));
				   System.out.println("rsInfo : "+resInfo.getRsv_name());

		           res.add(resInfo);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    return res;
		}
	   
	   
	   
	   //예약 등록
	   public void rsvRoom(String mem_id,String rsv_name,String room_num,String rsv_start, String rsv_end,String rsv_price,String rsv_person,String rsv_phone){
			try{
				int newNum = getNewNum();
				int newPayNum = 1; // payNum 이 1 이면 결제가 안 된 상태
				sql = "insert into reservation(rsv_num,mem_id,rsv_name,room_num,rsv_start,rsv_end,rsv_person,rsv_price,rsv_phone,pay_num)"
						+ " values(?,?,?,?,?,?,?,?,?,?)";
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, newNum);
				pstmt.setString(2, mem_id);
				pstmt.setString(3, rsv_name);
				pstmt.setString(4, room_num);
				pstmt.setString(5, rsv_start);
				pstmt.setString(6, rsv_end);
				pstmt.setString(7, rsv_person);
				pstmt.setString(8, rsv_price);
				pstmt.setString(9, rsv_phone);
				pstmt.setInt(10, newPayNum);
				pstmt.execute();
				pstmt.close();
				con.close();
		  	}catch(Exception e ) {e.printStackTrace();}
		}//end rsvRoom
	   
	   
	   //예약 상세 얻어오기
	   public ReservationDTO getReserveDetail(String rsv_num) {
		    ReservationDTO res = new ReservationDTO();
		    try {
		        con = pool.getConnection();
		        System.out.println("conn=>"+con);
		        StringBuilder sb = new StringBuilder();
		        sb.append("SELECT r.rsv_num, r.rsv_name, rm.room_type, r.room_num, r.rsv_person, r.rsv_start, r.rsv_end, r.rsv_price, r.rsv_cancel, r.pay_num ");
		        sb.append("FROM reservation r ");
		        sb.append("JOIN room rm ON r.room_num = rm.room_num ");
		        sb.append("WHERE r.rsv_num = ?");

		        String sql = sb.toString();

		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1,rsv_num);
		        rs = pstmt.executeQuery();
		        rs.next();
		           res.setRsv_num(rs.getString("rsv_num"));
		           res.setRsv_name(rs.getString("rsv_name"));
		           res.setRoom_type(rs.getString("room_type"));
		           res.setRoom_num(rs.getString("room_num"));
		           res.setRsv_person(rs.getString("rsv_person"));
		           res.setRsv_start(rs.getString("rsv_start"));
		           res.setRsv_end(rs.getString("rsv_end"));
		           res.setRsv_price(rs.getString("rsv_price"));
				   res.setRsv_cancel(rs.getString("rsv_cancel"));
				   res.setPay_num(rs.getString("pay_num"));
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    return res;
		}
	   
	   public boolean reservationCancel(String rsv_num) {
			try {
				con = pool.getConnection();
				sql = "UPDATE reservation SET rsv_cancel = '1' WHERE rsv_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rsv_num);
				int result = pstmt.executeUpdate();
				if (result > 0) {
					return true;
				} else return false;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			} finally {
				try {
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	   
	   
	   public boolean reservePayment(String rsv_num, String mem_id, String rsv_price, String room_num) {
			int newNum = getPayNewNum();
			try {
				
			sql = "UPDATE reservation SET pay_num='"+newNum+"' WHERE rsv_num='"+rsv_num+"'";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			if ( result > 0 ) {
				PreparedStatement pstmt2 = con.prepareStatement("INSERT INTO pay(pay_num, rsv_num, mem_id, pay_price, room_num) values(?, ?, ?, ?, ?)");
				pstmt2.setInt(1, newNum);
				pstmt2.setString(2, rsv_num);
				pstmt2.setString(3, mem_id);
				pstmt2.setString(4, rsv_price);
				pstmt2.setString(5, room_num);
				int result2 = pstmt2.executeUpdate();
				pstmt2.close();
				return result2 > 0;
			} else return false;
			} catch (Exception e) {
				System.out.println("reservePayment 에러 발생 : "+e);
				return false;
			} finally {
				try {
				con.close();
				pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	   
	   
}
