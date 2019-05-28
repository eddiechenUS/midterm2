<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<title>login page</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

fieldset {
	border: green 2px solid;
	padding: 20px;
	border-radius: 25px;
	width: 50%;
	margin: auto;
}

/* .trans {

            display: none;
             width: 50px;
            height: 50px;
            background: rgb(245, 228, 0);
            -webkit-transition: width 2s, height 4s;
            transition: width 1s, height 1s; 
        } */
.trans_hover {
	display: block;
	width: 100%;
	height: 300px;
	background: rgb(245, 228, 0);
	transition: width 1s, height 1s;
}
</style>
<script>
	document.addEventListener("DOMContentLoaded",
			function() {
				document.getElementById("Delete").addEventListener("blur",
						checNum);

				// let k = document.querySelectorAll("");
				// for(let i in k){

				// }
				document.getElementById("Insert").addEventListener("focus",
						changeFont);
				document.getElementById("Update").addEventListener("focus",
						changeFont);
				document.getElementById("Delete").addEventListener("focus",
						changeFont);

				document.getElementById("Insert").addEventListener("blur",
						returnFont);
				document.getElementById("Update").addEventListener("blur",
						returnFont);
				document.getElementById("Delete").addEventListener("blur",
						returnFont);

				// document.getElementById("Insert").addEventListener("focus", showContent);
				// document.getElementById("Insert").addEventListener("blur", hideContent);
			});

	function changeFont() {
		var x = document.getElementById(this.id).previousElementSibling;
		// x.style.fontFamily = 'Noto Sans TC', sans - serif;

		x.style.backgroundColor = "lightblue";
		x.style.fontFamily = 'Noto Sans TC', sans - serif;

	}

	function returnFont() {
		var x = document.getElementById(this.id).previousElementSibling;
		// alert(this.id);
		x.style.fontFamily = "initial";
		x.style.backgroundColor = "white";

	}

	// function showContent() {
	//     var x = document.getElementById(this.id).parentElement.querySelector("div");
	//     x.className = "trans_hover";

	// x.style.display = "block";
	// x.style.width="50px";
	// x.style.height="50px";
	// x.style.background="rgb(245, 228, 0);";
	// x.style.transition="width 1s, height 1s";

	// width: 50px;
	// height: 50px;
	// background: rgb(245, 228, 0);
	// -webkit-transition: width 2s, height 4s;
	// /* For Safari 3.1 to 6.0 */
	// transition: width 1s, height 1s;

	//}

	// function hideContent() {
	//      var x = document.getElementById(this.id).parentElement.querySelector("div");
	//     //var x = document.getElementsByClassName("example color");
	// }

	function checNum() {
		let getNum = document.getElementById("Delete").value;
		let re = /^[\d]+$/;
		if (getNum == "") {
			document.getElementById("spDelete").innerHTML = "";
		} else if (re.test(getNum)) {
			document.getElementById("spDelete").innerHTML = "<img src='res/check1.png'>";
		} else {
			document.getElementById("spDelete").innerHTML = "<img src='res/error.png'>無效輸入";
		}
	}

	function resetf() {
		document.getElementById("Insert").value = "";
		document.getElementById("Update").value = "";
		document.getElementById("Delete").value = "";

		document.getElementById("spDelete").innerHTML = "";
	}
</script>
</head>

<body>
	<fieldset>
		<legend>台灣大專院校科系查詢系統</legend>
		<div>


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
					<form action="InsertServlet" method="post">
						<!-- ENCTYPE="multipart/form-data"  打了就讀不到了!!測試過!!!-->

						<h1><marquee direction="right" height="45" scrollamount="5"
							behavior="alternate">
							新增一筆資料
						</marquee></h1>


						
						<input id="Insert" type="text" name="Insert" size=50%> <span
							id="spInsert"></span> <input type="submit" value="submit">
						<div class="trans">
							<p>請輸入:</p>
							<p>序號,學校代碼,學校名稱,科系代碼,科系名稱,等級別,縣市名稱,平均成績,截止時間</p>
							<p>參考格式:</p>
							<p>1,1,國立政治大學,380101,法律學系,B 學士,30 臺北市,76,2019-1-2</p>
							<p>請新增:</p>
							<p>10101,8888,火星大學,810388,航太衛生系,B 學士,88 火星梅克市,88,2019-1-2</p>
						</div>
						<hr />
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<form action="UpdateServlet" method="post">
						<h1>
							<marquee direction="right" height="45" scrollamount="10"
								behavior="alternate">修改一筆資料(序號為主鍵)</marquee>
						</h1>
						<input id="Update" type="text" name="Update" size=50%> <span
							id="spUpdate"></span> <input type="submit" value="Update">
						<div class="trans">
							<p>請輸入:</p>
							<p>學校代碼,學校名稱,科系代碼,科系名稱,等級別,縣市名稱,平均成績,截止時間</p>
							<p>請修改此列資料:</p>
							<p>3,1,國立政治大學,310811,地政學系,B 學士,30 臺北市,68,2019/12/14</p>
							<p>變成</p>
							<p>3,8888,金星大學,810388,航太衛生系,B 學士,88 火星梅克市,88,2019-1-2</p>
						</div>

					</form>
					<hr />
				</td>
			</tr>
			<tr>
				<td>
					<form action="DeleteServlet" method="post">
						<h1><marquee direction="right" height="45" scrollamount="5"
							behavior="alternate">刪除一筆資料:</marquee></h1>
						<input id="Delete" type="text" name="Delete" size=50%> <input
							type="submit" value="Delete"> <span id="spDelete"></span>
						<div class="trans">
							<p>請刪除:</p>
							<p>1,1,國立政治大學,380101,法律學系,B 學士,30 臺北市,76,2019/1/2</p>
							<p>
								請輸入: 1 <span class="instruction"> (輸入序號/主鍵:僅接受單筆刪除)</span>
							</p>
						</div>
					</form>
					<hr />
				</td>
			</tr>

			<div class="c2">
				<input type="reset" value="清空" onclick="resetf()"
					style="width: 140px; height: 50px;">
			</div>

		</div>
	</fieldset>
</body>

</html>