package myproject.community.action;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import myproject.community.dao.Pdao;
import myproject.community.dto.Post;

public class BoardListAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardListAction.java 호출 성공");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		int page_num = Integer.parseInt(request.getParameter("page_num"));
			
		System.out.println(boardno+"<---BoardListAction.java 에서 받은 보드넘버");
		System.out.println(page_num+"<---BoardListAction.java 에서 받은 페이지넘버");
		
		// json 방식으로 게시글 목록을 뿌려주기 위한 api.
		Gson gson = new Gson();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Pdao dao = new Pdao();
		// 한 페이지당 40개의 게시글 리스트를 받아와서 json 방식으로 뿌려줌
		try {
			ArrayList<Post> postlist = dao.selectpagePostList(boardno, page_num);
			out.println(gson.toJson(postlist));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
