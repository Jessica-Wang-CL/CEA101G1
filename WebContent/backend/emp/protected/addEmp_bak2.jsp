<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.auth.model.*"%>

<% EmpVO empVO = (EmpVO) request.getAttribute("empVO");%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addEmp_1.css" />
</head>
<body>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1" enctype="multipart/form-data" onclick="return false">
<div class="container mt-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-5"> <a href="<%=request.getContextPath()%>/backend/emp/protected/listAllEmp.jsp">Home</a>
                        <div class="card p-2 text-center">
                            <div class="row">
                                <div class="py-3">
                                <h3>員工資料新增表</h3>
                                <img src="<%=request.getContextPath()%>/images/people.png" width="100" class="rounded-circle" />
                                    <span class="d-block head">姓名</span>
                                    <input type="TEXT" name="emp_name"  
			                             value="<%= (empVO==null)? "Ellen" : empVO.getEmp_name()%>" placeholder="Your Name" required/>
			                        <span class="d-block head">帳號</span>
                                    <input type="TEXT" name="emp_acc" 
			                            value="<%= (empVO==null)? "EMP00010" : empVO.getEmp_acc()%>" placeholder="Your Account"/>
			                        <span class="d-block head">信箱</span>
			                        <input type="email" name="emp_email" 
			                             value="<%= (empVO==null)? "resort@gmail.com" : empVO.getEmp_email()%>" placeholder="Your Email"/>    
                                    <input type="hidden" name="emp_pwd" 
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
                                    <input type="hidden" name="emp_city" value="<%= (empVO==null)? "台北市" : empVO.getEmp_city()%>" />
                                    <input type="hidden" name="emp_town" value="<%= (empVO==null)? "大安區" : empVO.getEmp_town()%>" />
                                    <input type="hidden" name="emp_address" value="<%= (empVO==null)? "信義路一段155號" : empVO.getEmp_address()%>" />
                                    <input type="hidden" name="emp_phone" value="<%= (empVO==null)? "0933799899" : empVO.getEmp_phone()%>" />
                                    <input type="hidden" name="emp_status" value="<%= (empVO==null)? "0" : empVO.getEmp_status()%>" />
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
                                     <div class="px-3">
                                         <button type="button" class="btn btn-primary btn-block">下一步</button>
                                    </div>
                              </div>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="auth">
                    <a href="<%=request.getContextPath()%>/backend/emp/addEmp.jsp">Back</a>
                        <div class="py-3" id="show">
                        <h3>員工權限新增</h3>
                        <img src="<%=request.getContextPath()%>/images/loading.png" width="100" class="rounded-circle" />
    <!--                    <span class="d-block head">員工編號</span>
                            <input type="text" name="emp_id"> --> 
                          
                                <div class="stats">
                                    <table class="table table-borderless">
                                        <tbody>
                                            <div class="checkbox">
                                             <jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />  
                                                   <c:forEach var="funcVO" items="${funcSvc.all}"> 
                                                    <div><input type="checkbox" value="${funcVO.func_no}" name="function">
                                                         ${funcVO.func_no} ${funcVO.func_name}</div>
                                                   </c:forEach>    
                                             </div>   
                                        </tbody>
                                    </table>
                                </div>
                             <div class="px-3">
                               <input type="hidden" name="action" value="insert">
                               <input type="submit" class="btn btn-primary btn-block" value="新增" id="send">
                            </div>
                      </div>    
                </div>
            </div>
        </FORM>
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

             <script>
                $(document).ready(function () {
                $("button").click(function () {
                    $(".section").show();
                    $(".container").hide();
                });
                
            });
                

        </script>
</body>
</html>