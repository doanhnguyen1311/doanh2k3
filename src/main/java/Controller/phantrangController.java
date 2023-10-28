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
import javax.websocket.Session;

import bean.loaibean;
import bean.sachbean;
import bo.loaibo;
import bo.sachbo;
import dao.KetNoi;
import dao.sachdao;

/**
 * Servlet implementation class phantrangController
 */
@WebServlet("/phantrangController")
public class phantrangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public phantrangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loaibo lbo = new loaibo();
		sachbo sbo = new sachbo();
		HttpSession session = request.getSession();
		ArrayList<loaibean> dsloai = null;
		try {
			if(dsloai!=null) {
			dsloai = lbo.getloai();
			session.setAttribute("loai", dsloai);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String indexPage = request.getParameter("index");
		int index = 0;
		if(indexPage!=null) {
			index = Integer.parseInt(indexPage);
		}
		else {
			indexPage = "1";
			index = Integer.parseInt(indexPage);
		}
		int total = sbo.totalSach();
		int endPage = total/10;
		if(total%10==0) {
			endPage++;
		}
		ArrayList<sachbean> dspage = sbo.pagingSach(index);
		session.setAttribute("dspage", dspage);
		request.setAttribute("endPage", endPage);
		RequestDispatcher rd = request.getRequestDispatcher("Menu.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
