package ch07;

import java.sql.*;

public class mySQLConnection {
	
	// 접속할 mySQL의 기본 세팅값
	private String driver 	= "org.gjt.mm.mysql.Driver";
	private String url		= "jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR";
	private String user 	= "root";
	private String pwd	= "1234";
	Connection con;
	
	public mySQLConnection() {
		try {
			// DB 접속 공식
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void listTeam() {
		
		try {
			String sql 		= "select * from tblTeam";
			PreparedStatement pstmt 		= con.prepareStatement(sql);
			ResultSet rs 							= pstmt.executeQuery();
			System.out.println("번 호\t성 명\t사는 곳\t나 이\t팀 명\t");
			while(rs.next()) { // next는 행이 있으면 true, 없으면 false가 출력된다.
										// 따라서 다음 행이 존재하지 않으면 while문이 종료된다.
				int num 		= rs.getInt("num");
				String name 	= rs.getString("name");
				String city 		= rs.getString("city");
				int age 			= rs.getInt("age");
				String team 	= rs.getString("team");
				System.out.println(num+ "\t" +name+ "\t" + city + "\t        "+ age + "\t" + team + "\t");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertTeam(String name, String city, int age, String team) {
		try {
			String sql = "insert tblTeam(name, city, age, team)" + "values(?, ?, ?, ?)";
			PreparedStatement pstmt 		= con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, city);
			pstmt.setInt(3, age);
			pstmt.setString(4, team);
			int cnt = pstmt.executeUpdate();		// insert, update, delete 전부 포함된 타입
			if(cnt == 1)
				System.out.println("입력 성공");
			else
				System.out.println("입력 실패");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateTeam(int num, String name, String city, int age, String team) {
		try {
			String sql = "update tblTeam set num= ?, name=?, city=?, age=?, team=? where num = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, city);
			pstmt.setInt(4, age);
			pstmt.setString(5, team);
			pstmt.setInt(6, num);
			int cnt = pstmt.executeUpdate();		// insert, update, delete 전부 포함된 타입
			if(cnt == 1)
				System.out.println("입력 성공");
			else
				System.out.println("입력 실패");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}
	public void deleteTeam(int num) {
		try {
		String sql = "delete from tblTeam where num = ?";
		PreparedStatement pstmt 		= con.prepareStatement(sql);
		pstmt.setInt(1, num);
		int cnt = pstmt.executeUpdate();		// insert, update, delete 전부 포함된 타입
		if(cnt == 1)
			System.out.println("입력 성공");
		else
			System.out.println("입력 실패");
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	public static void main(String[] args) {
		mySQLConnection mcon = new mySQLConnection();
		mcon.updateTeam(4, "신동엽", "부산", 38, "MC");
		mcon.listTeam();
	}

}
