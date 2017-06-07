<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kdn.model.domain.*"  %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:useBean 	id="pageBean"         class="com.kdn.model.domain.PageBean" 
				scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function pagelist(cpage){
		document.getElementById("pageNo").value=cpage;
		var nfrm = document.getElementById("nfrm");
		frm.action="listNoticeBoard.do";
		frm.submit();
	}
	function getNoticeBoard(nno){
		document.getElementById("nno").value = nno;
		<% System.out.println("111111111"+); %>
		var nfrm = document.getElementById("nfrm");
		<% System.out.println("222222222"); %>
		frm.action="searchNoticeBoard.do";
		<% System.out.println("333333333"); %>
		frm.submit();
	}
</script>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
</head>
<body>
	<div class="main">
		<form id="nfrm">
			<input type="hidden" id="pageNo" name="pageNo" value="1" /> <input
				type="hidden" id="no" name="no" />
			<table align="center">
				<tr>
					<th colspan="3">게시글 목록</th>
				</tr>
				<tr align="center">
					<td colspan="3" height="100" align="center">
					<select name="key" id="key">
							<option value="all">-----all-----</option>
							<option value="mno" <%=pageBean.getKey("mno")%>>작성자 번호</option>
							<option value="title" <%=pageBean.getKey("title")%>>제목</option>
							<option value="contents" <%=pageBean.getKey("contents")%>>내용</option>
					</select> 
					<input type="text" id="word" name="word" value="${pageBean.word}" />
						<a href="#" onclick="pagelist(1)">검색</a> &nbsp;&nbsp;&nbsp; <a
						href="insertNoticeBoardForm.do">글쓰기</a></td>
				</tr>
				<tr align="center">
					<td width="100">번호</td>
					<td width="200">제목</td>
					<td width="100">게시일</td>
					<c:forEach var="noticeBoard" items="${list}">
						<tr>
							<td>${noticeBoard.nno}</td>
							<td><a href="#" onclick="getNoticeBoard(${noticeBoard.nno})">${noticeBoard.title}</a></td>
							<c:out value="${noticeBaord.nno }">${noticeBoard.nno }</c:out>
							<td>${noticeBoard.ndate}</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
			<div class="bottom">
				<center>${pageBean.pagelink }</center>
			</div>
		</form>
	</div>
</body>
</html>



	









