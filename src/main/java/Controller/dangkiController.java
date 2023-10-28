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

import dao.KetNoi;

/**
 * Servlet implementation class dangkiController
 */
@WebServlet("/dangkiController")
public class dangkiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String un = request.getParameter("user-dk");
		String pass = request.getParameter("pass-dk");
		String passnl = request.getParameter("pass-nl");
		String ho = request.getParameter("ho");
		String ten = request.getParameter("ten");
		KetNoi kn = new KetNoi();
		try {
			if(un!=null && pass!=null && passnl!=null) {
			kn.ketnoi();
			String sql = "INSERT INTO [dbo].[DangNhap](TenDangNhap, MatKhau, Quyen, HoNguoiDung, Ten) VALUES('"+un+"', '"+pass+"', 1, '"+ho+ "', '"+ ten +"')";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("dangnhapController");
			rd.forward(request, response);
		}
		else {
			System.out.println("<p style = \"color: red;\">Vui lòng nhập tài khoản hoặc mật khẩu</p>");
		}
		} catch (Exception e) {
			e.getMessage();
		}
		if(pass!=null && pass.equals(passnl) && un!=null){
		RequestDispatcher rd = request.getRequestDispatcher("dangnhapController");
		rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("dangki.jsp");
			rd.forward(request, response);
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
