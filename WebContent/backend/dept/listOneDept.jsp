<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dept.model.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
  DeptVO deptVO = (DeptVO) request.getAttribute("deptVO"); 
%>
<%
    EmpService empSvc = new EmpService();
    List<EmpVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<meta charset="UTF-8">
<title>部門資料 - listOneDept.jsp</title>
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
		 <h3>部門資料 - ListOneDept.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/dept/selectDept.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>部門編號</th>
		<th>部門名稱</th>
	</tr>
		<tr>
		<td><%=deptVO.getDept_no()%></td>
		<td><%=deptVO.getDept()%></td>
	</tr>
</table>


</body>
</html>