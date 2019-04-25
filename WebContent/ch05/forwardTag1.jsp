<!-- forwardTag1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
forward 되기 전의 페이지입니다.
<jsp:forward page = "forwardTag2.jsp"/>