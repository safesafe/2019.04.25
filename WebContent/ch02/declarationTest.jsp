<!-- declarationTest.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%!
	public String getStr()
	{
		str += "테스트입니다.";
		return str;
	}
	private String str = "선언문";
%>
<h1><%=getStr() %></h1>