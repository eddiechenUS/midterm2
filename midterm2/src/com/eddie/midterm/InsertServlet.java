package com.eddie.midterm;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

class checkDate {

	static boolean check(String str) {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");// 括号内为日期格式，y代表年份，M代表年份中的月份（为避免与小时中的分钟数m冲突，此处用M），d代表月份中的天数
		try {
			sd.setLenient(false);// 此处指定日期/时间解析是否不严格，在true是不严格，false时为严格
			sd.parse(str);// 从给定字符串的开始解析文本，以生成一个日期
		} catch (Exception e) {
			return false;
		}
		return true;

	}
}

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
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
		session.setAttribute("MsgOK", msgOK);

		// insert
		SchoolBean school1 = new SchoolBean();
		String insertText = request.getParameter("Insert");
		System.out.println(insertText);
		String[] array = insertText.trim().split(",");
		// 測試
		for (String item : array) {
			System.out.println(item);
		}
		// 測試結束

		if (array.length == 9) {

			if (array[0].matches("[0-9]+"))
				school1.setNum(Integer.valueOf(array[0]));
			else
				errorMsg.put("Invalid", "無效序號");

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
			else
				errorMsg.put("Invalid", "無效分數");

			Boolean result = checkDate.check(array[8]);

			if (result)
				school1.setDeadline1(java.sql.Date.valueOf(array[8]));
			else {
				errorMsg.put("Invalid", "無效日期");
			}

			if (errorMsg.isEmpty()) {
				try {
					dao1.insert(school1);
					request.setAttribute("InsertSuccess", "Insert Successful!");
					List<SchoolBean> allschools=dao1.getAll();
					request.setAttribute("alldata", allschools );
					RequestDispatcher rd = request.getRequestDispatcher("successpage.jsp");
					rd.forward(request, response);
					return;
				} catch (SQLException e) {
					// 主鍵重複
					errorMsg.put("ExceptionError", "Error, duplicate Primary Key occur!");
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
			}

		} else {
			errorMsg.put("FormatError", "Missing at least 1 data");
			RequestDispatcher rd = request.getRequestDispatcher("errorpage.jsp");
			rd.forward(request, response);
			return;
		}
	}

}
