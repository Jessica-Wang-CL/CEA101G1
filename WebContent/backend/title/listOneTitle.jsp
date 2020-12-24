<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.title.model.*"%>
<!DOCTYPE html>
<%
  TitleVO titleVO = (TitleVO) request.getAttribute("titleVO"); 
%>

<html>
<head>
<meta charset="UTF-8">
<title>職位資料 - listOneTitle.jsp</title>
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
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>職位資料 - ListOneTitle.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/title/selectTitle.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>職位編號</th>
		<th>職位名稱</th>
	</tr>
		<tr>
		<td><%=titleVO.getTitle_no()%></td>
		<td><%=titleVO.getTitle()%></td>
	</tr>
</table>

</body>
</html>