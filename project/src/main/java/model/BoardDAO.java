package model;
//DBConnectionMgr(DB접속,관리),BoardDTO(매개변수,반환형,데이터를 담는 역할)

import java.sql.*;//DB사용
import java.text.SimpleDateFormat;
import java.util.*;//ArrayList,List을 사용


public class BoardDAO { //MemberDAO

	private DBConnectionMgr pool=null;//1.연결객체선언
	//공통
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;//select
	private String sql="";//실행시킬 SQL구문 저장
	
	//2.생성자를 통해서 연결=>의존관계
	public BoardDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {
			System.out.println("DB접속 오류=>"+e);
		}
	}//생성자
	
	//1.페이징 처리를 위한 전체레코드수를 구해와야 한다.
	//select count(*) from board;    select count(*) from member
	public int getArticleCount() { //getMemberCount() ->MemberDAO에서 작성
		int x=0;//총레코드갯수를 저장
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select count(*) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				x=rs.getInt(1);//변수명=rs.get자료형(필드명 또는 인덱스번호)=>필드명X(그룹함수)
			}
		}catch(Exception e) {
			System.out.println("getArticleCount() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	
	//검색어에 해당되는 총레코드수를 구하는 메서드를 하나 만들기(검색분야,검색어)//------사이에서 코딩변화가 나타남
	public int getArticleSearchCount(String search, String searchtext) { //getMemberSearchCount() ->MemberDAO에서 작성
		int x=0;//총레코드갯수를 저장
		try {
			con=pool.getConnection();
			if(search==null || searchtext=="") {//검색분야를 선택하지않은것
				sql="select count(*) from notice";//무조건 다나오는거
			}else {
				if(search.equals("notice_subject_notice_content")) {//제목+본문
					sql="select count(*) from notice where notice_subject like '%"+
			                searchtext+"%' or notice_content like '%"+
			                searchtext+"%'";
				}else {
					sql="select count(*) from notice where "+search+" like '%"+
				            searchtext+"%'";
				}
			}
			System.out.println("검색sql "+sql);
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				x=rs.getInt(1);//변수명=rs.get자료형(필드명 또는 인덱스번호)=>필드명X(그룹함수)
			System.out.println("검색된 총 레코드 수=>"+x);
			}
		}catch(Exception e) {
			System.out.println("getArticleSearchCount() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//2.글목록보기에 대한 메서드구현->레코드 한개이상->한 페이지당 10개씩 끊어서 보여준다.
	//1)레코드의 시작번호  2) 불러올 레코드의 갯수
	public List getArticles(int start,int end) {//getMemberList(int start,int end){
		
		List articleList=null;//ArrayList articleList=null;//(O)
		
		try {
			con=pool.getConnection();
			/*
			 * 그룹번호가 가장 최신의 글을 중심으로 정렬하되,만약에 level이 같은 경우에는
			 * step값으로 오름차순을 통해서  몇번째 레코드번호를 기준해서 몇개까지 정렬할것인가를
			 * 지정해주는 SQL구문
			 */
			sql="select * from (select A.* ,Rownum Rnum from (select * from notice order by notice_num desc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);//mysql은 레코드순번이 내부적으로 0부터 시작
			pstmt.setInt(2, end);//불러와서 담을 갯수
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				articleList=new ArrayList(end);//10=>end갯수만큼 데이터를 담을 공간을 만들어라
				do {
				  BoardDTO article=new BoardDTO();//MemberDTO=>필드별로 담을것.
				  article.setNotice_num(rs.getInt("notice_num"));
				  article.setAdmin_id(rs.getString("admin_id"));
				  article.setNotice_time(rs.getTimestamp("notice_time"));//오늘날짜->코딩
				  
				  article.setNotice_subject(rs.getString("notice_subject"));
				  article.setNotice_content(rs.getString("notice_content"));//글내용
				
				  //추가
				  articleList.add(article);//생략하면 데이터가 저장X->for문 에러유발
				}while(rs.next());
			}
		}catch(Exception e) {
			System.out.println("getArticleCount() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList;
	}
	//2)검색어에 따른 레코드의 범위지정에 대한 메소드
	
		public List getBoardArticles(int start,int end, String search, String searchtext) {//getMemberList(int start,int end){
		
		List articleList=null;//ArrayList<BoardDTO> articleList=null;//(O)
		try {
			con=pool.getConnection();
			//-------------------
			if(search==null || search=="") {//검색분야를 가지고 코딩
			sql="select b.* from ( select r.*, rownum as rnum from (select * from notice order by notice_num desc) r ) b where rnum >= ? and rnum <= ? order by notice_num asc";
			}else {//제목+본문
				if(search.equals("subject_content")) {//제목+본문
					sql="select b.* from ( select r.*, rownum as rnum from ( select * from notice where notice_subject like '%"+searchtext+"%' or notice_content like '%"+searchtext+"%' order by notice_num desc) r ) b where rnum >= ? and rnum <= ? order by notice_num asc";
				}else {//제목,작성자=>필드명으로 쓰면 매개변수를 이용해서 sql구문을 통합할수있음
					//search부문에 제목, 작성자를 다 넣을 수있기때문에 공통부모인 search를 넣고 한문장으로 통합하면 코드 줄일수있음
					sql = "select b.* from ( select r.*, rownum as rnum from ( select * from notice where "+search+" like '%"+searchtext+"%') r ) b where rnum >= ? and rnum <= ? order by notice_num asc";
				}
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				articleList=new ArrayList();//10=>end갯수만큼 데이터를 담을 공간을 만들어라
				do {
				  BoardDTO article=new BoardDTO();//MemberDTO=>필드별로 담을것.
				  article.setNotice_num(rs.getInt("notice_num"));
				  article.setAdmin_id(rs.getString("admin_id"));
				article.setNotice_time(rs.getTimestamp("notice_time"));
				  article.setNotice_subject(rs.getString("notice_subject"));
				  article.setNotice_content(rs.getString("notice_content"));//글내용
				
				  //추가
				  articleList.add(article);//생략하면 데이터가 저장X->for문 에러유발
				}while(rs.next());
			}
		}catch(Exception e) {
			System.out.println("getBoardArticles() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList;
	}
	
		
		//3)페이징 처리 계산을 정리해주는 메서드 (ListAction에서 소스 가져옴)
		//Hashtable을 사용한 이유는 페이징처리에 관련된 처리결과를 저장할 변수들을 하나의 객체에 담아서 반환
		//ArrayList를 사용하지않고 Hashtable을 사용한 이유는 (key,value)사용하려고=>${key명} 이것땜에
		public Hashtable pageList(String pageNum,int count) {
			
			//0.페이징 처리결과를 저장할 Hashtable객체 선언
			Hashtable<String,Integer> pgList=new Hashtable<String,Integer>();
			// 1.ListAction에서 소스코드를 복사=>편집
			
		    int pageSize=5;//numPerPage->페이지당 보여주는 게시물수(=레코드수) 10
		    int blockSize=3;//pagePerBlock->블럭당 보여주는 페이지수 10
		   
		// String pageNum=request.getParameter("pageNum");
		 //=>매개변수를 받아왔기때문에 따로 선언할필요는 없음
		    
		  //게시판을 맨 처음 실행시키면 무조건 1페이지 부터  출력->가장 최근의 글이 나오기때문에 
		 if(pageNum==null){
			 pageNum="1";//default(무조건 1페이지는 선택하지 않아도 보여줘야 되기때문에)
		 }
		 int currentPage=Integer.parseInt(pageNum);//"1"->1 (=nowPage(현재페이지))
		 //                    (1-1)*10+1=1,(2-1)*10+1=11,(3-1)*10+1=21
		 int startRow=(currentPage-1)*pageSize+1;//시작 레코드 번호
		 int endRow=currentPage*pageSize;//1*10=10,2*10=20,3*10=30(마지막 레코드번호)
		 
		 //int count=0;//총레코드수 이것도 선언할필요없음 매개변수로 받아왔음
		 
		 int number=0;//beginPerPage->페이지별로  시작하는 맨 처음에 나오는 게시물번호
		 
		 System.out.println("현재 레코드수(count)=>"+count);
		
		  number=count-(currentPage-1)*pageSize;
		  System.out.println("페이지별 number=>"+number);
		  //-----------------모델1의 list.jsp에서 소스코드를 복사=>편집----------------
		  
		  //1.총페이지수 구하기
		   //                    122/10=12.2+1.0=13.2=13,(122%10)=1
		   int pageCount=count/pageSize+(count%pageSize==0?0:1);
		   //2.시작페이지
		   int startPage=0;
		   if(currentPage%blockSize!=0){//1~9,11~19,21~29
		      startPage=currentPage/blockSize*blockSize+1;
		   }else{//10%10=0,(10,20,30,40~)
				             //((10/10)-1)*10+1=1, 20=>11
			  startPage=((currentPage/blockSize)-1)*blockSize+1; 
		   }
		   //종료페이지
		   int endPage=startPage+blockSize-1;//1+10-1=10,11+10-1=20
		   System.out.println
		    ("startPage=>"+startPage+",endPage="+endPage);
		   //블럭별로 구분해서 링크걸어서 출력
		   //     11     >          10      //마지막페이지=총페이지수
		   if(endPage > pageCount)  endPage=pageCount;
		  //페이징처리에 대한 계산결과=>Hashtable에 저장해서 ListAction에 전달
		   //->메모리에 저장->공유->list.jsp에서 불러다 사용
		   //하나의 객체에 담아서 ListAction가서 한꺼번에 출력하려고
		   pgList.put("pageSize", pageSize);//pgList.get(키명) 페이지당레코드수
		   pgList.put("blockSize", blockSize);//블럭당 보여주는 페이지수
		   pgList.put("currentPage", currentPage);//현재페이지
		   pgList.put("startRow", startRow);//첫번째 레코드번호
		   pgList.put("endRow", endRow);// 마지막 레코드번호
		   pgList.put("count", count);// 총레코드
		   pgList.put("number", number);
		   pgList.put("startPage", startPage);
		   pgList.put("endPage", endPage);
		   pgList.put("pageCount", pageCount);
		   
		   return pgList;
		  
		  
		}

	//----게시판의 글쓰기 및 답변글쓰기-----
	//insert into board values(?,?,,,,
	public void insertArticle(BoardDTO article) {//~(MemberDTO mem)
		//1.article->신규글 인지 답변글인지 확인
		//int num=article.getNotice_num();//0 신규글 0이아닌경우 (답변글)
		int number=0;//데이터를 저장하기위한 게시물번호 
		//System.out.println("insertArticle메서드의 내부 num=>"+num);//0 신규글
		try {
			con=pool.getConnection();
			sql="select max(notice_num) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				number=rs.getInt(1)+1;//최대값+1
			}else {
				number=1;//테이블에 한개의 데이터가 없다면
			}
			
			//12개->num,reg_date,readcount(생략)->default
			//작성날짜=>sysdate, now() (mysql)
//			sql="insert into notice(notice_num,admin_id,notice_time,notice_subject,notice_content)";
//			sql+="values(?,?,sysdate,?,?)";
		    sql="insert into notice values(?,?,sysdate,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,number);//웹에서는 이미 데이터저장된 상태(Setter~)
			pstmt.setString(2, article.getAdmin_id());
			//pstmt.setTimestamp(3, article.getNotice_time());
			pstmt.setString(3, article.getNotice_subject());
			pstmt.setString(4, article.getNotice_content());//5번째에 ? 대신에 now()
			
			int insert=pstmt.executeUpdate();
			con.commit();
			System.out.println("게시판의 글쓰기 성공유무(insert)=>"+insert);//1
		}catch(Exception e) {
			System.out.println("insertArticle() 메서드 에러유발=>"+e);
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
	}
	//글상세보기
	//content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>
	//형식)select * from board where num=3
	//형식2)update board set readcount=readcount+1 where num=3
	//public MemberDTO getMember(String id){~}
	public BoardDTO getArticle(int notice_num) {
		BoardDTO article=null;//ArrayList articleList=null;//여러개 담을때
		
		try {
			con=pool.getConnection();
			
			sql="select * from notice where notice_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				 article=makeArticleFromResult();//생성된 객체를 얻어온다.
				/*
				  article=new BoardDTO();//MemberDTO=>필드별로 담을것.
				  article.setNum(rs.getInt("num"));
				  article.setWriter(rs.getString("writer"));
				  article.setEmail(rs.getString("email"));
				  article.setSubject(rs.getString("subject"));
				  article.setPasswd(rs.getString("passwd"));
				  article.setReg_date(rs.getTimestamp("reg_date"));//오늘날짜->코딩
				  article.setReadcount(rs.getInt("readcount"));//조회수 default->0
				  article.setRef(rs.getInt("ref"));//그룹번호->신규글과 답변글을 묶어주는 역할
				  article.setRe_step(rs.getInt("re_step"));//답변글이 나오는 순서
				  article.setRe_level(rs.getInt("re_level"));//들여쓰기(답변의 깊이)
				  article.setContent(rs.getString("content"));//글내용
				  article.setIp(rs.getString("ip"));//글쓴이의 ip주소->request.getRemoteAddr()
				  */
			}
		}catch(Exception e) {
			System.out.println("getArticle() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}
	
	//----중복된 레코드 한개를 담을 수 있는 메서드를 따로 만들어서 처리----
	//접근지정자가 private인 경우=->외부에서 호출목적X ,내부에서 호출목적으로 사용
	private BoardDTO makeArticleFromResult()throws Exception {
		  BoardDTO article=new BoardDTO();//MemberDTO=>필드별로 담을것.
		  article.setNotice_num(rs.getInt("notice_num"));
		  article.setAdmin_id(rs.getString("admin_id"));
		  article.setNotice_time(rs.getTimestamp("notice_time"));//오늘날짜->코딩
		  article.setNotice_subject(rs.getString("notice_subject"));
		  article.setNotice_content(rs.getString("notice_content"));//글내용
		
		  return article;
	}
	
	//------------------------------------------------------------------
	//글수정
	//1)수정할 데이터를 찾을 메서드 필요=>select * from board where num=?
	public BoardDTO  updateGetArticle(int notice_num) {
		
      BoardDTO article=null;//ArrayList articleList=null;//여러개 담을때	
		try {
			con=pool.getConnection();
			sql="select * from notice where notice_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {//보여주는 결과가 있다면
				 article=makeArticleFromResult();//생성된 객체를 얻어온다.
			}
		}catch(Exception e) {
			System.out.println("updateGetArticle() 에러유발=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}
	//2)수정시키는 메서드 작성=>본인인지 확인절차=>회원탈퇴(암호를 비교=->탈퇴)와 동일한 기능
	public int updateArticle(BoardDTO article) {// insertArticle(BoardDTO article)

		int update =0;// 게시물의 수정성공유무

		try {
			con = pool.getConnection();
			sql = "update notice set notice_subject=?, notice_content=? where notice_num=?";
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, article.getNotice_subject());// 웹에서는 이미 데이터저장된 상태(Setter~)
			pstmt.setString(2, article.getNotice_content());// 내용
			pstmt.setInt(3, article.getNotice_num());
			update = pstmt.executeUpdate();
			System.out.println("게시판의 글수정 성공유무(update)=>" + update);
			con.commit();
			
		} catch (Exception e) {
			System.out.println("updateArticle() 메서드 에러유발=>" + e);
		} finally {
			pool.freeConnection(con, pstmt,rs);
		}
		return update;
	}
	

	//글삭제=>암호를 비교->delete from board where num=?
	public int deleteArticle(int notice_num) { //회원탈퇴와 동일한 기능
		
		
		int x =0;// 게시물의 삭제성공유무
		
		System.out.println("deleteArticle에서의 num=>"+notice_num);

		try {
			con = pool.getConnection();
			sql = "delete notice where notice_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			int delete= pstmt.executeUpdate();
			System.out.println("게시판의 글삭제 성공유무(delete)=>" + delete);
			
			
		} catch (Exception e) {
			System.out.println("deleteArticle() 메서드 에러유발=>" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
}
