<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">

    <title>04dynamicInsert.html</title>
    <style>
        .instruction {
            color: rgb(145, 148, 148);
            font-size: 10px;
        }

        fieldset {
            border: green 2px solid;
            padding: 20px;
            border-radius: 25px;
            width: 50%;
            margin: auto;
        }

        .c1 {
            border-bottom: rgb(145, 148, 148) solid 1px;
            margin-bottom: 10px;
        }

        .c2 {
            text-align: center;

        }

        .navi {
            text-align: center;
            margin: 50px;


        }

        span {
            margin-left: 20px;
            margin-right: 20px;

        }

        span:hover {
            font-family: 'Fjalla One', sans-serif;
            cursor: pointer;
            font-size: 20px;
        }
    </style>
    <script>


        function checkName() {
            let getName = document.getElementById("idName").value;
            let re = /[\u4e00-\u9fa5]{2,}/;


            if (getName == "") {
                document.getElementById("spName").innerHTML = "<img src='/res/error.png'>不可為空白";
            } else if (getName.length < 2) {
                document.getElementById("spName").innerHTML = "<img src='/res/error.png'>需大於2個中文字";

            } else if (re.test(getName)) {
                document.getElementById("spName").innerHTML = "<img src='/res/check1.png'>正確";

            } else {
                document.getElementById("spName").innerHTML = "<img src='/res/error.png'>需為全中文";

            }
        }

        function reset_checkName() {
            document.getElementById("spName").innerHTML = "";
        }


        function chkPassword() {
            //取得元素值
            let getPwd = document.getElementById("idPwd").value;
            let thePwdLen = getPwd.length;
            //因為regEx打在一起有順序性,故分開打分開驗證
            let re1 = /[a-zA-Z]+/;
            let re2 = /[0-9]+/;
            let re3 = /[!@#$%^&*]+/;
            if (getPwd == "") {
                document.getElementById("spPwd").innerHTML = "<img src='Images/error.png'>不可為空白";
            } else if (thePwdLen < 6) {
                document.getElementById("spPwd").innerHTML = "<img src='Images/error.png'>需大於6個字元";

            } else if (re3.test(getPwd)) {
                document.getElementById("spPwd").innerHTML = "<img src='Images/check1.png'>正確";


            } else if (re1.test(getPwd) && re2.test(getPwd) && re3.test(getPwd)) {
                document.getElementById("spPwd").innerHTML = "<img src='Images/check1.png'>正確";


            } else {
                document.getElementById("spPwd").innerHTML = "<img src='Images/error.png'>至少6個字且需含英文字母,數字,特殊字元[!@#$%^&*]";
            }
        }

        function checkDate() {
            let getDate = document.getElementById("idDate").value;
            let re = /^\d{4}\/\d{1,2}\/\d{1,2}$/;

            if (getDate == "") {
                document.getElementById("spDate").innerHTML = "<img src='Images/error.png'>不可為空白";
            } else if (re.test(getDate)) {

                if (isExistDate(getDate)) {
                    document.getElementById("spDate").innerHTML = "<img src='Images/check1.png'>日期有效";

                } else {
                    document.getElementById("spDate").innerHTML = "<img src='Images/error.png'>無效日期";
                }
            } else {
                document.getElementById("spDate").innerHTML = "<img src='Images/error.png'>為無效日期格式";
            }
        }

        function isExistDate(dateStr) { // yyyy/mm/dd
            var dateObj = dateStr.split('/');

            //列出12個月，每月最大日期限制
            var limitInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

            var theYear = parseInt(dateObj[0]);
            var theMonth = parseInt(dateObj[1]);
            var theDay = parseInt(dateObj[2]);
            var isLeap = new Date(theYear, 1, 29).getDate() === 29; // 是否為閏年?

            if (isLeap) { // 若為閏年，最大日期限制改為 29
                limitInMonth[1] = 29;
            }

            // 比對該日是否超過每個月份最大日期限制
            return theDay <= limitInMonth[theMonth - 1]
        }

        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("idName").addEventListener("blur", checkName);
            document.getElementById("idPwd").addEventListener("blur", chkPassword);
            document.getElementById("idDate").addEventListener("blur", checkDate);
        });

        function resetf() {
            document.getElementById("spName").innerHTML = "";
            document.getElementById("spPwd").innerHTML = "";
            document.getElementById("spDate").innerHTML = "";
        }

    </script>
</head>

<body>
    <div class="navi">
        <span><a href='homework1 9_9.html'>homework1</a></span>
        <span><a href='homework2.html'>homework2</a></span>
        <span><a href='homework3_self.html'>homework3</a></span>
        <span></span><a href='homework4Prac.html'>homework4</a></span>
    </div>
    <form action="#" method="GET">

        <fieldset>
            <legend>Form check</legend>
            <div class="c1">
                <label>姓名:</label>
                <input type="text" id="idName" value="" size="10" />
                <span id="spName"></span>
                <br />
                <p class="instruction">(1.不可為空白 2.至少2個字以上 3.必須全為中文字)</p>
            </div>
            <div class="c1">
                <label>密碼:</label>
                <input type="password" id="idPwd" value="" size="10" />
                <span id="spPwd"></span>
                <br />
                <p class="instruction">(1.不可為空白 2.至少6個字且需含英文字母,數字,特殊字元[!@#$%^&*])</p>

            </div>
            <div class="c1">
                <label>日期:</label>
                <input type="text" id="idDate" value="" size="10" />
                <span id="spDate"></span>
                <br />
                <p class="instruction">(格式:西元年/月/日 yyyy/MM/dd)</p>
            </div>

            <div class="c2">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset" onclick="resetf()">
            </div>
            <!-- <input type="button" value="checkPassword" onclick="chkPassword();" />     -->
        </fieldset>



    </form>


</body>

</html>