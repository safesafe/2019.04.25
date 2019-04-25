<!-- ScriptletTest.jsp -->
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% // 스크립트릿 : _jspService영역에 만들어도 됨
	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR_OF_DAY);
	int minute = c.get(Calendar.MINUTE);
	int second = c.get(Calendar.SECOND);
%>
<html>
<head>
<title>Scriptlet Test</title>
</head>
<body>
<h1>현재시간은 <%=hour %>시 <%=minute %>분 <%=second%>초입니다.</h1>
</body>
</html>