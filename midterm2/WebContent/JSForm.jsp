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
                document.getElementById("spName").innerHTML = "<img src='/res/error.png'>���i���ť�";
            } else if (getName.length < 2) {
                document.getElementById("spName").innerHTML = "<img src='/res/error.png'>�ݤj��2�Ӥ���r";

            } else if (re.test(getName)) {
                document.getElementById("spName").innerHTML = "<img src='/res/check1.png'>���T";

            } else {
                document.getElementById("spName").innerHTML = "<img src='/res/error.png'>�ݬ�������";

            }
        }

        function reset_checkName() {
            document.getElementById("spName").innerHTML = "";
        }


        function chkPassword() {
            //���o������
            let getPwd = document.getElementById("idPwd").value;
            let thePwdLen = getPwd.length;
            //�]��regEx���b�@�_�����ǩ�,�G���}�����}����
            let re1 = /[a-zA-Z]+/;
            let re2 = /[0-9]+/;
            let re3 = /[!@#$%^&*]+/;
            if (getPwd == "") {
                document.getElementById("spPwd").innerHTML = "<img src='Images/error.png'>���i���ť�";
            } else if (thePwdLen < 6) {
                document.getElementById("spPwd").innerHTML = "<img src='Images/error.png'>�ݤj��6�Ӧr��";

            } else if (re3.test(getPwd)) {
                document.getElementById("spPwd").innerHTML = "<img src='Images/check1.png'>���T";


            } else if (re1.test(getPwd) && re2.test(getPwd) && re3.test(getPwd)) {
                document.getElementById("spPwd").innerHTML = "<img src='Images/check1.png'>���T";


            } else {
                document.getElementById("spPwd").innerHTML = "<img src='Images/error.png'>�ܤ�6�Ӧr�B�ݧt�^��r��,�Ʀr,�S��r��[!@#$%^&*]";
            }
        }

        function checkDate() {
            let getDate = document.getElementById("idDate").value;
            let re = /^\d{4}\/\d{1,2}\/\d{1,2}$/;

            if (getDate == "") {
                document.getElementById("spDate").innerHTML = "<img src='Images/error.png'>���i���ť�";
            } else if (re.test(getDate)) {

                if (isExistDate(getDate)) {
                    document.getElementById("spDate").innerHTML = "<img src='Images/check1.png'>�������";

                } else {
                    document.getElementById("spDate").innerHTML = "<img src='Images/error.png'>�L�Ĥ��";
                }
            } else {
                document.getElementById("spDate").innerHTML = "<img src='Images/error.png'>���L�Ĥ���榡";
            }
        }

        function isExistDate(dateStr) { // yyyy/mm/dd
            var dateObj = dateStr.split('/');

            //�C�X12�Ӥ�A�C��̤j�������
            var limitInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

            var theYear = parseInt(dateObj[0]);
            var theMonth = parseInt(dateObj[1]);
            var theDay = parseInt(dateObj[2]);
            var isLeap = new Date(theYear, 1, 29).getDate() === 29; // �O�_���|�~?

            if (isLeap) { // �Y���|�~�A�̤j�������אּ 29
                limitInMonth[1] = 29;
            }

            // ���Ӥ�O�_�W�L�C�Ӥ���̤j�������
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
                <label>�m�W:</label>
                <input type="text" id="idName" value="" size="10" />
                <span id="spName"></span>
                <br />
                <p class="instruction">(1.���i���ť� 2.�ܤ�2�Ӧr�H�W 3.������������r)</p>
            </div>
            <div class="c1">
                <label>�K�X:</label>
                <input type="password" id="idPwd" value="" size="10" />
                <span id="spPwd"></span>
                <br />
                <p class="instruction">(1.���i���ť� 2.�ܤ�6�Ӧr�B�ݧt�^��r��,�Ʀr,�S��r��[!@#$%^&*])</p>

            </div>
            <div class="c1">
                <label>���:</label>
                <input type="text" id="idDate" value="" size="10" />
                <span id="spDate"></span>
                <br />
                <p class="instruction">(�榡:�褸�~/��/�� yyyy/MM/dd)</p>
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