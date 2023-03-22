<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addBoard</title>
	</head>
	<body>
		<h1>a1 게시판 입력</h1>
		<form action="${pageContext.request.contextPath}/addBoard" method="post">
			<table border="1">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="boardTitle">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" cols="30" name="boardMemo"></textarea>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<c:if test="${boardName == null}">
							<input type="text" name="boardName">
						</c:if>
						<c:if test="${boardName != null}">
							<input type="text" name="boardName" value="${boardName}">
						</c:if>						
					</td>
				</tr>
				<tr>
					<td>중요체크</td>
					<td>
						<input type="checkbox" name="boardLevel" value="중요">중요
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>