<!-- for.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
1에서 10까지의 합은 (식 포함)?<p/>
1. 표현식으로 출력<br/>
<!-- for : 크기가 정해진 것, while : 무한반복 -->
<%
	int sum = 0;
	for(int i=1; i<=10; i++)
	{
		if(i < 10)
		{
%>
		<%= i + " + " %>
<%
		}
		else
		{
%>
		<%= i + " = " %>
		<%
		}
		sum += i;
		}%>
<%=sum%><p/>

2. out.println을 이용하여 출력<br/>
<%
		sum = 0;
		for(int i=1; i<=10; i++)
		{
			if(i < 10)
			{
				out.print(i + " + ");
			}
			else
			{
				out.print(i + " = ");
			}
			sum += i;
		}
		out.print(sum);
%>