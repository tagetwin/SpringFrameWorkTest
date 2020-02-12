<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>

	<h1>수정 페이지입니다.</h1>
	<form>
		<div>
			<label>이름:</label>
			<input type="text" id="writer" value="${board.writer}" readonly="readonly"/>
		</div>
		<div>
			<label>제목:</label>
			<input type="text" id="title" value="${board.title}" />
		</div>
		<div>
			<label>내용:</label>
			<textarea id="content" >${board.content}</textarea>
		</div>
	</form>
	<input type="hidden" id="bno" value="${board.bno}"/>
	<a href="/bbs">목록</a>
	<button id="upd_btn">수정</button>
</body>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$('#upd_btn').on('click', function(){
	
	var data = {
		title : $('#title').val(),
		content : $('#content').val(),
		writer : $('#writer').val(),
		bno : $('#bno').val()
	}
	
	var bno = $('#bno').val();
	
		$.ajax({
		
			type : 'PUT',
			url : '/bbs/list/'+bno,
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8'
			
		}).done(function(){
			
			alert('수정성공');
			location.href='/bbs/list/'+bno;
			
		}).fail(function(){
			
			alert('수정실패');
		});
	
	
});

</script>
</html>