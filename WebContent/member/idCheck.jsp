<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<jsp:useBean id="mgr" class="member.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
%>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center"> 
<%if(true == mgr.checkId(id)) { %>
	<%=id %>�� �����ϴ� ���̵��Դϴ�.<p/>
	<input type="button" value="Close" onclick="window.close()">
<%} else {	%>
	<%=id %>�� ��밡���� ���̵��Դϴ�.<p/>
	<input type="button" value="Close" onclick="window.close()">
<% } %>
</div>
</body>
</html>