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
						<td><a class="read1" href="${list.bno}">${list.content}(${reple.repleCount})</a></td>
						<td>${list.writer}</td>
						<td><fmt:formatDate value="${list.regDate}" /></td>
						<td>${list.readCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<!-- pageMaker{s} -->
		<div id="pagenate">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
					<a href="${pageMaker.startPage-1}" class="page-link">Prev</a>
					</li>
				</c:if>
	
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li class="page-item <c:out value="${pageMaker.cri.page == idx ? 'active' : ''}"/> ">
					<a href="${idx}" class="page-link">${idx}</a></li>
				</c:forEach>
	
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a href="${pageMaker.endPage+1}" class="page-link">Next</a></li>
				</c:if>
			</ul>
		</div>
		
		<form id='searchForm' action="/list" method='get'>
		<div class="form-group">
			<select name='type' class="form-control">
				<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
				<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
			</select>
		</div>
			<input class="form-control" type='text' name='keyword' value="${pageMaker.cri.keyword}">
			<input type='hidden' name='page' value="${pageMaker.cri.page}">
			<input type='hidden' name='perPageNum' value="${pageMaker.cri.perPageNum}">
			<button type="button" id='s_btn' class="btn btn-info">Search</button>
		</form>
	</div>
	<form id="jobForm">
		<input type="hidden" name="page" value="${pageMaker.cri.page}" />
		<input type="hidden" name="perPageNum"	value="${pageMaker.cri.perPageNum}" />
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
		<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
	</form>
	
<script>
	$('#searchForm button').on('click', function(event){
		event.preventDefault();
		var searchForm = $('#searchForm');
		
		
		if(!searchForm.find('option:selected').val()){
			alert('검색종류를 선택하세요');
			return false
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert('키워드를 입력하세요');
			return false;
		}
		searchForm.find("input[name='page']").val(1);
		searchForm.submit();

	});

	var jobForm = $('#jobForm');
	$('#pagenate a').on('click', function(event){
		event.preventDefault();
		
		var targetPage = $(this).attr('href');
		jobForm = $('#jobForm');
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr('action','/list').attr('method','get');
		jobForm.submit();
		
	});

	$('.read1').on('click', function(event){
		event.preventDefault();
		jobForm = $('#jobForm');
		jobForm.append("<input type='hidden' name='bno' value='"
				+$(this).attr("href")+"'/>");
		jobForm.attr('action','/update2').attr('method','get');
		jobForm.submit();
		
	})	
	
</script>
	
</body>
</html>