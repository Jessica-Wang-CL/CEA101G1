<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dept.model.*"%>

<%
  DeptVO deptVO = (DeptVO) request.getAttribute("deptVO"); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>部門資料修改 - update_dept_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>部門資料修改 - update_dept_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/dept/selectDept.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" name="form1">
<table>
	<tr>
		<td>部門編號:<font color=red><b>*</b></font></td>
		<td><%=deptVO.getDept_no()%></td>
	</tr>
	<tr>
		<td>部門名稱:</td>
		<td><input type="TEXT" name="dept" size="45" value="<%=deptVO.getDept()%>" /></td>
	</tr>


</table>

<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="dept_no" value="<%=deptVO.getDept_no()%>">
<input type="submit" value="送出修改">
</FORM>
</body>
</html>