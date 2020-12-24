<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>
<html>
    <head>
        <title>loginEmp</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginEmp.css" />
 
    </head>

    <body>
        <div class="container">
            <div class="form form--login">
                <div class="form--heading">Welcome back!</div>
                <form autocomplete="off"  method="post" action="<%=request.getContextPath()%>/emp/login.do">
                    <input type="text" placeholder="Account" name="emp_acc"/>
                    <input type="password" placeholder="Password" name="emp_pwd">
                    <button class="button">Login</button>
                </form>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="MB_login.js"></script>
    </body>
</html>
