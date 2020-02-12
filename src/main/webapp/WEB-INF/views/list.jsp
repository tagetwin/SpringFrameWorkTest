<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
	<h1>리스트 페이지입니다.</h1>
	<table border="1">
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
					<td>${list.content}</td>
					<td>${list.writer}</td>
					<td><fmt:formatDate value="${list.regDate}"/> </td>
					<td>${list.readCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="write">글쓰기</a>
</body>
</html>