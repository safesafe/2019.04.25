<!-- expression.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%! // 무조건적인 법칙 : 배열 밑에는 항상 for문이 존재한다.
	String study[] = {"Java", "JSP", "Servlet", "Android"};
%>
<table border ="1" width ="200">
  <tr>
    <th>번호</th>
    <th>과목</th>
  </tr>
  <%
  	for(int i = 0; i < study.length; i++)
  	{
  %>
  <tr>
  	<td><%=i+1 %></td>
  	<td><%=study[i] %></td>
  </tr>
  <%
  	}
  %>
</table>
<table border ="1" width ="200">
  <tr>
    <th>번호</th>
    <th>과목</th>
  </tr>
  <%
  	for(int i = 0; i < study.length; i++)
  	{
		out.print("<tr>");
		out.print("<td>" + (i + 1) + "</td>");
		out.print("<td>" + study[i] + "</td>");
		out.print("</tr>");
  	}
  %>
</table>
  
