package myproject.community.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import myproject.community.dao.Pdao;
import myproject.community.dto.Post;

public class GetPostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("GetPostAction.java 호출 성공");
		// 페이징 유지에 필요한 모든 변수와 게시글을 불러올 postno를 받아줌 
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		int pageno = Integer.parseInt(request.getParameter("page_num"));
		int	postno = Integer.parseInt(request.getParameter("postno"));
		
		Pdao dao = new Pdao();
		Post post = dao.getPost(postno);
		
		HttpSession session = request.getSession();
		session.setAttribute("post", post);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(true);
 		forward.setPath("./gallery/gallery_postview.jsp?boardno="+boardno+"&page_num="+pageno+"&postno="+postno);
		
		return forward;
	}

}
