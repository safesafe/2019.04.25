<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionID = session.getId();
	session.invalidate();		// 모든 세션 제거
	String sessionID2 = session.getId();
%>
<script>
	alert("<%=sessionID + " : 로그아웃"%>" );
	location.href = "sessionLogin.jsp";
</script>