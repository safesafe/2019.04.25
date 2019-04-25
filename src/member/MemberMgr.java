package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// ID �ߺ�Ȯ��
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	// SQL�� ����
			flag = rs.next();					// true��� �ߺ��̰�, false��� �ߺ��� �ƴϴ�.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// �����ȣ �˻�
	public Vector<ZipcodeBean> zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblZipcode where area3 like ?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%");		// '%�˻���%' �� ���õȴ�.
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	// ȸ������
	public boolean insertMember(MemberBean bean) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblMember(id, pwd, name, gender, birthday, email, zipcode, address, hobby, job) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			// 9��°�� hobby��, Ÿ���� üũ�ڽ��̱� ������ �ٸ� ����� �̿��Ͽ��� �Ѵ�.
			String hobby[] = bean.getHobby();	// {"�׸� 1", "�׸� 2", "�׸� 3"}�� �ǹ�
			char hb[] = {'0','0','0','0','0'};
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
			for(int i=0; i<hobby.length; i++) {			// ����ڰ� �迭���� ������ �׸���� �ǹ�, ���� ��� {"���ͳ�", "����", "��ȭ"}
				for (int j = 0; j < lists.length; j++) {		// lists �迭�� ��� ���� �ҷ��´�.
					if(hobby[i].equals(lists[j])) {				// lists �迭�� ���� ����ڰ� ������ ���� ���Ͽ� ���� ��� ����
						hb[j] ='1';			// ������� hb �迭�� 0�̾��� ���� 1�� ����
						break;
					}	// if
				}	// for j
			}	// for i
			// new String(char value[])�̶�� �����ڰ� �����ϱ� ������ ��밡��
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, bean.getJob());
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	// �α���
	
	// ȸ������ ��������
	
	// ȸ������ ����
	
	
}
