<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }		    
 
    </style>

</head>
<body>
<%
	
	String memid=request.getParameter("id");
	String pw=request.getParameter("pw");
	Connection conn = DBconn.getConnection();	
	Statement st = conn.createStatement();
	st.executeUpdate("use park");
	String sql = "Select * from memberinfo";
	ResultSet rs = st.executeQuery(sql);

	 %> <table>
      <thead>
        <tr>
          <th>ID</th><th>비밀번호</th><th>이름</th><th>기간 만료일</th><th>차종</th><th>차량번호</th>
        </tr>
      </thead>
      <tbody><% 

	while(rs.next()){ //검색된 결과가 존재하면 true
     %>   <tr>
        <td><%=rs.getString("memberID")%></td><td><%=rs.getString("memberpw")%></td><td><%=rs.getString("membername")%></td>
        <td><%=rs.getDate("expirydate")%></td><td><%=rs.getString("cartype")%></td><td><%=rs.getString("carnumber")%></td>
      </tr><% 
	}
	
   %> </tbody>
  </table>
	<div id="footer">
        <a href="manager_inter.html">확인되었습니다.</a></div>	<%
	rs.close();
	st.close();
	DBconn.close();	
%>
</body>
</html>