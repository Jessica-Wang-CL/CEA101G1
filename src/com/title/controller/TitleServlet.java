package com.title.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.title.model.*;

public class TitleServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        
        //�d�ߨӦ�select.page���ШD
        if("getOne_For_Display".equals(action)) {
        	
        	List<String> errorMsgs = new LinkedList<String>();
        	req.setAttribute("errorMsgs", errorMsgs);
        	
        	try {
        //�����ШD�Ѽ�-��J�榡�����~�B�z
        		String str = req.getParameter("title_no");
        		if (str == null || (str.trim().length()==0)) {
        			errorMsgs.add("�п�J¾��s��");
        		}
        		if (!errorMsgs.isEmpty()) {
        			RequestDispatcher failureView = req.getRequestDispatcher("/backend/title/selectTitle.jsp");
        			failureView.forward(req, res);
        			return;//�{�����_
        		}
        		String title_no = null;
        		try {
        			title_no =new String(str);
        		} catch (Exception e) {
        			errorMsgs.add("¾��s���榡�����T");
        		}
        		if (!errorMsgs.isEmpty()) {
        			RequestDispatcher failureView =req.getRequestDispatcher("/backend/title/selectTitle.jsp");
        			failureView.forward(req, res);
        			return;
        		}
          //�}�l�d�߸��
        		TitleService titleSvc = new TitleService();
        		TitleVO titleVO = titleSvc.getOneTitle(title_no);
        		if (titleVO == null) {
        			errorMsgs.add("�d�L�����");
        		}
        		if(!errorMsgs.isEmpty()) {
        			RequestDispatcher failureView = req.getRequestDispatcher("/backend/title/selectTitle.jsp");
        			failureView.forward(req, res);
        			return;
        		}
         //�d�ߧ���,�ǳ����(Success View)
        		req.setAttribute("titleVO",titleVO);
        		String url = "/backend/title/listOneTitle.jsp";
        		RequestDispatcher successView = req.getRequestDispatcher(url);
        		successView.forward(req, res);
         //��L�i�઺���~�B�z
        	}catch(Exception e) {
        		errorMsgs.add("�L�k���o���:"+e.getMessage());
        		RequestDispatcher failureView = req.getRequestDispatcher("/backend/title/selectTitle.jsp");
        		failureView.forward(req, res);
        	}
        }
        
        if ("getOne_For_Update".equals(action)) {
        	List<String> errorMsgs = new LinkedList<String>();
        	req.setAttribute("errorMsgs", errorMsgs);
        	
        	try {
        		String title_no = new String (req.getParameter("title_no"));//�ШD�Ѽ�
        		TitleService titleSvc = new TitleService(); //�}�l�d���
        		TitleVO titleVO = titleSvc.getOneTitle(title_no);
        		//�d�ߧ���, �ǳ����
        		req.setAttribute("titleVO", titleVO);  //�q��Ʈw���X��titleVO����, �s�Jreq
        		String url ="/backend/title/update_title_input.jsp";
        		RequestDispatcher successView = req.getRequestDispatcher(url);//���\��浹update_title_input.jsp
        		successView.forward(req, res);
        	} catch (Exception e) {
        		errorMsgs.add("�L�k���o�n�ק諸���:"+e.getMessage());
        		RequestDispatcher failureView = req.getRequestDispatcher("/backend/title/listAllTitle.jsp");
        		failureView.forward(req, res);
        	} 
        }
        
        if ("update".equals(action)) {
        	List<String> errorMsgs = new LinkedList<String>();
        	req.setAttribute("errorMsgs", errorMsgs);
        	
        	try {
        		String title_no = new String(req.getParameter("title_no").trim());
        		String title = req.getParameter("title");
//        		String title_nameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,20}$";
        		if (title == null || title.trim().length() ==0) {
        			errorMsgs.add("¾�ٽФŪť�");
        		}
//        		else if (! title.trim().matches(title_nameReg)){
//        			errorMsgs.add("¾��:�u��O��,�^��r��,�Ʀr�M_,�B���ץ����b2-20����");
//        		}
        		TitleVO titleVO = new TitleVO();
        		titleVO.setTitle_no(title_no);
        		titleVO.setTitle(title);
        		
        		if (!errorMsgs.isEmpty()) {
        			req.setAttribute("titleVO",titleVO);
        			RequestDispatcher failureView = req.getRequestDispatcher("/backend/title/update_title_input.jsp");
        			failureView.forward(req, res);
        			return;
        		}
        		TitleService titleSvc = new TitleService();
        		titleVO =titleSvc.updateTitle(title_no, title);
        		
        		req.setAttribute("titleVO", titleVO);
        		String url ="/backend/title/listOneTitle.jsp";
        		RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneFunc.jsp
				successView.forward(req, res);
        	} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/title/update_title_input.jsp");
				failureView.forward(req, res);
			}
        }
        if ("insert".equals(action)) { // �Ӧ�addTitle.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String title_no = new String(req.getParameter("title_no").trim());;
				String title = req.getParameter("title");
//				String title_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				if (title == null || title.trim().length() == 0) {
					errorMsgs.add("¾��ФŪť�");
				}
//				else if(!title.trim().matches(title_nameReg)) { 
//					errorMsgs.add("¾��:�u��O��,�^��r��,�Ʀr�M_,�B���ץ����b2-20����");
//	            }

				TitleVO titleVO = new TitleVO();
				titleVO.setTitle_no(title_no);
				titleVO.setTitle(title);


				if (!errorMsgs.isEmpty()) {
					req.setAttribute("titleVO", titleVO); // �t����J�榡���~��titleVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/title/addTitle.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//�}�l�s�W���
				TitleService titleSvc = new TitleService();
				titleVO = titleSvc.addTitle(title_no,title);
				
				//�s�W����,�ǳ����(Send the Success view)
				String url = "/backend/title/listAllTitle.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
				
				//��L�i�઺���~�B�z
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/title/addTitle.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
