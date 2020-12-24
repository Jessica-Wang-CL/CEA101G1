<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auth.model.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.func.model.*"%>
<%@ page import="java.util.*"%>

<%
  AuthVO authVO = (AuthVO) request.getAttribute("authVO");
  String emp_id = request.getParameter("emp_id");
  AuthService authSvc = new AuthService();
  List<AuthVO> list = authSvc.getAll();
  pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>權限資料新增 - addAuth.jsp</title>

</head>
<body>

<table id="table-1">
	<tr><td>
		 <h3>權限資料新增 - addAuth.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/backend/emp//protected/listAllEmp.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>權限資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do" name="form1">
<table>
	<tr>
		<td>員工編號:</td>

		<td><input type="TEXT" name="emp_id" size="45" /></td>
	</tr>
		<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />	

	
	   <tr><td>權限:</td><td>
    <jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />    
         <c:forEach var="funcVO" items="${funcSvc.all}" > 
          <input type="checkbox" value="${funcVO.func_no}" name="function">${funcVO.func_no} ${funcVO.func_name}
           
         </c:forEach>   

       </td>
       </tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>


</body>
</html>