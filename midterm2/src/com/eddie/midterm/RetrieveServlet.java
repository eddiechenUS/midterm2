package com.eddie.midterm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/RetrieveServlet")
public class RetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		HttpSession session = request.getSession();
		
		SchoolDAOjdbc dao1 = new SchoolDAOjdbc();
		try {
			List<SchoolBean> allschools=dao1.getAll();
			request.setAttribute("alldata", allschools );
			session.setAttribute("alldata", allschools);
			
			System.out.println("成功取所有");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("successpage.jsp");
		rd.forward(request, response);
		return;
		
	}

}
