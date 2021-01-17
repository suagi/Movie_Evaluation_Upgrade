package content;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MovieDAO {
	
	private Connection cn;
	private ResultSet rs;

	public MovieDAO() {
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
		String sql = "select movieID from movie order by movieID desc";
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
	
	public int posting(String movieThumbnail, String movieTitle, String movieLength, String moviePremiere, 
			String movieDirector, String movieActor, String movieContent, String userID, String movieShow) {
		String sql = "insert into movie values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, getNext());
			pst.setString(2, movieThumbnail);
			pst.setString(3, movieTitle);
			pst.setString(4, movieLength);
			pst.setString(5, moviePremiere);
			pst.setString(6, movieDirector);
			pst.setString(7, movieActor);
			pst.setString(8, movieContent);
			pst.setInt(9, 1);
			pst.setString(10, userID);
			pst.setString(11, getDate());
			pst.setFloat(12, 0);
			pst.setString(13, movieShow);
			return pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<MovieVO> getList(int pageNumber) {
		String sql = "select * from movie where movieID < ? and movieAvailable = 1 order by movieID desc limit 12";
		ArrayList<MovieVO> list = new ArrayList<MovieVO>();
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, getNext() - (pageNumber - 1) * 12);
			rs = pst.executeQuery();
			while (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieID(rs.getInt(1));
				movieVO.setMovieThumbnail(rs.getString(2));
				movieVO.setMovieTitle(rs.getString(3));
				movieVO.setMovieLength(rs.getString(4));
				movieVO.setMoviePremiere(rs.getString(5));
				movieVO.setMovieDirector(rs.getString(6));
				movieVO.setMovieActor(rs.getString(7));
				movieVO.setMovieContent(rs.getString(8));
				movieVO.setMovieAvailable(rs.getInt(9));
				movieVO.setUserID(rs.getString(10));
				movieVO.setUploadDate(rs.getString(11));
				movieVO.setMovieRating(rs.getInt(12));
				movieVO.setMovieShow(rs.getString(13));
				list.add(movieVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) { // 10개씩 끊기 위함
		String sql = "select * from movie where movieID < ? and MovieAvailable = 1";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, getNext() - (pageNumber - 1) * 12);
			rs = pst.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public MovieVO getMovieVO(int movieID) {
		String sql = "select * from movie where movieID =?";
		try {
			PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1, movieID);
			rs = pst.executeQuery();
			if (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieID(rs.getInt(1));
				movieVO.setMovieThumbnail(rs.getString(2));
				movieVO.setMovieTitle(rs.getString(3));
				movieVO.setMovieLength(rs.getString(4));
				movieVO.setMoviePremiere(rs.getString(5));
				movieVO.setMovieDirector(rs.getString(6));
				movieVO.setMovieActor(rs.getString(7));
				movieVO.setMovieContent(rs.getString(8));
				movieVO.setMovieAvailable(rs.getInt(9));
				movieVO.setUserID(rs.getString(10));
				movieVO.setUploadDate(rs.getString(11));
				movieVO.setMovieRating(rs.getInt(12));
				movieVO.setMovieShow(rs.getString(13));
				return movieVO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
