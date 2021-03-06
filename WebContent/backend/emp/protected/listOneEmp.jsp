<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.title.model.*"%>
<%@ page import="com.dept.model.*"%>
<%@ page import="com.func.model.*"%>
<%@ page import="com.auth.model.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
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
<%-- 取出 對應的AuthVO物件--%>
<%
   String emp_id = request.getParameter("emp_id");
   AuthService authSvc = new AuthService();
   List<AuthVO> list = authSvc.getAllByEmp(emp_id);
   pageContext.setAttribute("list",list);
%>

<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>員工資料 - listOneEmp.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/listOneEmp.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div>
   <div>
      <div>
         <div class="card" style="width:30rem;">
            <button class="btn"><i class="fa fa-home">
              <a href="<%=request.getContextPath()%>/backend/emp/protected/listAllEmp.jsp"> Back</a></i></button>
                 <div class="listOne">
                   <div class="left">
                     <img src="${pageContext.request.contextPath}/emp/emp.do?emp_id=${empVO.emp_id}&action=getEmpPic">
                        <h3 class="mt-2"><%=empVO.getEmp_name()%></h3>
                        <h5 class="mt-1 clearfix"><%=empVO.getEmp_id()%></h5>
                        <h4 class="mt-1 clearfix"><%=titleVO.getTitle()%></h4>
                        <h4 class="mt-1 clearfix"> <%=deptVO.getDept()%>  </h4>
                        <span class="mt-4"><%=empVO.getEmp_city()%><%=empVO.getEmp_town()%><%=empVO.getEmp_address()%></span>
                        <div class="button">
                            <button class="neo-button"><i class="fa fa-check-circle fa-2x"></i></button>
                            <button class="neo-button"><i class="fa fa-mobile fa-2x"></i></button>
                            <button class="neo-button"><i class="fa fa-google fa-2x" ></i></button>
                         </div>
                         <div>
                             <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
 		                     <input type="submit" class="btn btn-primary" style="width:250px" value="修改" > 
		                     <input type="hidden" name="emp_id" value="${empVO.emp_id}">
		                     <input type="hidden" name="action" value="getOne_For_Update"></FORM>    
                         </div>
                        <div class="bottom"><%=empVO.getEmp_date()%></div>
                        </div>
                           <div class="right">
                                    <div class="checkbox">
                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do">                        
                                       <c:forEach var="authVO" items="${list}">
                                          <div>
		                                      <td>${authVO.func_no}</td>
		                                      <td>${funcSvc.getOneFunc(authVO.func_no).func_name}</td>	      
		                                  </div>
	                                    </c:forEach>

			                              <input type="hidden" name="emp_id"  value="${empVO.emp_id}">
			                              <input type="hidden" name="action"  value="getOne_For_Update"> 
	                                   </FORM>
                                    </div>
                                </div>
                            </div>  
                        </div>
                    </div> 
                 </div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>