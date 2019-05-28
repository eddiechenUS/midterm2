package com.eddie.midterm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SchoolDAOjdbc dao1 = new SchoolDAOjdbc();

		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();

		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg);
		// List<SchoolBean> getall_Collection = (List<SchoolBean>)
		// session.getAttribute("alldata");

		// insert
		SchoolBean school1 = new SchoolBean();
		String insertText = request.getParameter("Update");
		System.out.println(insertText);
		String[] array = insertText.trim().split(",");
		// 測試

		if (array.length == 9) {

			if (array[0].matches("[0-9]+")) {
				school1.setNum(Integer.parseInt(array[0]));
			} else {
				errorMsg.put("Invalid", "無效序號");
			}

			// 判斷是否在arrayList裡面的序號,取所有值比對,效能較差
			// 改用findByNumber,因為效能較好
//			if (array[0].matches("[0-9]+")) {
//
//				try {
//					SchoolBean sb = dao1.findByNum(Integer.parseInt(array[0]));
//					if (sb != null) {
//						school1.setNum(Integer.parseInt(array[0]));
//						
//					} else {
//						//空值 跳 exception
//					}
//				} catch (SQLException e) {
//					errorMsg.put("Invalid", "連線出錯");
//					RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
//					rd.forward(request, response);
//					return;
//					
//				}catch(NullPointerException e){
//					errorMsg.put("Invalid", "查無此資料");
//					RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
//					rd.forward(request, response);
//					return;
//					
//				}

			if (array[1].matches("[0-9]+"))
				school1.setSchool_code(Integer.valueOf(array[1]));
			else
				errorMsg.put("Invalid", "無效校碼");

			if (array[2].matches("[\u4e00-\u9fa5]+"))
				school1.setSchool_name(array[2]);
			else
				errorMsg.put("Invalid", "無效校名");

			if (array[3].matches("[0-9]+"))
				school1.setMajor_code(array[3]);
			else
				errorMsg.put("Invalid", "無效科系碼");

			if (array[4].matches("[\\u4e00-\\u9fa5]+"))
				school1.setMajor_name(array[4]);
			else
				errorMsg.put("Invalid", "無效系名");

			String re_array = array[5].replace(" ", "");
			if (re_array.matches("[a-zA-Z]+[\\u4e00-\\u9fa5]+") || re_array.matches("[\\d]+[\\u4e00-\\u9fa5]+"))
				school1.setLevel_code(array[5]);
			else
				errorMsg.put("Invalid", "無效等級別");

			String re_array2 = array[6].replace(" ", "");
			if (re_array2.matches("[\\d]+[\\u4e00-\\u9fa5]+"))
				school1.setCity_code(array[6]);
			else
				errorMsg.put("Invalid", "無效城市碼");

			if (array[7].matches("[0-9]+(.[0-9]{1,2})") || array[7].matches("[0-9]+"))
				school1.setAvg_score1(Double.valueOf(array[7]));
			else {
				errorMsg.put("Invalid", "無效分數");
			}
			Boolean result = checkDate.check(array[8]);
			if (result) {
				school1.setDeadline1(java.sql.Date.valueOf(array[8]));
			} else {
				errorMsg.put("Invalid", "無效日期");
			}

			if (errorMsg.isEmpty()) {
				try {
					dao1.update(school1);
					request.setAttribute("UpdateSuccess", "Update Successful!");		
					List<SchoolBean> allschools=dao1.getAll();
					request.setAttribute("alldata", allschools );
					RequestDispatcher rd = request.getRequestDispatcher("successpage.jsp");
					rd.forward(request, response);
					return;
				} catch (SQLException e) {
					// �s�W����ƭ쥻���s�b
					request.setAttribute("ExceptionError", "Data Never exist Before");
					RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
					rd.forward(request, response);
					return;
				}

			} else {

				// 至少有一個錯誤(Map不為空,顯示Map)
				// errorMsg.put("AtLeast1Error", "At least 1 data Invalid");
				// 因為是接上面其一錯誤的值,所以上面已經儲存錯誤至Map不須再多此一舉
				RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
				rd.forward(request, response);
				return;
			}

		} else {
			errorMsg.put("FormatError", "Missing at least 1 data");
			RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
			rd.forward(request, response);
			return;
		}
	}
}
