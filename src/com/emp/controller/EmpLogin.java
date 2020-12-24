package com.emp.controller;

import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;


public class EmpLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//【檢查使用者輸入的帳號(account) 密碼(password)是否有效?
	//【實際上應至資料庫搜尋比對】                           
	protected boolean allowEmp(String emp_acc, String emp_pwd) {
		EmpService empSvc = new EmpService();
		EmpVO empVO =empSvc.getOneByAcc(emp_acc, emp_pwd);
		if(empVO == null)
			return false;
		else 
			return true;                                         
	}                                                           

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF8");
        res.setContentType("text/html; charset=UTF8");
        PrintWriter out = res.getWriter();
        
        //取得員工帳號密碼
        String emp_acc = req.getParameter("emp_acc");
        String emp_pwd = req.getParameter("emp_pwd");
        
        //檢查員工帳號密碼(若非員工)
        if (!allowEmp(emp_acc, emp_pwd)) {
          RequestDispatcher failureView =req.getRequestDispatcher("/backend/emp/failure.jsp");
		  failureView.forward(req,res);
        }else { //若是員工
        	HttpSession session = req.getSession();
        	session.setAttribute("emp_acc", emp_acc);//存入session中的emp_acc, 做已經登入過的標識

        	try {
        		String location = (String) session.getAttribute("location"); //查詢來源網頁
        		if(location !=null) {
        			session.removeAttribute("location");//若有來源網頁, 重導至來源網頁
        			res.sendRedirect(location);
        			return;
        		}
        	}catch (Exception ignored) {}

        	res.sendRedirect(req.getContextPath()+ "/backend/emp/protected/Backend.jsp");
        }
	}

}
