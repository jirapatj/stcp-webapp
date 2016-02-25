<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <style type="text/css">
        /*body{  
    margin:0;  
    padding:0;    
    font-family:Tahoma, Geneva, sans-serif;  
    font-size:12px;  
}*/
        div#i_containTab {
            position: relative;
            display: block;
            width: 540px; /* กำหนดความกว้างทั้งหมด   */
            border: 1px solid #CCC;
        }

        ul#navi_containTab {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
            background-color: #FCF;
        }

            ul#navi_containTab li {
                display: block;
                float: left;
                height: 30px;
                width: 100px; /* กำหนดความกว้างทั้งหมด  หารด้วยจำนวนเมนูแท็บ  */
                border: 0px solid #CCC;
                line-height: 25px;
                cursor: pointer;
                text-align: center;
                /*border:1px solid black;*/
            }
        /* class รูปแบบของแต่ละเมนู */
        .tabNavi1 {
            background-color: #CEF6F5;
        }

        .tabNavi2 {
            background-color: #F2E0F7;
        }



        ul#detail_containTab {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
        }

            ul#detail_containTab li {
                float: left;
                width: 100%;
                height: 150px;
            }
        /* class รูปแบบของแต่ละเนื้อหา */
        .detailContent1 {
            background-color: white;
            border: 1px solid black;
            display: block;
        }

        .detailContent2 {
            background-color: white;
            border: 1px solid black;
            display: none;
        }
    </style>


</head>
<body>
    <!-- <div style="width: 100%; height: 100px">Header</div> -->
    <div style="float: left; width: 20%; margin-left: 10px">
        <input name="txt1" type="text"><input name="btnSubmit1" type="submit" value="Search">
        <br>
        <select id="subjectListID" name="sometext" size="5" style="width: 210px;height:180px" ondblclick="dblSubject()">
            <option id="SWE601">SWE601</option>
            <option id="SWE602">SWE602</option>
            <option id="SWE603">SWE603</option>
            <option id="SWE604">SWE604</option>
            <option id="SWE605">SWE605</option>
        </select>
    </div>
    <div style="float: left; width: 70%">
        <select style="width: 100px">
            <option value="1">ปี1</option>
            <option value="2">ปี2</option>
            <option value="3">ปี3</option>
            <option value="4">ปี4</option>
        </select>
        <button onclick="reset()">Reset</button>
        <br>


        <div>
            <ul id="navi_containTab" onclick="clickTab()">
                <li class="tabNavi1">เทอม 1</li>
                <li class="tabNavi2">เทอม 2</li>

            </ul>
            <ul id="detail_containTab">
                <li class="detailContent1">
                    <div id="tab1"> </div>
                </li>
                <li class="detailContent2">
                    <div id="tab2"> </div>
                </li>
            </ul>
        </div>



    </div>

    <script>

        term =  "0",

        function reset() {
            alert(1);
            tab1.innerHTML = "";
            tab2.innerHTML = "";
        }

        function clickTab() {
            var listt = document.getElementById('navi_containTab');
            //alert(listt.childNodes.toString);
        }

        function dblSubject() {
            var subject = subjectListID.value;
            
            
            var div = document.createElement("div");
            div.innerHTML = subject;
            if (term == 0) {
                tab1.appendChild(div);
            } else {
                tab2.appendChild(div);
            }

            document.getElementById(subject).disabled = true;

            //var btnDelete = document.createElement("BUTTON");
            //var t = document.createTextNode("CLICK ME");
            //btnDelete.appendChild(t);
            //tab1.appendChild(btnDelete);

        }

        function btnDelete_Click() {
            alert("ddd");
        }


        $("ul#navi_containTab > li").click(function (event) {
            //alert(1);
            var menuIndex = $(this).index();           
            term = menuIndex.toString();

            $("ul#detail_containTab > li:visible").hide();
            $("ul#detail_containTab > li").eq(menuIndex).show();
        });
    </script>
</body>
</html>