package myproject.community.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myproject.community.dao.Pdao;

public class PostHitAction {


	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PostHitAction.java 호출 성공");
		int postno = Integer.parseInt(request.getParameter("postno"));
		
		Pdao dao = new Pdao();
		dao.postHit(postno);	
	}
}
