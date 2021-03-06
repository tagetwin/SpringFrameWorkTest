<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input</title>
</head>
<body>
	<h1>Input 페이지입니다.</h1>
	<form action="input" method="POST">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="저장" />
				<input type="reset" value="취소" />
				<input type="button" value="목록보기" onclick="location.href='list'"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>