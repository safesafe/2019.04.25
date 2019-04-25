<!-- request2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String protocol				= request.getProtocol();
	String serverName 		= request.getServerName();
	int serverPort 				= request.getServerPort();
	String remoteAddr			= request.getRemoteAddr();
	String remoteHost			= request.getRemoteHost();
	String method				= request.getMethod();
	String requestURI			= request.getRequestURI();
	String useBrowser			= request.getHeader("User-Agent");
	String query					= request.getQueryString();
	
	StringBuffer requestURL =  request.getRequestURL();
%>
프로토콜 : <%=protocol%><p/>
서버 이름 : <%=serverName%><p/>
서버 포트번호 : <%=serverPort%><p/>
사용자 컴퓨터 주소 : <%=remoteAddr%><p/>
사용자 컴퓨터 이름 : <%=remoteHost%><p/>
사용 Method : <%=method%><p/>
요청 경로 (URI) : <%=requestURI%><p/>
요청 경로 (URL) : <%=requestURL%><p/>
현재 사용하는 브라우저 : <%=useBrowser%><p/>
Query : <%=query%>