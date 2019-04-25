<!-- exception2.jspa -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page isErrorPage = "true" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String message 			= exception.getMessage();
	String objectMessage	= exception.toString(); 
%>

! 에러 메시지 : <%=message%><br/>
! 에러 클래스와 메시지 : <%=objectMessage%><br/>