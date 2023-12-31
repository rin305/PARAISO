package model;

import java.sql.*;//DB연결
import java.util.*;//Vector,ArrayList~
import java.util.Date;


public class MemberDAO{
	
	//1.멤버변수에 연결할 클래스의 객체를 선언
	private DBConnectionMgr pool=null;
	//getConnection()=>Connection필요,freeConnection() 메모리 해제
	
	//1-1)공통으로 접속할 경우 필요로 하는 멤버변수
	private Connection con=null;
	private PreparedStatement pstmt=null;//sql실행 목적
	private ResultSet rs=null;//select
	private String sql="";//실행시킬 SQL 구문 저장 목적
	private String sql2="";

	
	//2.생성자를 통해서 자동으로 객체를 얻어올 수 있도록 연결
	public MemberDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		}catch(Exception e) {
			System.out.println("DB연결실패=>"+e);//e.toString
		}
	}
	
	public int checkId(String mem_id) {
		int check=0;//지역변수
		try {
			con=pool.getConnection();//이미 만들어진 Connection 반환
			con.setAutoCommit(false);
			sql="select mem_id from member where mem_id=?";
			pstmt=con.prepareStatement(sql);//실행시킬 sql구문
			pstmt.setString(1,mem_id); //index~에러유발
			rs=pstmt.executeQuery();//select구문을 호출할 때 사용하는 메서드
			if(rs.next()) {
				check=0;//id를 입력하지 않았거나 이미 존재하는 아이디라면
			}else {
				check=1;//이미 있는 아이디가 아니라면
			}
		}catch(Exception e) { 
			System.out.println("checkId() 실행오류=>"+e);
			e.printStackTrace();
		}finally {//3.메모리해제
			pool.freeConnection(con, pstmt, rs);
		}
		return check;//.jsp에게 반환(전달해주는 역할)	
	}
	
	//(3) 회원가입 정보 입력 메서드
	public boolean memberInsert(MemberDTO mem) {
		boolean check=false;//회원가입 성공유무
		
		try {
			con=pool.getConnection();
			//--트랜잭션=>오라클의 필수(P410~413)=>자동으로 commit(X)
			con.setAutoCommit(false);//default->true
			sql="insert into member(mem_id,mem_name,mem_gender,mem_phone,mem_birth,mem_addr,mem_addr2,mem_zip,"
					+"mem_pw,mem_email,mem_grade,mem_date) values(?,?,?,?,?,?,?,?,?,?,'일반',sysdate)";
			//---------------------------------------------
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem.getMem_id());
			pstmt.setString(2, mem.getMem_name());
			pstmt.setString(3, mem.getMem_gender());
			pstmt.setString(4, mem.getMem_phone());
			pstmt.setString(5, mem.getMem_birth());
			pstmt.setString(6, mem.getMem_addr());
			pstmt.setString(7, mem.getMem_addr2());
			pstmt.setString(8, mem.getMem_zip());
			pstmt.setString(9, mem.getMem_pw());
			pstmt.setString(10, mem.getMem_email());
			
			int insert=pstmt.executeUpdate();//반환값 1 (성공) ,0 (실패)
			con.commit();//메모리->실제 테이블에 반영
			System.out.println("insert(데이터 입력유무)=>"+insert);
			if(insert > 0) {//if(insert==1)
				check=true;//데이터 성공확인
				//비밀번호 입력하기
				sql="insert into login(mem_id,mem_pw,mem_grade) values(?,?,'일반')";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, mem.getMem_id());
				pstmt.setString(2, mem.getMem_pw());
				pstmt.executeUpdate();
				con.commit();
			}
		}catch(Exception e) {
			System.out.println("memberInsert() 실행오류=>"+e);
		}finally {
			pool.freeConnection(con, pstmt);//rs X (select가 아님)
		}
		return check;//memberInsert.jsp에서 메서드의 반환값
	}

	//(4)특정 회원의 정보를 구해주는 메서드
public MemberDTO getPerson(String mem_id) throws Exception{
		
		con=pool.getConnection();
		con.setAutoCommit(false);
		sql="select * from member where mem_id=?";
		pstmt=con.prepareStatement(sql);//실행시킬 sql구문
		pstmt.setString(1,mem_id); //index~에러유발
		rs=pstmt.executeQuery();	
		MemberDTO memdto;
			if(rs.next()) {
				memdto = new MemberDTO();
				memdto.setMem_id(rs.getString("mem_id"));
				memdto.setMem_pw(rs.getString("mem_pw"));
				memdto.setMem_name(rs.getString("mem_name"));
				memdto.setMem_gender(rs.getString("mem_gender"));
				memdto.setMem_birth(rs.getString("mem_birth"));
				memdto.setMem_phone(rs.getString("mem_phone"));
				memdto.setMem_addr(rs.getString("mem_addr"));
				memdto.setMem_addr2(rs.getString("mem_addr2"));
				memdto.setMem_zip(rs.getString("mem_zip"));
				memdto.setMem_email(rs.getString("mem_email"));
				memdto.setMem_grade(rs.getString("mem_grade"));
				memdto.setMem_date(rs.getDate("mem_date"));
			}else {
				memdto = null;
			}
		
			pool.freeConnection(con, pstmt, rs);	
			return memdto;
		
	}
//회원리스트 구하는 메서드
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
         String mem_email=rs.getString("mem_email");
         String mem_zip=rs.getString("mem_zip");
         String mem_addr=rs.getString("mem_addr");
         String mem_addr2=rs.getString("mem_addr2");
         String mem_grade=rs.getString("mem_grade");
         Date mem_date=rs.getDate("mem_date");
//        
         // 묶고->담고
         MemberDTO vo=new MemberDTO(mem_id,mem_pw, mem_name, mem_gender, mem_birth,mem_phone, mem_email, mem_zip,mem_addr, mem_addr2, mem_grade,mem_date);
        
         list.add(vo);         
      }
    } catch (Exception e) {
       e.printStackTrace();
    }finally {
      pool.freeConnection(con, pstmt, rs);;
    }    
    return list;
   }
	
//(5)회원 등급을 구해주는 메서드	
public boolean setMembership(String mem_id) {
	boolean check = false;
	try {
		con = pool.getConnection();
		// --트랜잭션=>오라클의 필수(P410~413)=>자동으로 commit(X)
		con.setAutoCommit(false);// default->true
		sql = "select sum(pay_price) from pay where mem_id=?";
		// ---------------------------------------------
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_id);//입력한 아이디의 구매총액을 구함
		rs = pstmt.executeQuery();// 반환값 1 (성공) ,0 (실패)
		if (rs.next()) {
			int total_price = rs.getInt("sum(pay_price)");
			System.out.println("setMemberShip의 total_price=>"+total_price);
			/*
			 * rs=pstmt.executeQuery();
			 */			
			if (total_price >= 100) {
				sql2 = "update member set mem_grade='VIP' where mem_id=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, mem_id);
				pstmt.executeUpdate();
				con.commit();

			} else if (total_price >= 50 && total_price < 100) {
				sql2 = "update member set mem_grade='골드' where mem_id=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, mem_id);
				pstmt.executeUpdate();
				con.commit();

			} else if (total_price >= 20 && total_price < 500) {
				sql2 = "update member set mem_grade='실버' where mem_id=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, mem_id);
				pstmt.executeUpdate();
				con.commit();
			} else if (total_price >=0){
				sql2 = "update member set mem_grade='일반' where mem_id=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, mem_id);
				pstmt.executeUpdate();
				con.commit();
			}
			check=true;//성공적으로 등급이 변경되었다면
		}		
	} catch (Exception e) {
		System.out.println("setMembership() 실행오류=>" + e);
	} finally {// 3.메모리해제
		pool.freeConnection(con, pstmt, rs);
	}
	return check; //
}	

		
	/*	
	 * public MemberDTO searchMember(String mem_id) {
			MemberDTO memdto = null;
			try {
				con = pool.getConnection();
				System.out.println("con->" + con);
				sql = "select * from member where mem_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				rs = pstmt.executeQuery();
					if(rs.next()) {
						memdto = new MemberDTO();
						memdto.setMem_id(rs.getString("mem_id"));
						memdto.setMem_addr(rs.getString("mem_addr"));
						memdto.setMem_addr2(rs.getString("mem_addr2"));
						memdto.setMem_birth(rs.getString("mem_birth"));
						memdto.setMem_zip(rs.getString("mem_zip"));
						memdto.setMem_date(rs.getDate("mem_date"));
						memdto.setMem_gender(rs.getString("mem_gender"));
						memdto.setMem_grade(rs.getString("mem_grade"));
						memdto.setMem_name(rs.getString("mem_name"));
						memdto.setMem_phone(rs.getString("mem_phone"));
						memdto.setMem_pw(rs.getString("mem_pw"));
						memdto.setMem_email(rs.getString("mem_email"));
					}
				}catch (Exception e) {
					System.out.println("searchMember()에러유발->" + e);
				} finally {//3.메모리해제
					pool.freeConnection(con,pstmt,rs);
				}
				return memdto;
		}	
			//회원수정
			public boolean memberUpdate(MemberDTO mdto) {
				boolean check = false; //회원수정 성공유무
				try {
					con = pool.getConnection();
					con.setAutoCommit(false);//값을넣을때 트랜잭션 처리
					sql = "Update Member set m_passwd=?, m_name=?, m_email=?, m_address=?,"
							+ "m_zipcode=?, m_phone=?, m_point=? where m_id=?";
					System.out.println("id=>" + mdto.getM_id());
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mdto.getM_passwd());
					pstmt.setString(2, mdto.getM_name());
					pstmt.setString(3, mdto.getM_email());
					pstmt.setString(4, mdto.getM_address());
					pstmt.setString(5, mdto.getM_zipcode());
					pstmt.setString(6, mdto.getM_phone());
					pstmt.setInt(7, mdto.getM_point());
					pstmt.setString(8, mdto.getM_id());
					int update = pstmt.executeUpdate();
					System.out.println("update(데이터생성유무)=>" + update);
					con.commit();
					if(update > 0) {
						check = true;
						sql ="Update MemberLogin set m_passwd=?, m_point=? where m_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, mdto.getM_passwd());
						pstmt.setInt(7, mdto.getM_point());
						pstmt.setString(3, mdto.getM_id());
						pstmt.executeUpdate();
						con.commit();
					}
				} catch (Exception e) {
					System.out.println("memberUpdate에러유발->" + e);
				} finally {
					pool.freeConnection(con, pstmt);
				}
				return check;
			}
		*/
//비밀번호찾기
/*
		public boolean pwSearch(String mem_id) {
			boolean mem_pw = false; 
			try {
				con = pool.getConnection();
				System.out.println("con->" + con);
				sql = "select mem_pw from member where mem_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				rs = pstmt.executeQuery();
					if(rs.next()) {
					String pw = rs.getString("mem_pw");
					 if(pw!=null) {
						 mem_pw = true;
					 }
					}
				}catch (Exception e) {
					System.out.println("pwSearch()에러유발->" + e);
				} finally {//3.메모리해제
					pool.freeConnection(con,pstmt,rs);
				}
				return mem_pw;
		}
	*/	
		
//(6)총액을 구해주는 메서드
public int getTotalIncome() {
	boolean check=false;
	int totalincome = 0;
	try {
		con=pool.getConnection();
		con.setAutoCommit(false);//default->true
		sql="select sum(pay_price) from pay"; //결제 테이블에서 결제금액의 합계를 가져옴
		//---------------------------------------------
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();//반환값 1 (성공) ,0 (실패)
		if(rs.next()) {
			totalincome=rs.getInt("sum(pay_price)");
		}else{
			check=false;
		}
	}catch(Exception e) { 
		System.out.println("getTotalIncome() 실행오류=>"+e);
	}finally {//3.메모리해제
		pool.freeConnection(con, pstmt, rs);
	}
	return totalincome;
}

//(7)비밀번호 찾기 시 사용되는 메서드 - 회원 아이디로 회원 이메일을 구함
public String getUserEmail(String mem_id) {
	
	try {
		con = pool.getConnection();
		System.out.println("con->" + con);
		String sql = "select mem_email from member where mem_id=?";
		pstmt=con.prepareStatement(sql);//실행시킬 sql구문
		pstmt.setString(1,mem_id); //index~에러유발
		rs=pstmt.executeQuery();//select구문을 호출할 때 사용하는 메서드
		if(rs.next()) {
			rs.getString(mem_id);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		pool.freeConnection(con,pstmt,rs);
		}
	return null; // 데이터베이스 오류
}


//(8) 아이디 찾기 시 사용되는 메서드 (회원 이메일로 회원 아이디를 구함)
public String getUserId(String mem_email) {
	String mem_id=null;
	try {
		con = pool.getConnection();
		con.setAutoCommit(false);
		sql = "select mem_id from member where mem_email = ?";
		System.out.println("con->" + con);
		pstmt=con.prepareStatement(sql);//실행시킬 sql구문
		pstmt.setString(1,mem_email); //index~에러유발
		rs=pstmt.executeQuery();//select구문을 호출할 때 사용하는 메서드
		if(rs.next()) {
			mem_id=rs.getString("mem_id");
		}else {
			mem_id=null;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		pool.freeConnection(con,pstmt,rs);
		}
	return mem_id;
}


//(9) 랜덤 비밀번호를 구해 입력시켜주는 메서드
public String changeImsiPassword(String mem_id) {
	Helper ran=new Helper();
	String ranpw=ran.getRandomPassword();//랜덤 6자리 코드
try {
	con = pool.getConnection();
	con.setAutoCommit(false);
	sql = "update member set mem_pw =? where mem_id = ? ";
	System.out.println("con->" + con);
	pstmt=con.prepareStatement(sql);//실행시킬 sql구문
	pstmt.setString(1, ranpw); 
	pstmt.setString(2, mem_id);
	int update=pstmt.executeUpdate();
	System.out.println("update(비밀번호 변경유무)=>" + update);//변경->1
	if(update > 0) {
		sql="update login set mem_pw = ? where mem_id = ?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ranpw);
		pstmt.setString(2, mem_id);
		pstmt.executeUpdate();
		con.commit();
	}
} catch (Exception e) {
	e.printStackTrace();
}finally {
	pool.freeConnection(con,pstmt);
	}
return ranpw;//변경된 비밀번호 값을 리턴
}

//(10) 회원의 이름, 이메일을 얻어와 그 값이 서로 상응하는지 확인하는 메서드(비밀번호 찾기 이용)
public int findPassword(String mem_id, String mem_name,String mem_email) {
	int check=0;//지역변수
	try {
		con=pool.getConnection();//이미 만들어진 Connection 반환
		con.setAutoCommit(false);
		sql="select mem_name, mem_email from member where mem_id=?";
		pstmt=con.prepareStatement(sql);//실행시킬 sql구문
		pstmt.setString(1,mem_id); //index~에러유발
		rs=pstmt.executeQuery();//select구문을 호출할 때 사용하는 메서드
		if(rs.next()) {
			if(mem_name.equals(rs.getString("mem_name")) && mem_email.equals(rs.getString("mem_email"))) {
				check=1;//값이 일치한다면
			}else if(mem_name.equals(rs.getString("mem_name")) && !mem_email.equals(rs.getString("mem_email"))){
				check=-1;//아이디,이름 일치 + 이메일 불일치
			}else if(!mem_name.equals(rs.getString("mem_name")) && mem_email.equals(rs.getString("mem_email"))){
				check=-2;//아이디,이메일 일치 + 이름 불일치
			}
		}else {
			check=0;//해당 아이디 자체가 존재하지 않는 경우
		}
	}catch(Exception e) { 
		System.out.println("findPassword() 실행오류=>"+e);
		e.printStackTrace();
	}finally {//3.메모리해제
		pool.freeConnection(con, pstmt, rs);
	}
	return check;//.jsp에게 반환(전달해주는 역할)	
}

//(11) 회원의 이름, 이메일을 얻어와 실제 한 개로 합쳐지는 데이터가 있는지 확인하는 메서드(아이디 찾기 이용)
public int findId(String mem_name,String mem_email) {
	int check=0;//지역변수
	try {
		con=pool.getConnection();//이미 만들어진 Connection 반환
		con.setAutoCommit(false);
		sql="select mem_name from member where mem_id=(select mem_id from member where mem_email=?)";
		pstmt=con.prepareStatement(sql);//실행시킬 sql구문
		pstmt.setString(1,mem_email); //index~에러유발
		rs=pstmt.executeQuery();//select구문을 호출할 때 사용하는 메서드
		if(rs.next()) {
			if(mem_name.equals(rs.getString("mem_name"))) {
				check=1;//해당 이메일에 입력된 이름과 전달받은 이름값이 서로 일치하는 경우
			}else {
				check=-1;//이메일에 상응하는 아이디가 있긴있음 근데 입력받은 이름값이랑 일치하지는 않음ㄴ
			}
		}else {
			check=0;//해당 이메일에 부합하는 아이디가 없습니다
		}
	}catch(Exception e) { 
		System.out.println("checkId() 실행오류=>"+e);
		e.printStackTrace();
	}finally {//3.메모리해제
		pool.freeConnection(con, pstmt, rs);
	}
	return check;//.jsp에게 반환(전달해주는 역할)	
}

//(12) 비밀번호 변경 메서드
public boolean ChangePw(String mem_id, String mem_pw) {
	boolean check=false;//비밀번호 변경 여부
	try {
		con=pool.getConnection();
		//--트랜잭션=>오라클의 필수(P410~413)=>자동으로 commit(X)
		con.setAutoCommit(false);//default->true
		sql="update member set mem_pw=? where mem_id=?";
		//---------------------------------------------
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, mem_pw);
		pstmt.setString(2, mem_id);
		int update=pstmt.executeUpdate();//반환값 1 (성공) ,0 (실패)
		con.commit();//메모리->실제 테이블에 반영
		System.out.println("update(데이터 변경유무)=>"+update);
		if(update > 0) {//if(insert==1)
			check=true;//데이터 성공확인
			//비밀번호 입력하기
			sql="update login set mem_pw=? where mem_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_pw);
			pstmt.setString(2, mem_id);
			pstmt.executeUpdate();
			con.commit();
		}
	}catch(Exception e) {
		System.out.println("ChangePw() 실행오류=>"+e);
	}finally {
		pool.freeConnection(con, pstmt);//rs X (select가 아님)
	}
	return check;//changeSucess.jsp로 이동
}

//(13) 회원 탈퇴 메서드
public boolean memberDelete(String mem_id, String mem_pw) {
	boolean check=false;//회원가입 성공유무
	try {
		con=pool.getConnection();
		//--트랜잭션=>오라클의 필수(P410~413)=>자동으로 commit(X)
		con.setAutoCommit(false); //default->true
		sql="delete from login where mem_id=?";
		System.out.println("delete들어왔니?");
		//---------------------------------------------
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		int delete=pstmt.executeUpdate();//반환값 1 (성공) ,0 (실패)
		con.commit();//메모리->실제 테이블에 반영
		System.out.println("delete(회원 삭제 여부)=>"+delete);
		pstmt.clearParameters();
		if(delete > 0) {//if(delete==1)
			check=true;//데이터 성공확인
			//비밀번호 입력하기
			sql="delete from member where mem_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.executeUpdate();
			con.commit();
		}
	}catch(Exception e) {
		System.out.println("MemberDelete() 실행오류=>"+e);
	}finally {
		pool.freeConnection(con, pstmt);//rs X (select가 아님)
	}
	return check;//index.jsp로 이동
}

//(14)회원 정보 수정 메서드
public boolean MemberUpdate(MemberDTO dto) {
	boolean check=false; //회원정보 수정 여부
	try {
		con=pool.getConnection();
		con.setAutoCommit(false);
	   sql="update member set mem_name=?, mem_gender=?, mem_birth=?, mem_email=?, mem_phone=?,"
			   			+"mem_addr=?, mem_addr2=?, mem_zip=? where mem_id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1,dto.getMem_name());
	   pstmt.setString(2, dto.getMem_gender());
	   pstmt.setString(3, dto.getMem_birth());
	   pstmt.setString(4, dto.getMem_email());
	   pstmt.setString(5, dto.getMem_phone());
	   pstmt.setString(6, dto.getMem_addr());
	   pstmt.setString(7, dto.getMem_addr2());
	   pstmt.setString(8, dto.getMem_zip());
	   pstmt.setString(9, dto.getMem_id());
	   pstmt.executeUpdate();
	   con.commit();
	   check=true;
	} catch (Exception e) {
		System.out.println("MemberUpdate 실행오류 =>"+e);
	}finally {
		pool.freeConnection(con, pstmt);
	}	   
	   return check;
}

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

	
}