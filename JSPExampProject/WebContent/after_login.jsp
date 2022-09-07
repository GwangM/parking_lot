<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>my page</title>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;        
        }
        #header,#footer{
            background-color: #ccc;
            height: 280px;
        }
        #header>h1{
            text-align: center;
            padding-top:50px; 
        }
        a{
            text-decoration: none;
        }
        #footer {margin:0 auto; text-align:center;}
        #footer li{
            display: inline-block;
            width: 22%;
            margin: 0px 3px;
        }
        #footer a{
            display: inline-block;
            background-color: #bbb;
            width: 100%;
            height: 80px;
            text-align: center;
            line-height: 80px;
            color:#000;
            font-size: 25px;
        }
		.btn { display:block; width:200px; height:40px;
		line-height:40px; border:1px #000 solid;; 
		margin-left:auto; background-color:#bbb;
		align:right; font-size: 15px; font-weight: bold;
		text-align:center; cursor: pointer; color:#333; 
		transition:all 0.9s, color 0.3; } 
		.btn:hover{color:#fff;}
		.hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; }
    </style>
</head>
<body>
        <%
        request.setCharacterEncoding("UTF-8");
        String memid=request.getParameter("memid");
        %>
    <div id="header">
        <h1>회원 정보 관리</h1>
    </div>
    <div id="footer">
        <ul>
            <li><a href="edit_form.jsp?memid=<%=memid%>">회원 정보 수정</a></li>
            <li><a href="update_stmt.jsp?memid=<%=memid%>">회원 기간 갱신</a></li>
            <li><a href="delete_stmt.jsp?memid=<%=memid%>" onclick="return confirm('정말로 탈퇴하시겠습니까?');">회원 탈퇴</a></li>
            <li><a href="member_start.html">로그아웃</a></li>
        </ul>
    </div>
    <div id ="button">
	    <button class="btn hover1" onclick="location.href='start.html' ">처음 화면으로 </button>
    </div>
</body>
</html>
