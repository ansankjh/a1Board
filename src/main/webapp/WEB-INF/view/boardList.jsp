<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 타이틀과 닉네임 검색기능
	            $("#keyword").keyup(function() {
	                var k = $(this).val();
	                $("#user-table > tbody > tr").hide();
	                if($('#category').val() == "타이틀") { // category의 value가 타이틀이 들어오면 타이틀 검색
	                	var temp = $("#user-table > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");	
	                } else if($('#category').val() == "닉네임") { // category의 value가 닉네임이 들어오면 닉네임 검색
	                	var temp = $("#user-table > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
	                }
	                
	                $(temp).parent().show();
	            });
	        });
		</script>
	</head>
	<body>
		<h1>A1 게시판</h1>
		<a href="${pageContext.request.contextPath}/addBoard?boardName=${boardName}">입력</a>
		<div id="container">
			<div id="input-form">
				<select name="category" id="category">
					<option value="타이틀">타이틀</option>
					<option value="닉네임">닉네임</option>
				</select>
	            이름 : <input type="text" id="keyword" />
	        </div>
			<table class="table table-bordered table-hover" style="width:1000px;" id="user-table">
				<thead>
					<tr>
						<th>타이틀</th>
						<th>본문</th>
						<th>닉네임</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
		</div>
	</body>
</html>