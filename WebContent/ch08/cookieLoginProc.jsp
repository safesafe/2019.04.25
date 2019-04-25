<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		//id, pwd
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		boolean result = true; //DB연동 추후에....
		if(result) {
			Cookie cookie = new Cookie("idKey",id); //대소문자구분
			response.addCookie(cookie);
%>
		<script>
			alert("로그인 되었습니다.");
			location.href = "cookieLoginOK.jsp";
		</script>
<% 			
		}else{
%>
		<script>
			alert("로그인이 되지 않았습니다.");
			location.href = "cookieLogin.jsp";
		</script>
<%}%>
