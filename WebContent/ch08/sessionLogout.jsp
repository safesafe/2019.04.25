<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionID = session.getId();
	session.invalidate();		// ��� ���� ����
	String sessionID2 = session.getId();
%>
<script>
	alert("<%=sessionID + " : �α׾ƿ�"%>" );
	location.href = "sessionLogin.jsp";
</script>