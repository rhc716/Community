package myproject.community.dao;
import myproject.community.driverdb.DriverDB;
import myproject.community.dto.User;
import java.sql.*;

import com.sun.xml.internal.ws.api.pipe.NextAction;
public class Udao {
	
	//닉네임 중복체크 메서드
	public String nickDuplication(String in_nick) throws SQLException, ClassNotFoundException{
	Connection conn = null;
	PreparedStatement pstmt = null;
	DriverDB db = new DriverDB();
	ResultSet rs = null;
	String re = null;
	conn = db.driverdbcon();
	
	pstmt = conn.prepareStatement("select * from community_user where user_nickname = ?");
	pstmt.setString(1, in_nick);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		re = "중복";		
	}else{
		re = "사용가능";
	}
	rs.close();
	pstmt.close();
	conn.close();
	return re;
}
	
	//아이디 중복체크 메서드
	public String idDuplication(String in_id) throws SQLException, ClassNotFoundException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		DriverDB db = new DriverDB();
		ResultSet rs = null;
		String re = null;
		conn = db.driverdbcon();
		
		pstmt = conn.prepareStatement("select * from community_user where user_id = ?");
		pstmt.setString(1, in_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			re = "중복";		
		}else{
			re = "사용가능";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	//insert 처리 메서드
	public void uInsert(User u) throws ClassNotFoundException, SQLException{
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		DriverDB db = new DriverDB();
		conn = db.driverdbcon();
		
		pstmt = conn.prepareStatement("insert into community_user values(?,?,?,?,?,?,?,?)");
		pstmt.setString(1, u.getUser_id());
		pstmt.setString(2, u.getUser_pw());
		pstmt.setString(3, u.getUser_level());
		pstmt.setString(4, u.getUser_nickname());
		pstmt.setString(5, u.getUser_email());
		pstmt.setString(6, u.getUser_levelup());
		pstmt.setString(7, u.getUser_phone());
		pstmt.setString(8, "N");
		//System.out.println(pstmt+"<--pstmt");
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	//로그인 성공하면 한명의 정보 가져오는 메서드
	public User uGetForSession(String id) throws SQLException, ClassNotFoundException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		DriverDB db = new DriverDB();
		ResultSet rs = null;
		conn = db.driverdbcon();
		
		pstmt = conn.prepareStatement("select user_level, user_nickname, user_levelup from community_user where user_id = ?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		User u = new User();
		while(rs.next()){
			u.setUser_level(rs.getString("user_level"));
			u.setUser_nickname(rs.getString("user_nickname"));
			u.setUser_levelup(rs.getString("user_levelup"));
		}
		return u;
	}
	//로그인 체크 메서드
	public String uLoginCheck(String in_id, String in_pw) throws ClassNotFoundException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		DriverDB db = new DriverDB();
		ResultSet rs = null;
		String re = null;
		conn = db.driverdbcon();
		
		pstmt = conn.prepareStatement("select user_pw from community_user where user_id = ?");
		pstmt.setString(1, in_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(in_pw.equals(rs.getString("user_pw"))){
			re = "성공";
			}else{
			re = "비번불";	
			}
		}else{
			re = "아이디불";
		}
		
		return re;
	}
}
