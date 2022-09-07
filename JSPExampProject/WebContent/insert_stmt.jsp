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
<title>회원 가입</title>
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

	request.setCharacterEncoding("utf-8");
	String memid = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String cartype = request.getParameter("cartype");
	String carnumber = request.getParameter("carnumber");	
	
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url,id,pwd);
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyyMMdd");
	String formatedNow=now.format(formatter);
	String sql = String.format("insert into memberinfo values('%s','%s','%s',NULL,'%s','%s')", memid, pw, name, cartype, carnumber);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("use park");
	String sql2 = "Select * from memberinfo where memberID='"+memid+"'";
	ResultSet rs = stmt.executeQuery(sql2);
	if(rs.next()){ //검색된 결과가 존재하면 true
		//이미 있는 id이므로 돌아간다.
		%>
		<a href="member_join.html?memid=<%=memid%>">이미 존재하는 ID입니다.</a>
		<% 
	}
	else{
	int r = stmt.executeUpdate(sql);
	stmt.execute("update memberinfo set expirydate = date_add(str_to_date('"+formatedNow+"','%Y%m%d'), interval 1 month) where memberID='"+memid+"'");	
	if(r==1){
	%><a href="member_start.html">회원 가입이 완료되었습니다.</a>
	<% 
	}
	}
	stmt.close();
	conn.close();
%>
    <div id ="button">
	    <button class="btn hover1" onclick="location.href='start.html' ">처음 화면으로 </button>
    </div>
</body>
</html>