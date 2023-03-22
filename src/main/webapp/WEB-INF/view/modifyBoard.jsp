<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyBoard</title>
	</head>
	<body>
		<h1>a1 게시글 수정</h1>
		<form action="${pageContext.request.contextPath}/modifyBoard" method="post">
			<input type="hidden" name="boardName" value="${boardName}">
			<table border="1">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="boardTitle" value="${boardTitle}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" cols="30" name="boardMemo">${boardMemo}</textarea>
					</td>
				</tr>
				<tr>
					<td>중요체크</td>
					<td>
						<c:if test="${boardLevel == 1}">
							<input type="checkbox" name="boardLevel" value="${boardLevel}" readonly="readonly" checked>중요
						</c:if>
						<c:if test="${boardLevel == 0}">
							<input type="checkbox" name="boardLevel" value="${boardLevel}" readonly="readonly">중요
						</c:if>
						
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">수정</button>
			</div>
		</form>
	</body>
</html>