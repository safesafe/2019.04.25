<!--  cookCookie.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String cookieName = "myCookie";
		Cookie cookie = new Cookie(cookieName, "Apple");
		cookie.setMaxAge(60); //1분
		cookie.setValue("melone"); //
		response.addCookie(cookie); //응답시 쿠키값도 가져가라
%>
쿠키를 만듭니다.<br/>
쿠키 내용은 <a href = "tasteCookie.jsp">여기로</a>!!!
