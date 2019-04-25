<!-- Script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%! // 선언문 영역
	String declaration = "선언문";
	
	public String decMethod()
	{
		return declaration;
	}
%>

<%	// 스크립트릿
	String Scriptlet 		= "스크립트릿";
	String Comment 	= "주석";
	
	// 내장 객체
	out.println("내장객체를 이용한 출력 : " + declaration + "<p/>");
%>

선언문의 출력
1. <%=declaration%><p/>
2. <%=decMethod() %>

스크립트릿의 출력
	<%=Scriptlet%><p/>
<!-- 세미콜론( ; )이 필요없다. -->