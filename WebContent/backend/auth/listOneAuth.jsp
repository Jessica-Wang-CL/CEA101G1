<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.auth.model.*"%>
<!DOCTYPE html>
<%
  AuthVO authVO = (AuthVO) request.getAttribute("authVO"); 
%>

<html>
<head>
<meta charset="UTF-8">
<title>權限資料 - listOneAuth.jsp</title>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
  
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body>

<table id="table-1">
	<tr><td>
		 <h3>權限資料 - ListOneAuth.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/auth/selectAuth.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>員工編號</th>
		<th>功能名稱</th>
	</tr>
	<tr>
		<td><%=authVO.getEmp_id()%></td>
		<td><%=authVO.getFunc_no()%></td>
	</tr>
</table>

</body>
</html>