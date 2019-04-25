<!-- session1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	
	// DB연동
	boolean result = true;
	if(result) { // 로그인 성공했을 경우
		session.setAttribute("idKey", id);	// 세션객체에 로그인 정보 저장
		session.setMaxInactiveInterval(60 * 3);		// 저장시간 3분으로 설정 - 3분 지나면 데이터 삭제
	}
	else { // 로그인 실패했을 경우
%>
	<script>
		alert("로그인 실패입니다.");
		location.href = "session1.html";
	</script>
<%		
	}
%>
<h1>Session Example1</h1>
<FORM METHOD=POST ACTION="session2.jsp">
    1.가장 좋아하는 계절은?<br>
	<INPUT TYPE="radio" NAME="season" VALUE="봄">봄
	<INPUT TYPE="radio" NAME="season" VALUE="여름">여름
	<INPUT TYPE="radio" NAME="season" VALUE="가을">가을
	<INPUT TYPE="radio" NAME="season" VALUE="겨울">겨울<p>

	2.가장 좋아하는 과일은?<br>
	<INPUT TYPE="radio" NAME="fruit" VALUE="watermelon">수박
	<INPUT TYPE="radio" NAME="fruit" VALUE="melon">멜론
	<INPUT TYPE="radio" NAME="fruit" VALUE="apple">사과
	<INPUT TYPE="radio" NAME="fruit" VALUE="orange">오렌지<p>
	<INPUT TYPE="submit" VALUE="결과보기">
</FORM>