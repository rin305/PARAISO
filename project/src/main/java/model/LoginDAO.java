package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	//1.멤버변수에 연결할 클래스의 객체를 선언
		private DBConnectionMgr pool=null;
		//getConnection()=>Connection필요,freeConnection() 메모리 해제
		
		//1-1)공통으로 접속할 경우 필요로 하는 멤버변수
		private Connection con=null;
		private PreparedStatement pstmt=null;//sql실행 목적
		private ResultSet rs=null;//select
		private String sql="";//실행시킬 SQL 구문 저장 목적
		
		//2.생성자를 통해서 자동으로 객체를 얻어올 수 있도록 연결
		public LoginDAO() {
			try {
				pool=DBConnectionMgr.getInstance();
				System.out.println("pool=>"+pool);
			}catch(Exception e) {
				System.out.println("DB연결실패=>"+e);//e.toString
			}
		}
		
		//3.요구분석에 따른 웹상에서 호출할 메서드를 작성
		//1)회원로그인->mem_id,mem_pw
		//반환값 =>int (1 or 0,boolean(true or false)=>메모리 적게 사용
		//SQL구문
		//select mem_id,mem_pw from member where id='nup' and passwd='1234'
		//select 구문=>반환값 O where 조건식->매개변수 O
		public boolean loginCheck(String mem_id,String mem_pw) {
			//1.DB연결
			boolean check=false;
			//2.SQL 구문
			try {
				con=pool.getConnection();//이미 만들어진 Connection 반환
				System.out.println("con=>"+con);
				sql="select mem_id,mem_pw from login where mem_id=? and mem_pw=?";
				pstmt=con.prepareStatement(sql);//실행시킬 sql구문
				pstmt.setString(1, mem_id); 
				pstmt.setString(2, mem_pw);
				rs=pstmt.executeQuery();
				//rs.next()-> 데이터가 존재 true or 없으면 false
				check=rs.next();
			}catch(Exception e) { 
				System.out.println("loginCheck() 실행에러유발=>"+e);
			}finally {//3.메모리해제
				pool.freeConnection(con, pstmt, rs);
			}
			return check;//LoginProc.jsp에서 받아서 페이지 이동할 때 사용
		}
	
		/*
		//관리자인지 아닌지 체크하는 메서드
		public boolean adminCheck(String mem_id,String mem_pw) {
			//1.DB연결
			boolean check=false;
			//2.SQL 구문
			try {
				con=pool.getConnection();//이미 만들어진 Connection 반환
				System.out.println("con=>"+con);
				sql="select mem_id,mem_pw from login where mem_id=? and mem_pw=?";
				pstmt=con.prepareStatement(sql);//실행시킬 sql구문
				pstmt.setString(1, mem_id); 
				pstmt.setString(2, mem_pw);
				rs=pstmt.executeQuery();
				//rs.next()-> 데이터가 존재 true or 없으면 false
				check=rs.next();
			}catch(Exception e) { 
				System.out.println("loginCheck() 실행에러유발=>"+e);
			}finally {//3.메모리해제
				pool.freeConnection(con, pstmt, rs);
			}
			return check;//LoginProc.jsp에서 받아서 페이지 이동할 때 사용
		}
		
		*/
	
}
