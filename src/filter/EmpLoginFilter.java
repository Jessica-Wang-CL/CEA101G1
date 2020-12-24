package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;

public class EmpLoginFilter implements Filter {
	
	private FilterConfig config;
	
	public void init (FilterConfig config) {
		this.config = config;
	}
	
	public void destroy() {
		config = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//進行強轉型
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		//取得session
		HttpSession session = req.getSession();
		//從session判斷emp是否登入過
		Object emp_acc = session.getAttribute("emp_acc");
		System.out.println(emp_acc);
		if (emp_acc == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath()+"/backend/emp/loginEmp.jsp");
			return;
		}else {
			chain.doFilter(request, response);
		}	
	}
  
}
