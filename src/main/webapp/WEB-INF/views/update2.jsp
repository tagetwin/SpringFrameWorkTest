<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update2</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
	<h1>Update2 페이지입니다.</h1>
	<form action="update2" method="POST">
	<input type="hidden" name="page" value="${cri.page}"/>
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<table class="table">
			<tr>
				<th>번호</th>
				<td><input type="text" name="bno" value="${board.bno}" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${board.title}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50" name="content" >${board.content}</textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${board.writer}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="submit">수정</button>
				<button type="reset">취소</button>
				<button id ="list">목록보기</button>
				<button id ="delete">삭제</button>
				
<%-- 				<input type="button" value="목록보기" onclick="location.href='list?page=${cri.page}'" /> --%>
<%-- 				<input type="button" value="삭제" onclick="location.href='delete?bno=${board.bno}'" /> --%>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<form id="jobForm">
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="perPageNum"	value="${cri.perPageNum}" />
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
		<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
	</form>
	
<script>
	var jobForm = $('#jobForm');

	$('#list').on('click', function(event){
		event.preventDefault();
		jobForm.attr('action','/list').attr('method','get');
// 		bno도 넘어가니까 필요 없으니까 제거해준다.
		jobForm.find("[name='bno']").remove();   
		jobForm.submit();
	});
	
	$('#delete').on('click', function(event){
		event.preventDefault();
		jobForm.attr('action','/delete2').attr('method','get');
		jobForm.submit();
	})	
	
</script>
</body>
</html>