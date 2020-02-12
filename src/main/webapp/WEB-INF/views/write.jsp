<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<body>

	<h1>글쓰기 페이지입니다.</h1>
	<form>
		<div>
			<label>이름:</label>
			<input type="text"  id="writer"/>
		</div>
		<div>
			<label>제목:</label>
			<input type="text"  id="title"/>
		</div>
		<div>
			<label>내용:</label>
			<textarea id="content"></textarea>
		</div>
	</form>
	<button id="write_btn">작성</button>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$('#write_btn').on('click', function(){
	
	var data = {
		title : $('#title').val(),
		content : $('#content').val(),
		writer : $('#writer').val()
			
	}
	
	$.ajax({
	
		type : 'POST',
		url : '/bbs/write',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		
	}).done(function(r){
		if(r==1){
			console.log(r)
			alert('작성성공');
			location.href = '/bbs/list';
		}else{
			alert('작성실패1');	
		}
		
	}).fail(function(){
		
		alert('작성실패');
	});
	
	
});
	
</script>
</html>