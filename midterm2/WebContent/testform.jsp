<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Testform" method="post">
	<!-- ENCTYPE="multipart/form-data"  打了就讀不到了!!測試過!!!-->

		<input type="text" name="insert" size=50%> <input
			type="submit" value="submit">
		<p>請輸入:</p>
		<p>學校代碼,學校名稱,科系代碼,科系名稱,等級別,縣市名稱,平均成績,截止時間</p>
		<p>參考格式:</p>
		<p>1,國立政治大學,380101,4,法律學系,B 學士,30 臺北市,76,2019/1/2</p>
		<h1>成功則顯示於console</h1>
		<hr />
	</form>
</body>
</html>