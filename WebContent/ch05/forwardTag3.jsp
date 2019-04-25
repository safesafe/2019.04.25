<!-- forwardTag3.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	String name = "강호동";
%>
혈액형으로 보는 나의 성격은?<hr align="left" color="green" width="50%"/>
<jsp:forward page='<%=bloodType + ".jsp" %>'>
	<jsp:param value="<%=name %>" name="name"/>
</jsp:forward>