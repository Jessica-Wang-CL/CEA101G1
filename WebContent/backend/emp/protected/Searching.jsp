<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
<jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
<jsp:useBean id="authSvc" scope="page" class="com.auth.model.AuthService" />
<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>Searching</title>
<link rel="stylesheet" href="searching.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" />

 <style>
.section {
    margin: 0 auto;
    padding-top: 50px;
    padding-left: 140px;
    left: 50%;
}

.text-dark {
    color: #242f3e !important;
}

p {
    font-weight: 400;
    color: #8b8e93;
    font-size: 15px;
    line-height: 1.6;
    font-family: "Open Sans", sans-serif;
}

.icon-primary {
    color: #062caf;
}

li {
    line-height: 1.6;
    font-family: "Open Sans", sans-serif;
    -webkit-font-smoothing: antialiased;
    font-size: 15px;
    color: #8b8e93;
}
.side {
    /* visibility: hidden; */
    box-sizing: border-box;
    box-shadow: #808080 0px 0px 10px;
    margin: 0 60%;
    border: 1px solid gray;
    width: 30%;
    height: 60%;
    padding: 2%;
    min-width: 100px;
}
 </style>
</head>
<body>

<section class="section">
            <div class="side">
                <div>
                    <h3 class="text-dark">Searching</h3>
                    <p class="border-bottom pb-4">with multiple method</p>
                    <ul class="list-unstyled">
    <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
                        <li>                  
                            <div class="pl-3">
                                <h6 class="text-dark">選擇員工編號/姓名</h6>
                                <ul class="list-unstyled">
                                    <li>
                                    <select size="1" name="emp_id">
                                     <c:forEach var="empVO" items="${empSvc.all}" > 
                                        <option value="${empVO.emp_id}">${empVO.emp_id}
                                      </c:forEach>   
                                     </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" value="send" class="btn btn-outline-light btn-sm">                                   
                                    </li>
                                     <li>
                                     <select size="1" name="emp_id">
                                      <c:forEach var="empVO" items="${empSvc.all}" > 
                                         <option value="${empVO.emp_id}">${empVO.emp_name}
                                      </c:forEach>   
                                     </select>
                                     <input type="hidden" name="action" value="getOne_For_Display">
                                     <input type="submit" value="send" class="btn btn-outline-light btn-sm"> 
                                    </li>
                                </ul>
                            </div>
                        </li>
                     </FORM>
                        <li>
                          <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
                            <div class="pl-3">
                                <h6 class="text-dark">選擇部門</h6>
                                <ul class="list-unstyled">
                                  <select size="1" name="dept_no">
                                     <c:forEach var="deptVO" items="${deptSvc.all}" > 
                                       <option value="${deptVO.dept_no}">${deptVO.dept_no} ${deptVO.dept}
                                     </c:forEach>   
                                  </select>
                                  <input type="hidden" name="action" value="getAllByDept">
                                  <input type="submit" value="send" class="btn btn-outline-light btn-sm">
                                </ul>
                            </div>
                          </FORM>
                        </li>

                        <li>
                          <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do" >
                            <div class="pl-3">
                                <h6 class="text-dark">選擇權限</h6>
                                <ul class="list-unstyled">
                                  <li>
                                    <select size="1" name="func_no">
                                      <c:forEach var="funcVO" items="${funcSvc.all}" > 
                                         <option value="${funcVO.func_no}">${funcVO.func_no} ${funcVO.func_name}</option>
                                      </c:forEach>   
                                    </select>
                                    <input type="hidden" name="action" value="getOneByFunc">
                                    <input type="submit" value="send" class="btn btn-outline-light btn-sm">
                                  </li>
                                </ul>
                            </div>
                          </FORM>
                        </li>
                        <li>
                          <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" >
                            <div class="pl-3">
                                <h6 class="text-dark">選擇職位</h6>
                                <ul class="list-unstyled">
                                    <li>
                                      <select size="1" name="title_no">
                                        <c:forEach var="titleVO" items="${titleSvc.all}" > 
                                          <option value="${titleVO.title_no}">${titleVO.title_no} ${titleVO.title}
                                        </c:forEach>   
                                      </select>
                                      <input type="hidden" name="action" value="getOneByTitle">
                                      <input type="submit" value="send" class="btn btn-outline-light btn-sm">
                                    </li>
                                </ul>
                            </div>
                           </FORM>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    $(".side").toggle();
                });
            });
        </script>
</body>
</html>