<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IBM_TITLE:Home</title>
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
   <tr><td><h3>IBM TITLE: Home</h3><h4>( MVC )</h4></td></tr>
</table>
<p>This is the Home page for IBM TITLE: Home</p>

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
  <li><a href='listAllTitle.jsp'>List</a> all Titles.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/title/title.do" >
        <b>輸入職位編號 (如02):</b>
        <input type="text" name="title_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
  <jsp:useBean id="titleSvc" scope="page" class="com.title.model.TitleService" />
  
    <li>
       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/title/title.do" >
       <b>選擇職位名稱:</b>
       <select size="1" name="title_no">
         <c:forEach var="titleVO" items="${titleSvc.all}" > 
          <option value="${titleVO.title_no}">${titleVO.title_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/title/title.do" >
       <b>選擇職位名稱:</b>
       <select size="1" name="title_no">
         <c:forEach var="titleVO" items="${titleSvc.all}" > 
          <option value="${titleVO.title_no}">${titleVO.title}</option>
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
  <h3>職位管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/title/AddTitle.jsp'>Add</a> a new title.</li>
</ul>
<body>

</body>
</html>