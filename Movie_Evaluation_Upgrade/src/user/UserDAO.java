package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection cn;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/Evaluation";
			String ID = "root";
			String Password = "mysql";
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection(url, ID, Password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login (String userID, String userPassword) {
		String sql = "select userPassword from user where userID = ?";
		try {
			pst = cn.prepareStatement(sql);
			pst.setString(1, userID);
			rs = pst.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				} else {
					return 0;
				}
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int create (UserVO user) {
		String sql = "insert into user values(?, ?, ?, ?)";
		try {
			pst = cn.prepareStatement(sql);
			pst.setString(1, user.getUserID());
			pst.setString(2, user.getUserPassword());
			pst.setString(3, user.getUserNick());
			pst.setString(4, user.getUserEmail());
			return pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}