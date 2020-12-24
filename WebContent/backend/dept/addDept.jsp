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
<title>部門資料新增 - addDept.jsp</title>
</head>
<body>

<h3>部門資料新增:</h3>

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
		<td>部門編號:</td>
		<td><input type="TEXT" name="dept_no" size="45" /></td>
	</tr>
	<tr>
		<td>部門:</td>
		<td><input type="TEXT" name="dept" size="45"/></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>


</body>
</html>