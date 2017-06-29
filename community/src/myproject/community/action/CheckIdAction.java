package myproject.community.action;

import java.awt.print.Printable;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myproject.community.dao.Udao;

public class CheckIdAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("checkIdAction.java 호출 성공");
			String in_id = request.getParameter("id");
			String insert_type = request.getParameter("insert_type");
			Udao dao = new Udao();

			//한글인코딩
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			//5자  ~ 20자
			if(in_id.length() > 4) {
				//히든값을 넘겨줘서 사용가능할때만 form을 submit처리 시키도록 함
				String re = dao.idDuplication(in_id);
				if(re.equals("사용가능")) {
				    
					out.print("<div style=\"color:green\"class=\"use\">");
					out.print("사용가능한 아이디입니다");
					out.print("<input type=\"hidden\" value=\"2\" id=\"use_id\" name=\"use_id\"/>");
					out.print("</div>");
				} else {
					out.print("<div style=\"color:red\" class=\"use\">");
					out.print("아이디가 존재합니다");
					out.print("<input type=\"hidden\" value=\"0\" id=\"use_id\" name=\"use_id\"/>");
					out.print("</div>");
				}
			} else {
				out.print("<div style=\"color:red\" class=\"use\">");
				out.print("아이디를 양식에 맞게 입력해 주세요");
				out.print("<input type=\"hidden\" value=\"1\" id=\"use_id\" name=\"use_id\"/>");
				out.print("</div>");	
			}
	}
}
