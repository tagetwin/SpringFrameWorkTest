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
			<label>이름:</label> <input type="text" id="writer" value="${board.writer}" readonly="readonly" />
		</div>
		<div>
			<label>제목:</label> <input type="text" id="title" value="${board.title}" readonly="readonly" />
		</div>
		<div>
			<label>내용:</label>
			<textarea id="content" readonly="readonly">${board.content}</textarea>
		</div>
	</form>
	<a href="/">목록</a>
	<input type="hidden" id="bno" value="${board.bno}" />
	<button id="upd_btn">수정</button>
	<button id="del_btn">삭제</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$('#del_btn').on('click', function() {

	var bno = $('#bno').val();

	$.ajax({

		type : 'DELETE',
		url : '/list/' + bno

	}).done(function(r) {
		if(r == 1){
			alert('삭제성공');
			location.href = '/';
		}
	}).fail(function() {
		alert('삭제실패');
	});

});
$('#upd_btn').on('click', function() {
	var bno = $('#bno').val();
	location.href='/list/update/' + bno

});
</script>
</body>

</html>