package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class ReviewDAO {

	//1.멤버변수에 연결할 클래스의 객체를 선언
		private DBConnectionMgr pool=null;
		//getConnection()=>Connection필요,freeConnection() 메모리 해제
		
		//1-1)공통으로 접속할 경우 필요로 하는 멤버변수
		private Connection con=null;
		private PreparedStatement pstmt=null;//sql실행 목적
		private ResultSet rs=null;//select
		private String sql="";//실행시킬 SQL 구문 저장 목적
		
		//2.생성자를 통해서 자동으로 객체를 얻어올 수 있도록 연결
		public ReviewDAO() {
			try {
				pool=DBConnectionMgr.getInstance();
				System.out.println("pool=>"+pool);
			}catch(Exception e) {
				System.out.println("DB연결실패=>"+e);//e.toString
			}
		}
		
		//3.메서드 작성(페이징 처리를 위한 메서드)
		public int getArticleCount() {//getMemberCount()
			int x=0;//총 레코드수
			try {
				con=pool.getConnection();
				System.out.println("con=>"+con);
				sql="select count(*) from review";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getInt(1);//여기서는 필드명X
				}
			}catch(Exception e) {
				System.out.println("getArticleCount() 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
		
		//4.검색어에 해당되는 총 레코드수를 구하는 메서드(검색분야,검색어)
		public int getArticleSearchCount(String search,String searchtext,String room_type) {
			int x=0;//총 레코드수
			try {
				con=pool.getConnection();
				System.out.println("con=>"+con);
				//-------------------------------------
				if(search==null || search=="") {//검색분야 선택X
					if(room_type==null || room_type=="") {//문의유형 선택X
					sql="select count(*) from review";
					}else if(room_type!=null){//문의유형 선택O
						sql="select count(*) from review where room_type='"+room_type+"'";
					}
				}else {//검색분야(제목,제목+본문
					if(search.equals("review_subject_review_content")) {//제목+본문 선택한경우
						if(room_type==null || room_type=="") {//문의유형 선택X
						sql="select count(*) from review where review_subject like '%"+
								searchtext+"%' or review_content like '%"+searchtext+"%' ";
						}else if(room_type!=null){//문의유형 선택O
						sql="select count(*) from review where room_type='"+room_type+"' and (review_subject like '%"+
								searchtext+"%' or review_content like '%"+searchtext+"%')";
						}
					}else {//제목-> 매개변수를 이용해서 하나의 sql통합
						if(room_type==null || room_type=="") {//문의유형 선택X
						sql="select count(*) from review where review_subject like '%"+
								searchtext+"%' ";
						}else if(room_type!=null){//문의유형 선택O
						sql="select count(*) from review where room_type='"+room_type+"' and review_subject like '%"+
								searchtext+"%' ";
						}
					}
				}
				System.out.println("getArticleSearchCount 검색 sql=>"+sql);
				//-------------------------------------
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getInt(1);//여기서는 필드명X
				}
			}catch(Exception e) {
				System.out.println("getArticleSearchCount() 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
			
		//5.글목록보기에 대한 메서드구현
		public List<ReviewDTO> getArticles(int start,int end){
			List<ReviewDTO> articleList=null;
			try {
				con=pool.getConnection();
				sql = "SELECT * FROM (SELECT A.*, Rownum Rnum from (select * from review order by review_ref desc,review_re_step asc)A) where Rnum >=? and Rnum <=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);//불러와서 담을 갯수
				
				rs=pstmt.executeQuery();
				if(rs.next()) {//보여주는 결과가 있다면
					articleList=new ArrayList(end);//end갯수만큼 데이터담을공간생성
					do {
						ReviewDTO article=makeArticleFromResult();	
						articleList.add(article);
					}while(rs.next());
				}
			}catch(Exception e) {
				System.out.println("getArticles 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return articleList;
		}
		
		//(2) 검색어에 따른 레코드의 범위지정에 대한 메서드
		public List getBoardArticles
		(int start,int end,String search,String searchtext,String room_type){
						List articleList=null;
						try {
						con=pool.getConnection();
						if(search==null || search=="") {//문의유형 선택X
						if(room_type==null || room_type=="") {
						sql="select * from (select A.* ,Rownum Rnum from (select * from review order by review_ref desc , review_re_step asc)A) where Rnum >= ? and Rnum <= ?";
						}else if(room_type!=null){//문의유형 선택O
						sql="select * from (select A.* ,Rownum Rnum from (select * from review where room_type like '"+room_type+"' order by review_ref desc , review_re_step asc)A) where Rnum >= ? and Rnum <= ?";
						}
						}else {//제목+본문
						if(search.equals("review_subject_review_content")) {//제목+본문 
						if(room_type==null || room_type=="") {//문의유형 선택X
						sql = "select * from(select A.*, Rownum Rnum from (select * from review where review_subject like '%"  + searchtext  + "%' or review_content like '%" + searchtext + "%'"
								+ "order by review_ref desc,review_re_step asc)A) where Rnum >= ? and Rnum <= ?";
						}else if(room_type!=null){//문의유형 선택O
						sql = "select * from(select A.*, Rownum Rnum from (select * from review where room_type like '"+room_type+"' and review_subject like '%"  + searchtext  + "%' or review_content like '%" + searchtext + "%'"
								+ "order by review_ref desc,review_re_step asc)A) where Rnum >= ? and Rnum <= ?";	
						}
						} else {//제목
						if (room_type==null || room_type=="") {//문의유형 선택X
							sql = "select * from (select A.*, Rownum Rnum from (select * from review where "
									+ search + " like '%" + searchtext
									+ "%' order by review_ref desc,review_re_step asc)A)"
									+ "where Rnum >= ? and Rnum <= ? ";
						} else if (room_type != null) {//문의유형 선택O
							sql = "select * from (select A.*, Rownum Rnum from (select * from review where room_type like '"+room_type+"' and review_subject like '%" + searchtext
									+ "%' order by review_ref desc,review_re_step asc)A)"
									+ "where Rnum >= ? and Rnum <= ? ";
						}
						}
						}
						System.out.println("getBoardArticles()의 sql=>"+sql);
						//----------------------------------------------------------------
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, start);
						pstmt.setInt(2, end);
						rs=pstmt.executeQuery();
						if(rs.next()) {//보여주는 결과가 있다면
						articleList=new ArrayList(end);
						do {
						ReviewDTO article=new ReviewDTO();
						article.setReview_num(rs.getInt("review_num"));
						article.setMem_id(rs.getString("mem_id"));
						article.setReview_subject(rs.getString("review_subject"));
						article.setReview_content(rs.getString("review_content"));
						article.setRoom_type(rs.getString("room_type"));
						article.setReview_ref(rs.getInt("review_ref"));
						article.setReview_re_step(rs.getInt("review_re_step"));
						article.setReview_re_level(rs.getInt("review_re_level"));
						article.setReview_date(rs.getTimestamp("review_date"));
						//추가
						articleList.add(article);
						//System.out.println(article); 얻어와서 담기완료
						}while(rs.next());
						}
						}catch(Exception e) {
						System.out.println("getBoardArticles 에러유발=>"+e);
						}finally {
						pool.freeConnection(con, pstmt, rs);
						}
						return articleList;
						}

		
		//(3)페이징 처리 계산 정리해주는 메서드(ListAction)
		public Hashtable pageList(String pageNum,int count) {
			//1. 페이징 처리결과를 저장할 Hashtable객체를 선언 
			
					Hashtable<String,Integer>pgList=new Hashtable<String,Integer>();
			
					int pageSize=10;
					int blockSize=10;
					
					//게시판을 맨 처음 실행시키면 무조건 1페이지부터 출력->가장 최근의 글부터
					if(pageNum==null){
						pageNum="1";//default(무조건 처음에는 1페이지부터 보여줘야하기때문)
					}
					int currentPage=Integer.parseInt(pageNum);
	             
					int startRow=(currentPage-1)*pageSize+1;
					int endRow=currentPage*pageSize;
					
					System.out.println("startRow : " + startRow);
					System.out.println("endRow : " + endRow);
					
					int number=0;//페이지별로 시작하는 맨처음에 나오는게시물번호
					System.out.println("현재 레코드수(count)=>"+count);
					
					List<ReviewDTO> articleList=null;//화면에 출력할 레코드를 저장할변수
					
					ReviewDAO dbPro=new ReviewDAO();
					count=dbPro.getArticleCount();//select count(*) from community;
					System.out.println("현재 레코드수(count)=>"+count);
					if(count>0){					//첫번째레코드번호,불러올갯수
						articleList=dbPro.getArticles(startRow, pageSize);
						System.out.println("ListAction의 articleList=>"+articleList);//null
					}
					number=count-(currentPage-1)*pageSize;
					System.out.println("페이지별로 number=>"+number);
					
					//총페이지수,시작,종료페이지 계산->list.jsp에서 이미 코딩
					//모델1에서의 list.jsp에서 복사해온다.
					//1.총페이지수 구하기
					//						122/10=12.2+122%10=>1 12.2+1.0=13.2=13
					int pageCount=count/pageSize+(count%pageSize==0?0:1);	
					//																		=>count%pageSize가 0이 떨어지면 0 아니면 1
					//2.시작페이지
					int startPage=0;
					if(currentPage%blockSize!=0){//1~9,11~19,21~29(10의배수X경우)
						startPage=currentPage/blockSize*blockSize+1;//경계선때문
					}else{//10%10=0(10,20,30,40,,)
										//((10/10)-1)*10+1=1 ,2->11
						startPage=((currentPage/blockSize)-1)*blockSize+1;
					}
					//3.종료페이지
					int endPage=startPage+blockSize-1;//1+10-1=10,2+10-1=11
					System.out.println
					      ("startPage=>"+startPage+",endPage=>"+endPage);
					//4.블럭별로 구분해서 링크 걸어서 출력()
					if(endPage > pageCount) endPage=pageCount;//마지막=총페이지수
					//페이징 처리에 대한 계산결과=>Hashtable,HashMap
					//ListAction에 전달->메모리에 저장,공유->list.jsp로 전달
					pgList.put("pageSize", pageSize);//<->pgList.get(키명)
					pgList.put("blockSize", blockSize);
					pgList.put("currentPage", currentPage);
					pgList.put("startRow", startRow);
					pgList.put("endRow", endRow);
					pgList.put("count", count);
					pgList.put("number", number);
					pgList.put("startPage", startPage);
					pgList.put("endPage", endPage);
					pgList.put("pageCount", pageCount);
					
					return pgList;//ListAction에게 리턴해준다.
		}
		
		
		//게시판에 글쓰기 및 답변달기
		//insert into board values(?,?,,,)
		public void insertArticle(ReviewDTO article) {
			//1.article->신규글인지 답변글인지(기존 게시물번호)인지 확인
			int review_num=article.getReview_num();//0->신규글<->0이 아닌경우(양수) 답변글
			int review_ref=article.getReview_ref();
			int review_re_step=article.getReview_re_step();
			int review_re_level=article.getReview_re_level();
			int number=0;//데이터를 저장하기위한 게시물번호(=New)
			try {
				con=pool.getConnection();
				sql="select max(review_num) from review"; // 글번호 
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {//데이터가 있다면
					number=rs.getInt(1)+1;//최대값+1
				}else {
					number=1;//테이블에 한개의 데이터가 없다면 최초 1부여
				}
				//답변글이라면
				if(review_num!=0) {
					//같은 그룹번호를 가지고 있으면서 나보다 step값이 큰 게시물을 찾아서 step하나 증가
					sql="update review set review_re_step=review_re_step+1 where review_ref=? and review_re_step>?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, review_ref);
					pstmt.setInt(2, review_re_step);
					int update=pstmt.executeUpdate();
					//1 성공(댓글만들어지는 위치)  0 실패
					System.out.println("답글수정유무(update)=>"+update);
					//답변글
					review_re_step=review_re_step+1;
					review_re_level=review_re_level+1;
				}else {//신규글이라면 c_num=0
					review_ref=number;
					review_re_step=0;//답변순서X
					review_re_level=0;//답변X
				}
			
				sql="insert into review (review_num,mem_id,review_date,review_subject,review_content,review_ref,review_re_step,review_re_level,room_type) values ((select NVL(max(review_num), 0)+1 from review),?,sysdate,?,?,?,?,?,?)";
				System.out.println("article.getReview_num=->" + article.getReview_num());
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, article.getMem_id());
				pstmt.setString(2, article.getReview_subject());
				pstmt.setString(3, article.getReview_content());
				pstmt.setInt(4, review_ref);//최대값+1
				pstmt.setInt(5, review_re_step);//0
				pstmt.setInt(6, review_re_level);//0
				pstmt.setString(7, article.getRoom_type());
				int insert=pstmt.executeUpdate();
				con.commit();
				System.out.println("insert : " + insert);
				System.out.println("게시판의 글쓰기성공유무(insert)=>"+insert);//1 or 0
				
			}catch(Exception e) {
				System.out.println("insertArticle()메서드 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}//insertArticle
		//글 상세보기->소스코드를 적게 사용하는 방법을 선택
		//select * from board where num=1;
		//update board set readcount=readcount+1 where num=1;//1번게시물 조회수증가
		//public MemberDTO getMember(String id){~}
		
		public ReviewDTO getArticle(int review_num) {
			ReviewDTO article=null;
			try {
				con=pool.getConnection();
				
				sql="select * from review where review_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, review_num);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {//레코드가 최소 만족1개이상 존재한다면
					article=makeArticleFromResult();
				}
			}catch(Exception e) {
				System.out.println("getArticle 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return article;//content.jsp에서 받아서 출력->NullPointerException
		}
		
		//접근지정자가 private가 되는 경우=>외부에서 호출X 내부 클래스사용O
		private ReviewDTO makeArticleFromResult()throws Exception {
			ReviewDTO article=new ReviewDTO();
			article.setReview_num(rs.getInt("review_num"));
			article.setMem_id(rs.getString("mem_id"));
			article.setReview_date(rs.getTimestamp("review_date"));
			article.setReview_subject(rs.getString("review_subject"));
			article.setReview_content(rs.getString("review_content"));
			article.setRoom_type(rs.getString("room_type"));
			article.setReview_ref(rs.getInt("review_ref"));
			article.setReview_re_step(rs.getInt("review_re_step"));
			article.setReview_re_level(rs.getInt("review_re_level"));
			return article;
		}
		//글수정
		//1)수정할 데이터를 찾을 메서드 필요
		public ReviewDTO updateGetArticle(int review_num) {
			ReviewDTO article=null;
			try {
				con=pool.getConnection();
				sql="select * from review where review_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, review_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {//레코드가 최소 만족1개이상 존재한다면
					article=makeArticleFromResult();
				}
			}catch(Exception e) {
				System.out.println("updateGetArticle() 에러유발=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return article;//updateForm.jsp에서 반환받기
		}
		
		//2)수정시켜주는 메서드 작성->본인확인->회원탈퇴(암호를 비교=>탈퇴)
		public int updateArticle(ReviewDTO article, String idKey) {
			int x = -1;// 게시물의 수정유무
			String mem_id;//id값을 담을 변수
			try {
				con = pool.getConnection();
				sql = "select mem_id from review where review_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, article.getReview_num());
				rs = pstmt.executeQuery();
						
				if (rs.next()) {// 데이터가 있다면
					mem_id = rs.getString("mem_id");
					if (idKey.equals(mem_id)) {
						sql = "update review set review_subject=?,";
						sql += "review_content=? where review_num=? ";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, article.getReview_subject());
						pstmt.setString(2, article.getReview_content());
						pstmt.setInt(3, article.getReview_num());
						int update = pstmt.executeUpdate();
						System.out.println("게시판의 글수정성공유무(update)=>" + update);
						x = 1;// 글수정성공
					} else {
						x = 0;// 수정실패;
					}
				}
			} catch (Exception e) {
				System.out.println("updateArticle()메서드 에러유발=>" + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
		
//2)삭제시켜주는 메서드 작성->본인확인->회원탈퇴(암호를 비교=>탈퇴)
public int deleteArticle(int review_num, String idKey) {
	int x = -1;// 게시물의 수정유무
					String mem_id;//id값을 담을 변수
					try {
						con = pool.getConnection();
						sql = "select mem_id from review where review_num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, review_num);
						rs = pstmt.executeQuery();
								
						if (rs.next()) {// 데이터가 있다면
							mem_id = rs.getString("mem_id");
							if (idKey.equals(mem_id)) {
								sql = "delete from review where review_num=?";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, review_num);
								int delete = pstmt.executeUpdate();
								con.commit();
								System.out.println("게시판의 글수정성공유무(delete)=>" + delete);
								x = 1;// 글삭제성공
							} else {
								x = 0;// 삭제실패;
							}
						}
					} catch (Exception e) {
						System.out.println("deleteArticle()메서드 에러유발=>" + e);
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return x;
				}
		
	//해당 글에 대한 회원 아이디를 구해주는 메서드
	public String ReveiwId (int review_num){	
		String mem_id=null;//지역변수
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="select * from review where review_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mem_id=rs.getString("mem_id");
			}
		}catch(Exception e) {
			System.out.println("QnaId 실행오류=>"+e);
		}finally {//3.메모리해제
			pool.freeConnection(con, pstmt, rs);
		}
		return mem_id;//.jsp에게 반환(전달해주는 역할)	
	}

}

