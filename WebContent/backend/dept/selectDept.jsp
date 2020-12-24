<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IBM_DEPT:Home</title>
<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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
</style>
<body bgcolor='white'>
</head>

<table id="table-1">
   <tr><td><h3>IBM DEPT: Home</h3><h4>( MVC )</h4></td></tr>
</table>
<p>This is the Home page for IBM DEPT: Home</p>

<h3>資料查詢:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllDept.jsp'>List</a> all Depts.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" >
        <b>輸入部門編號 (如70):</b>
        <input type="text" name="dept_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
  <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
  
    <li>
       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" >
       <b>選擇部門編號:</b>
       <select size="1" name="dept_no">
         <c:forEach var="deptVO" items="${deptSvc.all}" > 
          <option value="${deptVO.dept_no}">${deptVO.dept_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" >
       <b>選擇部門名稱:</b>
       <select size="1" name="dept_no">
         <c:forEach var="deptVO" items="${deptSvc.all}" > 
          <option value="${deptVO.dept_no}">${deptVO.dept}</option>
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
  <h3>部門管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/dept/addDept.jsp'>Add</a> a new dept.</li>
</ul>
<body>

</body>
</html>