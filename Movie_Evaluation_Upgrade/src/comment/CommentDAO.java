package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
	
	private Connection cn;
	private ResultSet rs;

	public CommentDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/evaluation";
			String ID = "root";
			String Password = "mysql";
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection(url, ID, Password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String sql = "select commentID from comment order by commentID desc";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int comment(int movieID,String movieComment, String userID, int commentRating) {
		String sql = "insert into comment values (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, getNext());
			pst.setInt(2, movieID);
			pst.setString(3, movieComment);
			pst.setString(4, userID);
			pst.setString(5, getDate());
			pst.setInt(6, commentRating);
			System.out.println(pst);
			return pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<CommentVO> getList(int bbsid) {
		String sql = "select * from Comment where movieID = ?";
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, bbsid);
			rs = pst.executeQuery();
			while (rs.next()) {
				CommentVO commentVO = new CommentVO();
				commentVO.setCommentID(rs.getInt(1));
				commentVO.setMovieID(rs.getInt(2));
				commentVO.setMovieComment(rs.getString(3));
				commentVO.setUserID(rs.getString(4));
				commentVO.setCommentDate(rs.getString(5));
				commentVO.setCommentRating(rs.getInt(6));
				list.add(commentVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete (int commentID) {
		String sql = "delete from comment where commentID = ?";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, commentID);
			System.out.println(pst);
			return pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
