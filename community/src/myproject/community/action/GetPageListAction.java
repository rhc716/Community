package myproject.community.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class GetPageListAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 페이지 리스트를 생성해주는 엑션
		System.out.println("GetPageListAction.java 호출 성공");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		int page_num = Integer.parseInt(request.getParameter("page_num"));
		
		System.out.println(boardno+"<---BoardListAction.java 에서 받은 보드넘버");
		System.out.println(page_num+"<---BoardListAction.java 에서 받은 페이지넘버");
		
		//페이징 리스트를 10개 만들어서 json 방식으로 뿌려줌,
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		
		ArrayList<Integer> pagelist = new ArrayList<Integer>();
		int endpage = (int)(Math.ceil(page_num / 10.0) * 10);
		int startpage = endpage-9;
		for(int i = startpage; i<startpage+10; i++){
			pagelist.add(i);
		}
		
		out.println(gson.toJson(pagelist));
	}
}
