package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;

public class ReviewListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//1./list.jsp에서 매개변수가 전달받음 
				String pageNum = request.getParameter("pageNum");
				//추가
				String search=request.getParameter("search"); //검색분야
				String searchtext=request.getParameter("searchtext");
				String room_type=request.getParameter("room_type");
				
				System.out.println("ListPost의 매개변수 확인");
				System.out.println("pageNum=>" + pageNum + ", search=>" + search 
						+ ", searchtext=>" + searchtext+", room_type=>"+room_type);
				
				//---
				int count=0;//총레코드수
				List articleList=null; //화면에 출력할 레코드를 저장할 변수
				
				ReviewDAO dbPro=new ReviewDAO();
				count=dbPro.getArticleSearchCount(search, searchtext,room_type);
				System.out.println("ListAction에서의 현재레코드수=>" + count);
				
				//1. 화면에 출력할 페이지번호, 2.출력할 레코드갯수
				Hashtable<String,Integer> pgList = dbPro.pageList(pageNum, count);
				if(count > 0) {
					System.out.println(pgList.get("startRow")+"," + pgList.get("endRow"));
					
					articleList =dbPro.getBoardArticles(pgList.get("startRow"), //첫번째 레코드번호
																			pgList.get("endRow"), //불러올 갯수
																		search, //검색유형
																		searchtext,//검색어
																		room_type); //문의 유형
					/*articleList=dbPro.getArticles(pgList.get("startRow"), pgList.get("pageSize"));*/
					System.out.println("ListPost의 articleList=>" + articleList);
				} else { //count=0
					articleList = Collections.EMPTY_LIST; //비어있는 List객체반환
				}
			  //2.처리한 결과를 공유(서버메모리에 저장)=>이동할페이지에 공유(request)
			  request.setAttribute("search", search);
			  request.setAttribute("searchtext", searchtext);
			  request.setAttribute("room_type", room_type);
			  request.setAttribute("pgList", pgList); 
			  request.setAttribute("articleList", articleList); //출력할 레코드값들 ${articleList}
			  
			  //3.공유해서 이동할 수 있도록 페이지를 지정
				return "/ReviewList2.jsp"; //컨트롤러가 이동시키면서 공유시켜준다. ->view
	}

}
