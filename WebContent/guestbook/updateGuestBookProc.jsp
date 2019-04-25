<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestbookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	if(bean.getSecret()==null) {
		bean.setSecret("0");
	}
	mgr.updateGuestBook(bean);
%>
<script>
	
	// 수정이 완료되면 창은 닫히고 showGuestBook.jsp에 수정내용이 적용된다.
	opener.location.reload();		// 새로고침
	self.close();							// 창 닫기
</script>