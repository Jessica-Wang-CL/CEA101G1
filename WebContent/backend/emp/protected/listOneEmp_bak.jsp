<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.title.model.*"%>
<%@ page import="com.dept.model.*"%>
<%@ page import="java.sql.*" %>
<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%EmpVO empVO = (EmpVO) request.getAttribute("empVO");%>
<%
	String emp_date = request.getParameter("emp_date");  
%>

<%-- 取出 對應的TitleVO物件--%>
<%
  TitleService titleSvc = new TitleService();
  TitleVO titleVO = titleSvc.getOneTitle(empVO.getTitle_no());
%>

<%-- 取出 對應的DeptVO物件--%>
<%
  DeptService deptSvc = new DeptService();
  DeptVO deptVO = deptSvc.getOneDept(empVO.getDept_no());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料 - listOneEmp.jsp</title>
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
		 <h3>員工資料 - ListOneEmp.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/emp/protected/selectEmp.jsp">回首頁</a></h4>
	</td></tr>
</table>
<table>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>員工帳號</th>
		<th>員工密碼</th>
		<th>員工照片</th>
		<th>員工電話</th>
		<th>員工電子信箱</th>
		<th>員工居住城市</th>
		<th>員工居住鄉鎮</th>
		<th>員工居住地址</th>
		<th>到職日</th>
		<th>員工狀態</th>
		<th>員工職位</th>
		<th>員工部門</th>
		<th>員工權限</th>
	</tr>
	<tr>
		<td><%=empVO.getEmp_id()%></td>
		<td><%=empVO.getEmp_name()%></td>
		<td><%=empVO.getEmp_acc()%></td>
		<td><%=empVO.getEmp_pwd()%></td>
        <td><img src="${pageContext.request.contextPath}/emp/emp.do?emp_id=${empVO.emp_id}&action=getEmpPic"></td>
		<td><%=empVO.getEmp_phone()%></td>
		<td><%=empVO.getEmp_email()%></td>
		<td><%=empVO.getEmp_city()%></td>
		<td><%=empVO.getEmp_town()%></td>
		<td><%=empVO.getEmp_address()%></td>
		<td><%=empVO.getEmp_date()%></td>
		<td><%=empVO.getEmp_status()%></td>
		<td>【<%=titleVO.getTitle()%> 】</td>
		<td>【<%=deptVO.getDept()%> 】</td>
	</tr>
</table>
</body>
</html>