package com.suehon.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IsLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain filterChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//System.out.println("验证登录");
		HttpServletRequest rq = (HttpServletRequest) req;
		HttpServletResponse rp = (HttpServletResponse) resp;
		String uriStr = rq.getRequestURI();
		if (uriStr.indexOf("login.html") == -1
				&& uriStr.indexOf("LoginServlet") == -1
				&& uriStr.indexOf("images") == -1
				&& rq.getSession().getAttribute("name") == null) {
			rp.sendRedirect("/ctms/login/login.html");
		} else {
			filterChain.doFilter(rq, rp);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
