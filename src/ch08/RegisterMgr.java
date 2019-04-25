package ch08;

import java.sql.*;
import java.util.*;

import ch07.DBConnectionMgr;

public class RegisterMgr {
	
	private DBConnectionMgr pool;
	
	public RegisterMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	public boolean loginRegister(String id, String pwd) {
		
		String sql = null;
		Connection con = null;
		PreparedStatement pstmt = null;		
		boolean flag = false;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from tblregister where  id= ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next() && rs.getInt(1) == 1 ) {
				flag = true;
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}  finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

}
