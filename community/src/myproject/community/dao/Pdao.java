package myproject.community.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import myproject.community.driverdb.DriverDB;
import myproject.community.dto.Post;

public class Pdao {
	
	//게시글 조회수 올리는 메서드
	
	public void postHit(int postno) throws ClassNotFoundException, SQLException{
		System.out.println("postHit 메서드 호출 성공");
		Connection conn = null;
		PreparedStatement pstmt = null;
		DriverDB db = new DriverDB();
		conn = db.driverdbcon();
		
		pstmt = conn.prepareStatement("update community_post set post_hits = post_hits+1 where post_no = ?;");
		pstmt.setInt(1, postno);
		pstmt.executeUpdate();
		

		pstmt.close();
		conn.close();
	}
	
	
	
	
	//게시글을 불러오는 메서드
	public Post getPost(int postno) throws ClassNotFoundException, SQLException{
		System.out.println("getPost 메서드 호출 성공");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DriverDB db = new DriverDB();
		conn = db.driverdbcon();

		Post p = null;
		
		pstmt = conn.prepareStatement("select * from community_post where post_no = ?;");
		pstmt.setInt(1, postno);
		rs = pstmt.executeQuery();
		while(rs.next()){
			p = new Post();
			
			p.setPost_no(rs.getInt("post_no"));
			p.setPostboard_no(rs.getString("board_no"));
			p.setPost_user_id(rs.getString("user_id"));
			p.setPost_nickname(rs.getString("post_nickname"));
			p.setPost_no(rs.getInt("post_no"));
			p.setPost_name(rs.getString("post_name"));
			p.setPost_content(rs.getString("post_content"));
			p.setPostreple_count(rs.getInt("reple_count"));
			p.setPost_hits(rs.getInt("post_hits"));
			p.setPostrecom_count(rs.getInt("recom_count"));
			p.setPost_date(rs.getString("post_date"));
			p.setPost_password(rs.getString("post_password"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return p;
	}
	
	//게시글 등록 메서드
	public void insertPost(Post p) throws SQLException, ClassNotFoundException{
		System.out.println("insertPost 메서드 호출 성공");
		Connection conn = null;
		PreparedStatement pstmt = null;
		DriverDB db = new DriverDB();
		conn = db.driverdbcon();
				
		pstmt = conn.prepareStatement("insert into community_post"
				+ "(board_no, user_id, post_nickname, post_password, post_name, post_date , post_content)"
				+ " values(?,?,?,?,?,now(),?)");
		pstmt.setString(1, p.getPostboard_no());
		pstmt.setString(2, p.getPost_user_id());
		pstmt.setString(3, p.getPost_nickname());
		pstmt.setString(4, p.getPost_password());
		pstmt.setString(5, p.getPost_name());
		pstmt.setString(6, p.getPost_content());
		//System.out.println(pstmt+"<--pstmt");
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	//게시글 갤러리 보드 리스트에 뿌려주려 한페이지분량의 게시글을 불러오는 메서드
	public ArrayList<Post> selectpagePostList(int boardno, int page_num) throws ClassNotFoundException, SQLException{
		System.out.println("selectpagePostList 메서드 호출 성공");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DriverDB db = new DriverDB();
		ArrayList<Post> list = new ArrayList<Post>();
		conn = db.driverdbcon();
		// 1페이지당 40개의 글, 1페이지면 limit 0,39, 2페이지면 40,79
		int firstnum = page_num*40 - 40;
		int secondnum = page_num*40 - 1;
		// DATE_FORMAT(post_date, '%Y-%m-%d') post_date 부분은 년월일만 가져오는것
		pstmt = conn.prepareStatement("SELECT post_no, post_name, post_nickname, DATE_FORMAT(post_date, '%Y-%m-%d')"
				+ " post_date, post_hits, recom_count from community_post where board_no = ?"
				+ " order by post_no desc limit ?,?;");
		pstmt.setInt(1, boardno);
		pstmt.setInt(2, firstnum);
		pstmt.setInt(3, secondnum);
		
		//System.out.println(pstmt+"<--pstmt");
		rs = pstmt.executeQuery();
		while(rs.next()){
			Post p = new Post();
			p.setPost_no(rs.getInt("post_no"));
			p.setPost_name(rs.getString("post_name"));
			p.setPost_nickname(rs.getString("post_nickname"));
			p.setPost_date(rs.getString("post_date"));
			p.setPost_hits(rs.getInt("post_hits"));
			p.setPostrecom_count(rs.getInt("recom_count"));
			list.add(p);
		}
		pstmt.close();
		conn.close();
		return list;
	}
}
