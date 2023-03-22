<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<h1>A1 게시판</h1>
		<a href="${pageContext.request.contextPath}/addBoard?boardName=${boardName}">입력</a>
		<table class="table table-bordered">
			<tr>
				<th>타이틀</th>
				<th>본문</th>
				<th>닉네임</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>
						<c:if test="${b.boardLevel eq '중요'}">
							<span class="bg-danger">${b.boardTitle}</span>
						</c:if>
						<c:if test="${b.boardLevel == null}">
							${b.boardTitle}
						</c:if>
					</td>
					<td>
						<c:if test="${b.boardLevel eq '중요'}">
							<span class="bg-danger">${b.boardMemo}</span>
						</c:if>
						<c:if test="${b.boardLevel == null}">
							${b.boardMemo}
						</c:if>
					</td>
					<td>${b.boardName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/modifyBoard?boardTitle=${b.boardTitle}&boardMemo=${b.boardMemo}&boardName=${b.boardName}&boardLevel=${b.boardLevel}">수정</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/removeBoard?boardTitle=${b.boardTitle}">삭제</a>
					</td>
				</tr>			
			</c:forEach>
		</table>
	</body>
</html>