<!-- forwardTag2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id 	= request.getParameter("id");
	String pwd 	= request.getParameter("pwd");
%>
forward 후의 페이지입니다. <br/>
id / pwd : <%=id + "/" + pwd%>