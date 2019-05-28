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


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SchoolDAOjdbc dao3 = new SchoolDAOjdbc();
			
		try {
			int schoolNo = Integer.parseInt(request.getParameter("Delete"));
			dao3.delete(schoolNo);
			request.setAttribute("DelSuccess", "Delete Successful!");
			List<SchoolBean> allschools=dao3.getAll();
			request.setAttribute("alldata", allschools );
		} catch (SQLException e) {
			request.setAttribute("ExceptionError", "SQL 連線錯誤");
			RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
			rd.forward(request, response);
			return;
		}catch (NumberFormatException e) {
			request.setAttribute("ExceptionError", "Data Invalid");
			RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
			rd.forward(request, response);
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("successpage.jsp");
		rd.forward(request, response);
		return;

	}

}
