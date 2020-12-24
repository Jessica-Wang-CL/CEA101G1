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
<div class="container mt-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-7"> <a href="<%=request.getContextPath()%>/backend/emp/protected/listAllEmp.jsp">回首頁</a>
                        <div class="card p-2 text-center">
                            <div class="row">
                                <div class="col-md-7 border-right no-gutters">
                                    <div class="py-3">
                                        <h4>員工資料新增表 AddEmp.jsp</h4>
                   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1" enctype="multipart/form-data">
                                        <img src="<%=request.getContextPath()%>/images/people.png" width="100" class="rounded-circle" />
                                        <span class="d-block head">姓名</span>
                                        <input type="TEXT" name="emp_name"  
			                             value="<%= (empVO==null)? "王大明" : empVO.getEmp_name()%>" />

                                        <span class="d-block head">帳號</span>
                                        <input type="TEXT" name="emp_acc" 
			                            value="<%= (empVO==null)? "EMP00010" : empVO.getEmp_acc()%>" />
			                            
			                            <span class="d-block head">密碼</span>
                                        <input type="TEXT" name="emp_pwd" 
			                            value="<%= (empVO==null)? "12345" : empVO.getEmp_pwd()%>" />
			                            
<jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
	<span class="d-block head">職位</span>
		<span><select size="1" name="title_no"  class= "equal">
			<c:forEach var="titleVO" items="${titleSvc.all}">
				<option value="${titleVO.title_no}" ${(empVO.title_no==titleVO.title_no)? 'selected':'' } >${titleVO.title}
			</c:forEach>
		</select>
		</span>
	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
	<span class="d-block head">部門</span>
		<span><select size="1" name="dept_no" class= "equal">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.dept_no}" ${(empVO.dept_no==deptVO.dept_no)? 'selected':'' } >${deptVO.dept}
			</c:forEach>
		</select>
		</span>

                                        <div class="stats">
                                            <table class="table table-borderless">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <input type="file" name="emp_pic">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                   
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="py-3">
                                        <div>
                                           <input type="hidden" name="emp_city" value="<%= (empVO==null)? "台北" : empVO.getEmp_city()%>" />
                                        </div>
                                        <div class="mt-4">
                                            <input type="hidden" name="emp_town" value="<%= (empVO==null)? "台北" : empVO.getEmp_town()%>" />
                                        </div>
                                        <div class="mt-4">
                                            <input type="hidden" name="emp_address" value="<%= (empVO==null)? "台北" : empVO.getEmp_address()%>" />
                                        </div>
                                        <div class="mt-4">
                                            <input type="hidden" name="emp_phone" value="<%= (empVO==null)? "0933799899" : empVO.getEmp_phone()%>" />
                                        </div>
                                        <div class="mt-4">
                                            <input type="hidden" name="emp_email" 
			                              value="<%= (empVO==null)? "123@gmail.com" : empVO.getEmp_email()%>" />
			                             </div>
                                         <div class="mt-4">
                                            <span class="d-block head"></span>
                                            <input type="hidden" name="emp_status" 
			                              value="<%= (empVO==null)? "0" : empVO.getEmp_status()%>" />
			                             </div>
                                       
                                    </div>
                                    
                                    
                                    <div class="checkbox">
                                             <jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />  
                                                   <c:forEach var="funcVO" items="${funcSvc.all}"> 
                                                    <div><input type="checkbox" value="${funcVO.func_no}" name="function">
                                                         ${funcVO.func_no} ${funcVO.func_name}</div>
                                                   </c:forEach>    
                                             </div> 
                                       <div class="px-3">
                                            <input type="hidden" name="action" value="insert">
                                            <input type="submit" class="btn btn-primary btn-block" value="送出新增">
                                        </div> </FORM>
                                </div>
                            </div>
                        </div>
                    </div>
                  <%-- 錯誤表列 --%>
                <c:if test="${not empty errorMsgs}">
	             <ul>
		           <c:forEach var="message" items="${errorMsgs}">
			         <li style="color:red">${message}</li>
		           </c:forEach>
	             </ul>
                </c:if>
              </div>
            </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" /></script>
</body>

</html>