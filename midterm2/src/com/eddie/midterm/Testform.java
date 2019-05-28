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


@WebServlet("/Testform")
public class Testform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String input_text=request.getParameter("insert");
		System.out.println(input_text);
		
		
		
//		Map<String, String> errorMsg = new HashMap<String, String>();
//		request.setAttribute("MsgMap", errorMsg);
//		errorMsg.put("Invalid1", "無效的School_code");
//		errorMsg.put("Invalid2", "無效的School_name");
//		errorMsg.put("Invalid3", "無效的Major_code");
//		errorMsg.put("Invalid4", "無效的Major_name");
//		errorMsg.put("Invalid5", "無效的Level_code");
//		errorMsg.put("Invalid6", "無效的City_code");
//		errorMsg.put("Invalid7", "無效的Avg_score");
//		errorMsg.put("Invalid8", "無效的Deadline");
//		RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
//		rd.forward(request, response);
//		return;

	}

}
