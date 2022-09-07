<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 수정</title>
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
		margin-left:auto; background-color:#bbb; margin-bottom:0;
		align:right; font-size: 15px;
		font-weight: bold;
		text-align:center; cursor: pointer; color:#333; 
		transition:all 0.9s, color 0.3; } 
		.btn:hover{color:#fff;}
		.hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; }
#form{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
    </style>
</head>
<body bgcolor="#DDD">
    <div id="header">
        <h1>회원 정보 수정</h1>
    </div>
        <%
        request.setCharacterEncoding("UTF-8");
        String memid=request.getParameter("memid");
        %>
    <div id="form">
	<form name="form1" method="post" action="member_edit.jsp?memid=<%=memid%>">
		<table>
			<tr>
				<td width ="169" align="left" class="edit1" scope="col">ID</td>
				<td width ="517" scope="col"> 
					<input type="text" name ="id" id="id">
				</td>
			</tr>
			<tr>
				<td width ="169" align="left" class="edit1" scope="col">비밀번호</td>
				<td width ="517" scope="col"> 
					<input type="text" name ="pw" id="pw">
				</td>
			</tr>
			<tr>
				<td width ="169" align="left" class="edit1" scope="col">이름</td>
				<td width ="517" scope="col"> 
					<input type="text" name ="name" id="name">
				</td>
			</tr>
			<tr>
				<td width ="169" align="left" class="edit1" scope="col">차종</td>
				<td width ="517" scope="col"> 
					<input type="text" name ="cartype" id="cartype">
				</td>
			</tr>
			<tr>
				<td width ="169" align="left" class="edit1" scope="col">차량번호</td>
				<td width ="517" scope="col"> 
					<input type="text" name ="carnumber" id="carnumber">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="edit1"> <input type="submit" value="회원 정보 수정"></td></tr>			
		</table>		
	</form>
	</div>
    <div id ="button">
	    <button class="btn hover1" onclick="location.href='start.html' ">처음 화면으로 </button>
    </div>
</body>
</html>