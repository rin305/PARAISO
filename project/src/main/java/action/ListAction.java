package action;

//List
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

//요청명령어에 해당되는 명령어 처리클래스=액션클래스=컨트롤러클래스
public class ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1./list.do에서 search,searchtext도 매개변수로 처리
		String pageNum=request.getParameter("pageNum");
		//추가코딩
		String search=request.getParameter("search");
	String searchtext=request.getParameter("searchtext");
		//매개변수 받아왔으면 잘 넘어왔는지 sysout으로 확인해야함
		System.out.println("ListAction의 매개변수 확인");
		System.out.println("pageNum=>"+pageNum+",search=>"+search+",searchtext=>"+searchtext);
		
		int count=0;//총레코드수
		List articleList=null;//화면에 출력할 레코드 저장
		
		//검색어,검색분야에 나오는 레코드 저장
		BoardDAO dbPro=new BoardDAO();
		count=dbPro.getArticleSearchCount(search, searchtext);//총레코드수 구할수있음
		System.out.println("ListAction의 현재레코드수(count)->"+count);
		
		
		//1.화면에 출력할 페이지번호, 2.출력할 레코드 갯수
		Hashtable<String, Integer>pgList=dbPro.pageList(pageNum, count);
		if(count >0) {//출력할 레코드가 있으면 보여줘리
			System.out.println(pgList.get("startRow")+","+pgList.get("endRow"));
			articleList=dbPro.getBoardArticles(pgList.get("startRow"),//첫번째 레코드번호
					pgList.get("pageSize"),//불러올레코드갯수
					search,searchtext);//검색분야, 검색어
			System.out.println("ListAction2의 articleList=>"+articleList);
		}else {//count=0
			articleList=Collections.EMPTY_LIST;//비어있는 List객체반환
			
			
		}

	   //2.처리한 결과를 공유(서버메모리에 저장)->이동할 페이지에 공유해서 사용(request)
		request.setAttribute("search", search);//${currentPage}
		request.setAttribute("searchtext", searchtext);
		request.setAttribute("pgList", pgList);//페이징처리 10개 들어있음
		request.setAttribute("articleList", articleList);//${articleList}
		
		//3.공유해서 이동할 수있도록 페이지를 지정
		return "/list.jsp";//컨트롤러가 이동시키면서 공유시켜준다.
		
	}

}




