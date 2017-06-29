package myproject.community.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public FrontController() {
		super();
		System.out.println("01 FrontController 생성자 메서드");
    
    }
	public void init(){
		 System.out.println("02 init()메서드 !!!!!!! ");
	}
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("03_1 doGet()메서드");
		System.out.println("03_1 doGet()메서드 request  => "+ request);
	 	System.out.println("03_1 doGet()메서드 response  => "+ response);
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("03_2 doPost ()메서드");
		System.out.println("03_2 doPost ()메서드 request  => "+ request);
	 	System.out.println("03_2 doPost ()메서드 response  => "+ response);
		doProcess(request, response);
	}
	
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("04_1 doProcess ()메서드호출 BoardFrontController.java");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		 System.out.println(RequestURI + "<-- RequestURI BoardFrontController.java");
		 System.out.println(contextPath + "<-- contextPath BoardFrontController.java");
		 System.out.println(contextPath.length() + "<-- contextPath.length() BoardFrontController.java");
		 System.out.println(command + "<-- command BoardFrontController.java");
		 System.out.println("----------BoardFrontController.java----------------");
		 
		 ActionForward forward = null;
		 Action action = null;
		 
		 if(command.equals("/paging.jj")){
			System.out.println("05_1 command가 /paging.jj 일때");
			BoardListAction boardlist = new BoardListAction();
				try{
					boardlist.execute(request, response);
				} catch(Exception e) {
					e.printStackTrace();
				}
		 } else if(command.equals("/user/checkid.jj")) {
			 System.out.println("05_1 command가 /user/checkid.jj 일때");
			 CheckIdAction checkid = new CheckIdAction();
			 		try {
			 			checkid.execute(request, response);
					} catch(Exception e) {
						e.printStackTrace();
					}
		 } else if(command.equals("/postview.jj")) {
			 System.out.println("05_1 command가 /community/postview.jj 일때");
			 action = new GetPostAction();
			 	try {
			 		forward=action.execute(request, response);
				} catch(Exception e) {
					e.printStackTrace();
				}
		 } else if(command.equals("/getpagelist.jj")) {
			 System.out.println("05_1 command가 /getpagelist.jj 일때");
			 GetPageListAction getpagelist = new GetPageListAction();
				 try {
					 getpagelist.execute(request, response);
				 } catch(Exception e) {
						e.printStackTrace();
				 }
		 }
		 
		 
		//--- 포워드 할 것인가? 리다이렉트 할것인가?
			if(forward != null){
				if(forward.isRedirect()){
					//리다이렉트
					
					response.sendRedirect(forward.getPath());
				}else{
					//포워드
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					System.out.println(forward.getPath() + "<--- forward.getPath()[jsp 이동경로]  BoardFrontController.java");
					System.out.println();
					dispatcher.forward(request, response);
				}
			}
	}
}
