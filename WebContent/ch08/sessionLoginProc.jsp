<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" scope="session" class="ch08.RegisterMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	// ID, PWD�� ��û�޾Ƽ� loginRegister �޼ҵ带 ȣ���Ͽ�
	// �����̸� sessionLoginOK.jsp�� ������ �����ϸ� sessionLogin.jsp�� ���ư���.
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	boolean result = mgr.loginRegister(id, pwd);
	String msg = "�α��� ���� �ʽ��ϴ�.";
	String location = "sessionLogin.jsp";
	if(result) {
		msg = "�α��� �Ǿ����ϴ�.";
		location = "sessionLoginOK.jsp";
		session.setAttribute("idKey", id);
	}
%>
<script>
	alert("<%=msg%>");
	location.href= "<%=location%>";
</script>
