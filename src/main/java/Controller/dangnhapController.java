package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.KetNoi;

/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhapController")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String un=request.getParameter("txtun");
		String pass=request.getParameter("txtpass");
		KetNoi kn = new KetNoi();
		HttpSession session = request.getSession();
		int k = 0;
		if(un!=null&&pass!=null){
			try {
				String tenND = "";
				kn.ketnoi();
				String sql = "SELECT TenDangNhap, MatKhau FROM DangNhap WHERE TenDangNhap = '"+un+"' AND MatKhau = '"+pass+"'";
				String layten = "select Ten from DangNhap where TenDangNhap = '"+un+"'";
				PreparedStatement getten = kn.cn.prepareStatement(layten);
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				ResultSet rs = cmd.executeQuery();
				ResultSet ten = getten.executeQuery();
				while(ten.next()) {
					tenND = ten.getString("Ten");
					session.setAttribute("ten", tenND);
				}
				while(rs.next()) {
					session.setAttribute("dangnhap", un);
					request.setAttribute("xinchao", un);
					k=1;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(k==1) {
			RequestDispatcher rd = request.getRequestDispatcher("sachController");
			rd.forward(request, response);
		}
		if(k!=1) {
		request.setAttribute("dnsai", "Vui lòng nhập tài khoản và mật khẩu");
		RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
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
