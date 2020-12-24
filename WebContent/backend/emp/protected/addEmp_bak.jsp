<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>員工資料新增 - addEmp.jsp</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">

</head>
<body>

<a href="<%=request.getContextPath()%>/backend/emp/protected/selectEmp.jsp">回首頁</a>
  
                                        <h4>員工資料新增表 AddEmp.jsp</h4>
               <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>




<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
	    <td>員工姓名:</td>
		<td><input type="TEXT" name="emp_name" size="45" 
			 value="<%= (empVO==null)? "王大明" : empVO.getEmp_name()%>" /></td>
	</tr>
	<tr>
		<td>員工帳號:</td>
		<td><input type="TEXT" name="emp_acc" size="45"
			 value="<%= (empVO==null)? "EMP00010" : empVO.getEmp_acc()%>" /></td>
	</tr>
	 <tr>
		<td>員工密碼:</td>
		<td><input type="TEXT" name="emp_pwd" size="45"
			 value="<%= (empVO==null)? "12345" : empVO.getEmp_pwd()%>" /></td>
	</tr>
	<tr>
		<td>員工電話:</td>
		<td><input type="TEXT" name="emp_phone" size="45"
			 value="<%= (empVO==null)? "0933799899" : empVO.getEmp_phone()%>" /></td>
	</tr>	
	<tr>
		<td>員工電子郵件:</td>
		<td><input type="TEXT" name="emp_email" size="45"
			 value="<%= (empVO==null)? "123@gmail.com" : empVO.getEmp_email()%>" /></td>
	</tr>
	<tr>
		<td>員工居住城市:</td>
		<td><input type="TEXT" name="emp_city" size="45"
			 value="<%= (empVO==null)? "台北" : empVO.getEmp_city()%>" /></td>
	</tr>
	<tr>
		<td>員工居住城鎮:</td>
		<td><input type="TEXT" name="emp_town" size="45"
			 value="<%= (empVO==null)? "台北" : empVO.getEmp_town()%>" /></td>
	</tr>
	<tr>
		<td>員工居住地址:</td>
		<td><input type="TEXT" name="emp_address" size="45"
			 value="<%= (empVO==null)? "台北" : empVO.getEmp_address()%>" /></td>
	</tr>
	<tr>
		<td>員工狀態:</td>
		<td><input type="text" name="emp_status" id="emp"
			 value="<%= (empVO==null)? "0" : empVO.getEmp_status()%>" /></td>
	</tr>
	<jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
	<tr>
		<td>員工職位:<font color=red><b>*</b></font></td>
		<td><select size="1" name="title_no">
			<c:forEach var="titleVO" items="${titleSvc.all}">
				<option value="${titleVO.title_no}" ${(empVO.title_no==titleVO.title_no)? 'selected':'' } >${titleVO.title}
			</c:forEach>
		</select></td>
	</tr>
	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
	<tr>
		<td>部門:<font color=red><b>*</b></font></td>
		<td><select size="1" name="dept_no">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.dept_no}" ${(empVO.dept_no==deptVO.dept_no)? 'selected':'' } >${deptVO.dept}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
	<td>照片</td>
	<td><input type="file" name="emp_pic" 
			 value="<%= (empVO==null)? "null" : empVO.getEmp_pic()%>" /></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
<!-- /////////////////////////////////////////////////////////////////////////////////// -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" /></script>
</body>
<% 
  java.sql.Date emp_date = null;
  try {
	  emp_date = empVO.getEmp_date();
   } catch (Exception e) {
	   emp_date = new java.sql.Date(System.currentTimeMillis());
   }
%>
</html>