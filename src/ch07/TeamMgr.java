package ch07;

import java.sql.*;
import java.util.*;

/*
 * DB�� ���õ� ����� �޼ҵ带 ������ Ŭ����
 */

public class TeamMgr {

	private DBConnectionMgr pool;
	
	public TeamMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	// �޼ҵ� �ٸ���� Mgr�� �Ѿ�°��� ����
	// Insert
	public boolean insertTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false; //flag�� �켱���� �ǹ�
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblTeam(name,city,age,team) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//? ����
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			int cnt = pstmt.executeUpdate(); // ���� ����
			if(cnt == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt); //connection �ݳ�, pstmt close
		}
		return flag;
	}
	
	//List
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist = new Vector<TeamBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();		// ����
			while(rs.next()) {
				TeamBean bean = new TeamBean();
				/* int num = rs.getInt("num");
				bean.setNum(num); */
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCity(rs.getString("city"));
				bean.setAge(rs.getInt("age"));
				bean.setTeam(rs.getString("team"));
				vlist.addElement(bean);
			}	// 
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// Get
	public TeamBean getTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		TeamBean bean = new TeamBean();
		try {
			con = pool.getConnection();
			sql = "select num, name, city, age, team from tblTeam where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	// Update
	public boolean updateTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblTeam set name =?, city =?, age =?, team =? where num=?;";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			pstmt.setInt(5, bean.getNum());
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// Delete
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblTeam where num = ?";
			pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, num);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
}