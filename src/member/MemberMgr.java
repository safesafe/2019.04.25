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
	
	// ID 중복확인
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
			rs = pstmt.executeQuery();	// SQL문 실행
			flag = rs.next();					// true라면 중복이고, false라면 중복이 아니다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// 우편번호 검색
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
			pstmt.setString(1, "%"+area3+"%");		// '%검색어%' 로 세팅된다.
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
	// 회원가입
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
			// 9번째는 hobby로, 타입이 체크박스이기 때문에 다른 방식을 이용하여야 한다.
			String hobby[] = bean.getHobby();	// {"항목 1", "항목 2", "항목 3"}를 의미
			char hb[] = {'0','0','0','0','0'};
			String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
			for(int i=0; i<hobby.length; i++) {			// 사용자가 배열에서 선택한 항목들을 의미, 예를 들어 {"인터넷", "여행", "영화"}
				for (int j = 0; j < lists.length; j++) {		// lists 배열의 모든 값을 불러온다.
					if(hobby[i].equals(lists[j])) {				// lists 배열의 값과 사용자가 선택한 값을 비교하여 같을 경우 실행
						hb[j] ='1';			// 같을경우 hb 배열의 0이었던 값을 1로 변경
						break;
					}	// if
				}	// for j
			}	// for i
			// new String(char value[])이라는 생성자가 존재하기 때문에 사용가능
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
	// 로그인
	
	// 회원정보 가져오기
	
	// 회원정보 수정
	
	
}
