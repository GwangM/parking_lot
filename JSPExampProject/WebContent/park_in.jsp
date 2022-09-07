<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;        
        }
        *{
            background-color: #ccc;
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
            width: 30%;
            height: 80px;
            text-align: center;
            line-height: 80px;
            color:#000;
            font-size: 25px;
            position: absolute;
    		top: 50%;
   	 		left: 50%;
    		transform: translate(-50%, -50%);
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
    </style>

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = DBconn.getConnection();	
	Statement st = conn.createStatement();
	st.executeUpdate("use park");
	ResultSet rs = st.executeQuery("select * from parkinglot");
	rs.next();
	int used = rs.getInt("used");
	int total= rs.getInt("total");
	if (used==total){//만원이면 반려
		%>	
	<div id="footer">
            <a href="park_start.html"> 만원입니다. </a>
    </div>	
		<%
	}else{
			String temp=request.getParameter("carnumber");
			rs=st.executeQuery("select * from memberinfo where carnumber='"+temp+"'");
		if(rs.next()){//회원일 때, 현재 이용공간 1 증가, 현재 시간 기록
			st.execute("update parkinglot set used=used+1");
			st.execute("insert into nowuser values('"+temp+"',now())");
			%>	
			<div id="footer">
		            <a href="park_start.html">입차되었습니다.</a>
		    </div>	
				<%
		}else{//회원이 아닐 때
			%>	
			<div id="footer">
		            <a href="park_start.html">회원이 아닙니다.</a>
		    </div>	
				<%
		}
	}
	rs.close();
	st.close();
	DBconn.close();	
%>
</body>
</html>