<%@page import="guestbook.GuestBookMgr"%>
<%@page import="guestbook.GuestbookBean" %>
<%@page import="guestbook.JoinBean" %>
<%@page import="guestbook.CommentBean" %>
<%@page import="java.util.Vector" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<%@include file="getSession.jsp" %>
<title>GuestBook</title>
<script type="text/javascript">
	function updateFn(num) {
		url = "updateGuestBook.jsp?num=" + num;
		window.open(url, "Update GuestBook", "width=520, height=300");
	}
	
	function commentPost(frm) {
		if(frm.comment.value=="") {
			alert("내용을 입력해주세요.")
			frm.comment.focus();
			return;
		}
		frm.submit();
	}
	
	// <div id="cmt">
	function disFn(num) {
		var txt = "cmt" + num
		var e = document.getElementById(txt);	// e는 <div id="cmt">를 뜻함
		if(e.style.display=='none') {
			e.style.display = 'block';				
		} else {
			e.style.display = 'none';
		}
	}
	
</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<div align="center">
<%@ include file="postGuestBook.jsp" %>
<%
		GuestBookMgr mgr = new GuestBookMgr();
		Vector<GuestbookBean> vlist = mgr.listGuestBook(login.getId(), login.getGrade());
		mgr.listGuestBook(login.getId(), login.getGrade());
%>
<table width="520" cellspacing="0" cellpadding="3">
			<tr bgcolor="#F5F5F5">
			<td>
			<font size="2"><b><%=login.getName() %></b>
			</font>
			</td>
			<td align="right">
			<a href="logout.jsp">로그아웃</a>
			</td>
			</tr>
</table>
<!-- GuestBook List Start -->
<%
		if(vlist.isEmpty()) {
%>
<table width="520" cellspacing="0" cellpadding="7">
			<tr>
				<td>등록된 글이 없습니다.</td>
			</tr>
		</table>
<%			
		} else {
			for(int i=0; i < vlist.size(); i++) {
				GuestbookBean bean = vlist.get(i);
				//	방명록 쓴 사람의 정보
				JoinBean writer = mgr.getJoin(bean.getId());
				%>
				
<!-- 방명록 리스트 -->
<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table bgcolor="#F5F5F5">
							<tr>
								<td width="225">NO : <%=vlist.size()-i %></td>
								<td width="225">
								<img src="img/face.bmp" border="0" alt="이름">
								<a href="mailto:<%=writer.getEmail() %>">
								<%=writer.getName() %></a></td>
								<td width="150" align="center">
								<td><%if(writer.getHp()==null || writer.getHp().equals("")) {
									out.print("홈페이지가 없습니다.");
									} else {
										%>
									<a href="http://<%=writer.getHp() %>">
										<img alt="홈페이지" src="img/hp.bmp" border="0">
										</a>
										<%}%></td>
							</tr>
							<tr>
<!-- 게시글 내용 -->		<td colspan="3"><%=bean.getContents() %></td>
							</tr>
							<tr>
								<td>IP : <%=bean.getIp() %></td>
								<td><%=bean.getRegdate() + " " + bean.getRegtime() %></td>
								<td>
								<%
										// 로그인 아이디와 writer 아이디가 동일하다면 수정, 삭제 모드 활성화
										boolean chk = login.getId().equals(writer.getId());
										if(chk || login.getGrade().trim().equals("1")) {
											if(chk) {			
								%>
									<a href="javascript:updateFn('<%=bean.getNum()%>')">[수정]</a>
								<%}		// if chk%>
								
									<a href="deleteGuestBook.jsp?num=<%=bean.getNum()%>">[삭제]</a>
								<%
										if(bean.getSecret().trim().equals("1")) {
											out.println("비밀글");
										}
								}		// if chk || login%>
								</td>	
							</tr>							
						</table>
					</td>
				</tr>
		</table>
		
	<!-- Comment List Start -->
	<div id="cmt<%=bean.getNum()%>">
	
	<%
		Vector<CommentBean> clist = mgr.listComment(bean.getNum());
		if(!clist.isEmpty()) {
			
	%>

	<table width="500" bgcolor="#F5F5F5">
	<%
			for(int j=0; j <clist.size(); j++) {
				CommentBean cbean = clist.get(j);
	%>
	<tr>
		<td>
			<table width="500">
		<tr>
			<td><b><%=cbean.getCid() %></b></td>
			<td align="right">
			<%if(cbean.getCid().equals(login.getId())){ %>
			<a href="commentProc.jsp?flag=delete&cnum=<%=cbean.getCnum()%>">[삭제]</a>
			<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="2"><%=cbean.getComment()%></td>
		</tr>
		<tr>
			<td align="right"><%=cbean.getCregDate() %></td>
		</tr>
		</table>
		<hr/>
		</td>
	</tr>
	<% } // for %>
	</table>
	<% } // if %>
	</div>
	<table width="500">
	<tr><td><button onclick="disFn('<%=bean.getNum()%>')">댓글<%=clist.size() %></button></td></tr></table>

	<!-- Comment List End -->
	<!-- 댓글 입력폼 -->
	<form name="cFrm" action="commentProc.jsp">
				<table>
				<tr>
					<td><textarea name="comment" cols="72" rows="2"
							maxlength="1000"></textarea></td>
					<td><input type="button" value="댓글" onclick="javascript:commentPost(this.form)">
					<input type="hidden" name="flag" value="insert">
					<input type="hidden" name="num" value="<%=bean.getNum()%>">
					<input type="hidden" name="cid" value="<%=login.getId()%>">
					<input type="hidden" name="cip" value="<%=request.getRemoteAddr()%>">
					</td>
				</tr>
				</table>
				</form>
	<!-- 댓글 리스트 -->
<%
			} // for
		}	// if-else
%>
</div>
</body>
<%}			// getSession.jsp파일에서 else부분을 닫아준다. %>
</html>