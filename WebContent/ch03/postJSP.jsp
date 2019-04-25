<!-- postJSP.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<body>
<h1>Get Servlet 방식</h1>
<form method="post" action="postServlet">
ID : <input name ="id">
pwd : <input type="password" name="pwd"><br/>
email : <input name = "email">
<input type="submit" value="전송">
</form>
</body>
</html>