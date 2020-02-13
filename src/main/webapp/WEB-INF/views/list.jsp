<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png"> -->
<title>List</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<h1>리스트 페이지입니다.</h1>
		<a href="write">글쓰기</a> <a href="input">Input</a>
		<table class="table" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.bno}</td>
						<td><a href="list/${list.bno}">${list.title}</a></td>
						<td><a href="update2?bno=${list.bno}">${list.content}</a></td>
						<td>${list.writer}</td>
						<td><fmt:formatDate value="${list.regDate}" /></td>
						<td>${list.readCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- pageMaker{s} -->
	<div id="pageMakerBox" class="">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a href="list?page=${pageMaker.startPage-1}" class="page-link">Prev</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item <c:out value="${pageMaker.cri.page == idx ? 'active' : ''}"/> ">
				<a href="list?page=${idx}" class="page-link"> ${idx} </a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a href="list?page=${pageMaker.endPage+1}" class="page-link">Next</a></li>
			</c:if>
		</ul>
	</div>

</body>
</html>