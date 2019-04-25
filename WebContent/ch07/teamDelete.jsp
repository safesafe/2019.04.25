<!-- teamDelete.jsp : 화면에 보여지는 페이지가 아닌 처리만 수행 -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int num = 0;
	if(request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
		mgr.deleteTeam(num);
	}
	response.sendRedirect("teamList.jsp");
%>