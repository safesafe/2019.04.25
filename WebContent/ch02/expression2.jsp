<!-- expression2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
	public static int max1(int a, int b) {
   		return (a >= b) ? a : b;
}
%>
<%
	java.util.Date d = new java.util.Date();
	int hour = d.getHours();
	int one = 10;
	int two = 12;
%>
지금은 오전일까요 오후일까요? <%=(hour < 12) ? "오전" : "오후" %>
one과 two 둘 중에 큰 숫자는? <%=max1(one, two) %>