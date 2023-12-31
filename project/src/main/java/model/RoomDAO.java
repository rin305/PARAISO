package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomDAO {
	private DBConnectionMgr pool=null;//1.연결객체선언
	//공통
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;//select
	private String sql="";//실행시킬 SQL구문 저장
	
	public RoomDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {
			System.out.println("DB접속 오류=>"+e);
		}
	}
	
	// 룸별 가격 보여주기
		public RoomDTO selectList(String room_type){
			RoomDTO roomdto=null;
			
			try {
				con=pool.getConnection();
				sql = "select * from room where room_type=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, room_type);
				rs = pstmt.executeQuery();
			 if(rs.next()) {// 성수기,비성수기 가격 가져옴
				roomdto=new RoomDTO();
				roomdto.setRoom_type(rs.getString("room_type"));
				roomdto.setPeakseason(rs.getInt("peakseason"));
				roomdto.setOffseason(rs.getInt("offseason"));
			 }
			}catch(Exception e) {
				System.out.println("selectList()에러"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return roomdto;
		}
		
	
	//1)수정할 데이터를 찾을 메서드 필요=>select * from board where num=?
		public RoomDTO updategetroom(String room_type) {
			
	      RoomDTO room=null;//ArrayList articleList=null;//여러개 담을때	
			try {
				con=pool.getConnection();
				sql="select * from room where room_type=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, room_type);
				rs=pstmt.executeQuery();
				if(rs.next()) {//보여주는 결과가 있다면
					 room=new RoomDTO();//생성된 객체를 얻어온다.
					 room.setRoom_type(rs.getString("room_type"));
					 room.setPeakseason(rs.getInt("peakseason"));
					 room.setOffseason(rs.getInt("offseason"));
				}
			}catch(Exception e) {
				System.out.println("updateGetArticle() 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return room;
		}

		
	//찾은 데이터 가격 수정(peak)
	public int update(RoomDTO roomdto){
		int update=0;
		try {
			con=pool.getConnection();
			sql="update room set peakseason=?, offseason=? where room_type=?";
			pstmt=con.prepareStatement(sql);
			System.out.println("sql=>"+sql);
			pstmt.setInt(1,roomdto.getPeakseason());
			pstmt.setInt(2, roomdto.getOffseason());
			pstmt.setString(3, roomdto.getRoom_type());
			update=pstmt.executeUpdate();
			System.out.println("룸 가격수정 성공유무"+update);
		}catch(Exception e) {
			System.out.println("update()에러유발"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return update;
	}
	
	
	public ArrayList<RoomDTO> roomList() {
	    ArrayList<RoomDTO> list=new ArrayList<RoomDTO>();
	    try {
	    	con=pool.getConnection();
	    	sql="select * from room";
	      pstmt=con.prepareStatement(sql);
	      rs=pstmt.executeQuery(); // rs->커서
	      while(rs.next()) {
	         int room_num=(Integer.parseInt(rs.getString("room_num")));
	         String room_type=rs.getString("room_type");
	         int room_price=(Integer.parseInt(rs.getString("room_price")));
	         String room_person=rs.getString("room_person");
	         String room_grade=rs.getString("room_grade");
	         int peakseason=(Integer.parseInt(rs.getString("peakseason")));
	         int offseason=(Integer.parseInt(rs.getString("offseason")));
	         
	         // 묶고->담고
	         RoomDTO dto=new RoomDTO(room_num,room_type,room_price,room_person,room_grade,peakseason,offseason);
	         list.add(dto);         
	      }
	    } catch (Exception e) {
	       e.printStackTrace();
	    }finally {
	      pool.freeConnection(con, pstmt, rs);
	    }    
	    return list;
	   }
	
	public int insert(RoomDTO roomdto){
		int result=0;
		try {
			con=pool.getConnection();
			sql="insert into room(room_num, room_type, room_grade, room_person, room_price, peakseason, offseason) values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			System.out.println("sql=>"+sql);
			pstmt.setInt(1, roomdto.getRoom_num());
			pstmt.setString(2, roomdto.getRoom_type());
			pstmt.setString(3, roomdto.getRoom_grade());
			pstmt.setString(4, roomdto.getRoom_person());
			pstmt.setInt(5, roomdto.getRoom_price());
			pstmt.setInt(6, roomdto.getPeakseason());
			pstmt.setInt(7, roomdto.getOffseason());
			result=pstmt.executeUpdate();
			System.out.println("방 입력 성공 유무"+result);
		}catch(Exception e) {
			System.out.println("RoomDAO의 insert()에러유발"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	/*
	public int updateOff(RoomDTO roomdto){
		int update=0;
		try {
			con=pool.getConnection();
			sql="update room set offseason=? where room_num=?";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1,roomdto.getPeakSeason());
			pstmt.setInt(1, roomdto.getOffseason());
			pstmt.setInt(2, roomdto.getRoom_num());
			update=pstmt.executeUpdate();
			System.out.println("룸 가격수정 성공유무"+update);
		}catch(Exception e) {
			System.out.println("update()에러유발"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return update;
	}
	/*
	public boolean RoomUpdate(Boolean peak, int roomprice, String roomtype) {
		   boolean check = false; // 방가격 수정 여부
		   try {
		      con = pool.getConnection();
		      con.setAutoCommit(false);
		      if (peak == true) {
		         sql = "update room set room_price=? where room_type=? and peak=1";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, (int) (roomprice*1.1));
		         pstmt.setString(2, roomtype);
		         pstmt.executeUpdate();
		         con.commit();
		         check = true;
		      } else if (peak == false) {
		         sql = "update room set room_price=? where room_type=? and peak=0";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, roomprice);
		         pstmt.setString(2, roomtype);
		         pstmt.executeUpdate(); 
		         con.commit();
		         check = true;
		      }

		   } catch (Exception e) {
		      System.out.println("RoomUpdate 실행오류 =>" + e);
		   } finally {
		      pool.freeConnection(con, pstmt);
		   }
		   return check;
		}
	*/
	
	
	/*
	//선택한 걸 상세로 보여주기
	public RoomDTO selectOne(int room_num){
		RoomDTO roomdto=null;
		try {
		Connection con = pool.getConnection();
		
		sql = "select * from room where room_type=?";
		PreparedStatement ps = con.prepareStatement(sql);
		pstmt.setInt(1, room_num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			roomdto = new RoomDTO();
			
			roomdto.setRoom_num(rs.getInt("room_num"));
			roomdto.setRoom_type(rs.getString("room_type"));
			roomdto.setPeakSeason(rs.getInt("peakseason_price"));
			roomdto.setOffSeason(rs.getInt("offseason_price"));
		}
		else {
			roomdto = null;
		}
		}catch(Exception e) {
			System.out.println("selectOne()에러"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return roomdto;
	}
	*/
}
