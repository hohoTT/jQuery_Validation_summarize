package com.wt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjaxServlet extends HttpServlet {
	
	public AjaxServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 获取请求的参数 email
		String email = request.getParameter("email");
		
		// 以下打印用于测试时使用
		System.out.println("email : -------- " + email);

		PrintWriter writer = response.getWriter();
		
		if(email.equals("hohoTT@qq.com")){
			// 当前 email 地址已经被注册, 发送 false, 代表验证的失败
			writer.write("false");
		}
		else{
			// 此时的邮箱没有被注册，此时验证成功，发送true
			writer.write("true");
		}
		
		writer.close();
		
	}
	
	public void init() throws ServletException {
	}

}
