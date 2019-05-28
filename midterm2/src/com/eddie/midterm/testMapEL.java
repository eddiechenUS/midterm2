package com.eddie.midterm;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testMapEL")
public class testMapEL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request,  response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, String> errorMsg = new HashMap<String, String>();
		request.setAttribute("MsgMap", errorMsg);
		errorMsg.put("1", "AAAA");
		errorMsg.put("2", "AAAA");
		errorMsg.put("3", "AAAA");
		errorMsg.put("4", "AAAA");
		errorMsg.put("5", "AAAA");
		errorMsg.put("6", "AAAA");
		errorMsg.put("7", "AAAA");
		
		RequestDispatcher rd = request.getRequestDispatcher("testMapEL.jsp");
		rd.forward(request, response);
		return;
	}

}
