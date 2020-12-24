<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>


<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料修改 - update_emp_input.jsp</title>
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
  td{
  width:150px;
  }
</style>


</head>
<body>
<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_emp_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/emp/protected/selectEmp.jsp">回首頁</a></h4>
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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>員工編號:<font color=red><b>*</b></font></td>
		<td><%=empVO.getEmp_id()%></td>
	</tr>
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="emp_name" size="45" value="${empVO.emp_name}" /></td>
	</tr>
	<tr>
		<td>員工帳號:</td>
		<td><input type="TEXT" name="emp_acc" size="45" value="${empVO.emp_acc}" /></td>
	</tr>
	<tr>
		<td>員工密碼:</td>
		<td><input type="password" name="emp_pwd" size="45" value="${empVO.emp_pwd}" /></td>
	</tr>
	<tr>
		<td>員工電話:</td>
		<td><input type="TEXT" name="emp_phone" size="45" value="${empVO.emp_phone}" /></td>
	</tr>
	<tr>
		<td>員工電子信箱:</td>
		<td><input type="TEXT" name="emp_email" size="45" value="${empVO.emp_email}" /></td>
	</tr>
	<tr>
		<td>員工居住城市:</td>
		<td><input type="TEXT" name="emp_city" size="45" value="${empVO.emp_city}" /></td>
	</tr>
	<tr>
		<td>員工居住鄉鎮:</td>
		<td><input type="TEXT" name="emp_town" size="45" value="${empVO.emp_town}" /></td>
	</tr>
	<tr>
		<td>員工居住地址:</td>
		<td><input type="TEXT" name="emp_address" size="45" value="${empVO.emp_address}" /></td>
	</tr>
	<tr>
		<td>員工狀態:</td>
		<td><input type="radio" name="emp_status" id="emp" size="45" value="0"/><label for="emp" >未啟用
		    <input type="radio" name="emp_status" id="emp" size="45" value="1"/><label for="emp" >已啟用
		    <input type="radio" name="emp_status" id="emp" size="45" value="2"/><label for="emp" >已離職
		</td>
	</tr>
<jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
	<tr>
		<td>員工職位:</td>
		<td><select size ="1" name="title_no">
	        <c:forEach var="titleVO" items="${titleSvc.all}">
				<option value="${titleVO.title_no}" ${(empVO.title_no==titleVO.title_no)?'selected':'' } >${titleVO.title}
			</c:forEach>
		</select></td>
	</tr>
<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
	<tr>
		<td>員工部門:</td>
		<td><select size="1" name="dept_no">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.dept_no}" ${(empVO.dept_no==deptVO.dept_no)?'selected':'' } >${deptVO.dept}
			</c:forEach>
		</select></td>
	</tr>
<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />
	<tr> 
	   <td>員工權限:</td>
	   <td>
	       <c:forEach var="funcVO" items="${funcSvc.all}" > 
          <input type="checkbox" value="${funcVO.func_no}" name="function">${funcVO.func_no} ${funcVO.func_name}    
         </c:forEach> 
	   </td>
	</tr>
	<tr>
		<td>員工照片:</td>
		<td><input type="file" name="emp_pic" size="45" value="${empVO.emp_pic}" /></td>

	</tr>
	</table>
	<br>

<input type="hidden" name="action" value="update">
<input type="hidden" name="emp_id" value="${empVO.emp_id}">
<input type="hidden" name="emp_date" value="${empVO.emp_date}">
<input type="submit" value="送出修改"></FORM>
</body>
</html>