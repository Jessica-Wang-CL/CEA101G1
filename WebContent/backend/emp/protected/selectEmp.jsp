<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IBM Emp: Home</title>
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
</head>
<body>
<table id="table-1">
   <tr><td><h3>IBM Emp: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/backend/emp/protected/listAllEmp.jsp'>List></a> all Emps.  <br><br></li>
  <li><a href='<%=request.getContextPath()%>/backend/func/listAllFunc.jsp'>List</a> all Func.  <br><br></li>
  <li><a href='<%=request.getContextPath()%>/backend/dept/listAllDept.jsp'>List</a> all Depts.  <br><br></li>
  <li><a href='<%=request.getContextPath()%>/backend/title/listAllTitle.jsp'>List</a> all Titles.  <br><br></li>
</ul>
<ul>   
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
        <b>輸入員工編號 (如EMP0000001):</b>
        <input type="text" name="emp_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
       <b>選擇員工編號:</b>
       <select size="1" name="emp_id">
         <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.emp_id}">${empVO.emp_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
       <b>選擇員工姓名:</b>
       <select size="1" name="emp_id">
         <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.emp_id}">${empVO.emp_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
   <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
       <b>選擇部門:</b>
       <select size="1" name="dept_no">
         <c:forEach var="deptVO" items="${deptSvc.all}" > 
          <option value="${deptVO.dept_no}">${deptVO.dept_no} ${deptVO.dept}
         </c:forEach>   
       </select>
        <input type="hidden" name="action" value="getAllByDept">
       <input type="submit" value="送出">
    </FORM>
  </li> 
     <jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
       <b>選擇職稱:</b>
       <select size="1" name="title_no">
         <c:forEach var="titleVO" items="${titleSvc.all}" > 
          <option value="${titleVO.title_no}">${titleVO.title_no} ${titleVO.title}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOneByTitle">
       <input type="submit" value="送出">
    </FORM>
  </li> 
      <jsp:useBean id="authSvc" scope="page" class="com.auth.model.AuthService" />
      <jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do" >
       <b>選擇權限:</b>
       <select size="1" name="func_no">
         <c:forEach var="funcVO" items="${funcSvc.all}" > 
          <option value="${funcVO.func_no}">${funcVO.func_no} ${funcVO.func_name}</option>
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOneByFunc">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
<h3>員工管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/emp/protected/addEmp.jsp'>Add</a> a new Emp.</li>
  <li><a href='<%=request.getContextPath()%>/backend/auth/addAuth.jsp'>Add</a> a new Auth.</li>
  <li><a href='<%=request.getContextPath()%>/backend/func/addFunc.jsp'>Add</a> a new Func.</li>
  <li><a href='<%=request.getContextPath()%>/backend/title/AddTitle.jsp'>Add</a> a new title.</li>
  <li><a href='<%=request.getContextPath()%>/backend/dept/addDept.jsp'>Add</a> a new Dept.</li>
</ul>

</body>
</html>