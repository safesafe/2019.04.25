<!--  cookCookie.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String cookieName = "myCookie";
		Cookie cookie = new Cookie(cookieName, "Apple");
		cookie.setMaxAge(60); //1��
		cookie.setValue("melone"); //
		response.addCookie(cookie); //����� ��Ű���� ��������
%>
��Ű�� ����ϴ�.<br/>
��Ű ������ <a href = "tasteCookie.jsp">�����</a>!!!
