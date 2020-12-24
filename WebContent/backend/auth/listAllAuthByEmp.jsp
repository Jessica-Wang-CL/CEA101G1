<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.auth.model.*"%>
<%
	String emp_id = request.getParameter("emp_id");  
%>

<%
    AuthService authSvc = new AuthService();
    List<AuthVO> list = authSvc.getAllByEmp(emp_id);
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
<jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />

<html>
<head>
<meta charset="UTF-8">
<title>所有權限資料 - listAllAuthByEmp.jsp</title>
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
	width: 800px;
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
		 <h3>所有權限資料 - listAllAuthByEmp.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/auth/selectAuth.jsp">回首頁</a></h4>
	</td></tr>
</table>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>員工編號</th>
		<th>功能編號</th>
		<th>功能名稱</th>
		<th>新增by authVO(emp_id,func_no)都有</th>
	</tr>
	<c:forEach var="authVO" items="${list}">
     <tr>
		<td>${authVO.emp_id}</td>
		<td>${authVO.func_no}</td>
		<td>${funcSvc.getOneFunc(authVO.func_no).func_name}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do" style="margin-bottom: 0px;">
			     <input type="hidden" name="emp_id"  value="${authVO.emp_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>  
  
  <li><a href='<%=request.getContextPath()%>/backend/auth/addAuth.jsp'>Add</a> a new auth.</li>
</body>
</html>