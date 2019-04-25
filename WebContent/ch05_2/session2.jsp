<!-- session2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String season 	= request.getParameter("season");
	String fruit		 	= request.getParameter("fruit");
	String id 			= (String)session.getAttribute("idKey");
	String sessionId	= session.getId();
	int intervalTime	= session.getMaxInactiveInterval(); // 기본값은 30분
	if(id != null) {
		%>
		<%=id%> 님이 좋아하는 계절은 <%=season%>이며, 과일은 <%=fruit%>입니다. <br/>
		세션 ID : <%=sessionId %> <br/>
		세션 유지 시간 : <%= intervalTime %>초 <br/>
		<%
	}
	else {
		out.println("세션이 만료되었거나 다른 이유로 연결을 할 수 없습니다.");
	}
%>
