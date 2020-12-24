<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>


<%
    EmpService empSvc = new EmpService();
    List<EmpVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
<jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
<jsp:useBean id="authSvc" scope="page" class="com.auth.model.AuthService" />
<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>所有員工資料 - listAllEmp.jsp</title>

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
  img {
  width:50px;
  height: auto;
  }
</style>
</head>
<body>

<table id="table-1">

	<tr><td>
		 <h3>所有員工資料 - listAllEmp.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/emp/protected/selectEmp.jsp">回首頁</a></h4>
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

<table class ="table table-striped">
<thead class=".thread-dark">
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>員工狀態</th>
		<th>員工職位</th>
		<th>員工部門</th>
		<th>員工權限編號</th>
		<th>到職日</th>
		<th>查詢</th>
		<th>修改</th>
	</tr>
		<%@ include file="pages/page1" %> 
<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<tr>
	    <td>${empVO.emp_id}</td>
		<td>${empVO.emp_name}</td>
		<td>
			<c:choose>
		<c:when test="${empVO.emp_status.equals('0')}">未啟用</c:when>
		<c:when test="${empVO.emp_status.equals('1')}">已啟用</c:when>
		<c:when test="${empVO.emp_status.equals('2')}">已離職</c:when>
		<c:otherwise>狀態異常, 聯繫IT</c:otherwise>
			</c:choose></td>
		<td>${titleSvc.getOneTitle(empVO.title_no).title}</td>
			<td>
		<c:forEach var="deptVO" items="${deptSvc.all}">
            <c:if test="${empVO.dept_no==deptVO.dept_no}">
	            ${deptVO.dept_no}【${deptVO.dept}】
             </c:if>
          </c:forEach>
		</td>
	    <td>${funcSvc.getOneFunc(authSvc.getOneAuth(empVO.emp_id).func_no).func_name}</td>			
		<td>${empVO.emp_date}</td>
	   <td>
	    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;">
		    <input type="submit" value="More">
		    <input type="hidden" name="emp_id"  value="${empVO.emp_id}">
		    <input type="hidden" name="action"	value="getOne_For_Display"></FORM>
	    </td>
	   <td>
	    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;">
		    <input type="submit" value="Update">
		    <input type="hidden" name="emp_id"  value="${empVO.emp_id}">
		    <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
	    </td>
	 </tr>
</c:forEach>
</thead >
</table>
<%@ include file="pages/page2" %>
	
</body>
</html>