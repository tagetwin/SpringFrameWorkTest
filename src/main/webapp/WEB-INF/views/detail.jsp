<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
</head>
<body>

	<h1>상세 페이지입니다.</h1>
	<form>
		<div>
			<label>이름:</label>
			<input type="text" id="writer" value="${board.writer}" readonly="readonly"/>
		</div>
		<div>
			<label>제목:</label>
			<input type="text" id="title" value="${board.title}" readonly="readonly"/>
		</div>
		<div>
			<label>내용:</label>
			<textarea id="content" readonly="readonly">${board.content}</textarea>
		</div>
	</form>
	<a href="/bbs">목록</a>
</body>
	
</html>