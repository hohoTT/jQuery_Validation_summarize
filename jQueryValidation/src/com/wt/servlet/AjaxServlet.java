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
		
		// ��ȡ����Ĳ��� email
		String email = request.getParameter("email");
		
		// ���´�ӡ���ڲ���ʱʹ��
		System.out.println("email : -------- " + email);

		PrintWriter writer = response.getWriter();
		
		if(email.equals("hohoTT@qq.com")){
			// ��ǰ email ��ַ�Ѿ���ע��, ���� false, ������֤��ʧ��
			writer.write("false");
		}
		else{
			// ��ʱ������û�б�ע�ᣬ��ʱ��֤�ɹ�������true
			writer.write("true");
		}
		
		writer.close();
		
	}
	
	public void init() throws ServletException {
	}

}
