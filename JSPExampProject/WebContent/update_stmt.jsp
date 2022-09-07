<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 기간 갱신 완료</title>
    <style type="text/css">
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

	String driverName="com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306";
	String id = "test1111";
	String pwd ="test1111";

	request.setCharacterEncoding("UTF-8");
	String tempid=request.getParameter("memid");
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyyMMdd");
	String formatedNow=now.format(formatter);
	
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url,id,pwd);
	
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("use park");
	stmt.execute("update memberinfo set expirydate = date_add(str_to_date('"+formatedNow+"','%Y%m%d'), interval 1 month) where memberID='"+tempid+"'");
	
	%><a href="after_login.jsp?memid=<%=tempid%>">회원 기간 갱신이 완료되었습니다.</a><% 
	
	stmt.close();
	conn.close();
%>
    <div id ="button">
	    <button class="btn hover1" onclick="location.href='start.html' ">처음 화면으로 </button>
    </div>
</body>
</html>