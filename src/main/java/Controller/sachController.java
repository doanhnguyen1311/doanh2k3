package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bean.sachbean;
import bo.giohangbo;
import bo.loaibo;
import bo.sachbo;
import dao.KetNoi;
import dao.sachdao;

/**
 * Servlet implementation class sachController
 */
@WebServlet("/sachController")
public class sachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
			HttpSession session = request.getSession();
			session.getAttribute("dangnhap");
			request.setCharacterEncoding("utf-8");
	   		response.setCharacterEncoding("utf-8");   
			loaibo lbo=new loaibo();
			sachbo sbo=new sachbo();
	   		String ml=request.getParameter("ml");
			ArrayList<sachbean> ds = sbo.getallsach();
//			lay ra danh sach loai
			session.setAttribute("dsloai", lbo.getloai());
//			lay utf-8
			request.setCharacterEncoding("utf-8");
	   	    response.setCharacterEncoding("utf-8");
//	   		lay ra ma loai, tim kiem tren mang ds
	   		String key=request.getParameter("txttk");
	   		   if(ml!=null) ds=sbo.TimMa(ml);
	   		else
	   			if(key!=null) ds=sbo.Tim(key);
	   		session.setAttribute("dssach", ds);
			/* long page = Long.parseLong(request.getParameter("page")); */
			RequestDispatcher rd = request.getRequestDispatcher("Menu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
