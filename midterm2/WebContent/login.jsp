<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div>
		<tr>
			<td>
				<form action="InsertServlet" method="post">
					<!-- ENCTYPE="multipart/form-data"  打了就讀不到了!!測試過!!!-->
					<h1>新增一筆資料(用css縮放展開細節)</h1>
					<input type="text" name="Insert" size=50%> <input
						type="submit" value="submit">
					<p>請輸入:</p>
					<p>序號,學校代碼,學校名稱,科系代碼,科系名稱,等級別,縣市名稱,平均成績,截止時間</p>
					<p>參考格式:</p>
					<p>1,1,國立政治大學,380101,法律學系,B 學士,30 臺北市,76,2019-1-2</p>
					<p>請新增:</p>
					<p>10101,8888,火星大學,810388,航太衛生系,B 學士,88 火星梅克市,88,2019-1-2</p>

					<hr />
				</form>
			</td>
		</tr>

		<tr>
			<td>
				<form action="RetrieveServlet" method="post">
					<h2>查詢所有</h2>
					<input type="submit" value="Retrieve" name="Retrieve">
				</form>
			</td>
			<hr />
		</tr>

		<tr>
			<td>
				<form action="UpdateServlet" method="post">
					<h2>修改一筆資料(序號為主鍵)</h2>
					<input type="text" name="Update" size=50%> <input
						type="submit" value="Update">
					
					<p>請輸入:</p>
					<p>學校代碼,學校名稱,科系代碼,科系名稱,等級別,縣市名稱,平均成績,截止時間</p>
					<p>請修改此列資料:</p>
					<p>3,1,國立政治大學,310811,地政學系,B 學士,30 臺北市,68,2019/12/14</p>
					<p>變成</p>
					<p>3,8888,金星大學,810388,航太衛生系,B 學士,88 火星梅克市,88,2019-1-2</p>


				</form>
				<hr />
			</td>
		</tr>
		<tr>
			<td>
				<form action="DeleteServlet" method="post">
					<h2>刪除一筆資料:輸入序號(主鍵)</h2>
					<p>請刪除:</p>
					<p>1,1,國立政治大學,380101,法律學系,B 學士,30 臺北市,76,2019/1/2</p>
					<p>請輸入: 1</p>
					<input type="text" name="Delete" size=50%> <input
						type="submit" value="Delete">
				</form>
				<hr />
			</td>
		</tr>

	</div>

</body>
</html>