<!-- gugudan_khy.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<table border="1" ; cellpadding="5" style="border-style: dotted; border-color:white; color:grey; background-color: beige">
	<%
	for(int i = 0; i < 10; i++)
	{
		out.println("<tr>");
	
	for(int j =2; j < 10; j++)
	{
		if(i==0)
		{
		out.print("<th>" + j + "´Ü</th>");
		}
	else
	{
%>
	<td><%=j%> x <%=i%> = <font color=red><%=i*j %></font></td>
	<%
	}
		}
		out.println("</tr");
		}
	%>
</table>