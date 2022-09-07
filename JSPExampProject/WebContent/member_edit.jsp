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
<title>회원 정보 수정</title>
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
	String memid = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String cartype = request.getParameter("cartype");
	String carnumber = request.getParameter("carnumber");	
	
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(url,id,pwd);
	
	String sql = String.format("update memberinfo set memberID='%s', memberpw='%s', membername='%s', cartype='%s',carnumber='%s' where memberID='"+tempid+"'", memid, pw, name, cartype, carnumber);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("use park");

	String sql2 = "Select * from memberinfo where memberID='"+memid+"'";
	ResultSet rs = stmt.executeQuery(sql2);
	if(rs.next()){ //검색된 결과가 존재하면 true
		%><a href="edit_form.jsp?memid=<%=tempid%>">이미 존재하는 ID입니다.</a>
		<% 
	}
	else{
		stmt.executeUpdate(sql);
	%><a href="member_start.html">회원 정보 수정이 완료되었습니다.</a>
	<% 
	}
	
	stmt.close();
	conn.close();
%>
    <div id ="button">
	    <button class="btn hover1" onclick="location.href='start.html' ">처음 화면으로 </button>
    </div>
</body>
</html>