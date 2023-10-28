package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.giohangbean;
import bean.sachbean;
import bo.giohangbo;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class giohang
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ml=request.getParameter("ml");
		try {
//			ketnoi giohangbo de lay ds
			loaibo lbo = new loaibo();
			sachbo sbo = new sachbo();
			ArrayList<sachbean> dssach = sbo.getallsach();
//			lay ra danh sach loai
			request.setAttribute("dsloai", lbo.getloai());
//			lay du lieu
			HttpSession session=request.getSession();
			String ms= request.getParameter("ms");
			String ts=request.getParameter("ts");
			String giatam=request.getParameter("gia");
			String anh=request.getParameter("anh");
			String sl = request.getParameter("txtsl");
// 			tao mot giohang bo neu giohangbo == null thi new mot giohangbo moi
			giohangbo gh = null;
			int l = 0;
			if(session.getAttribute("gh")==null){
				gh=new giohangbo();
				session.setAttribute("gh", gh);
			}
			gh=(giohangbo)session.getAttribute("gh");
//			them va xoa
			if(sl==null && giatam!=null &ms!=null) {
			gh.Them(ms,ts,(long)1,Long.parseLong(giatam));
			l=1;
			}
			else{
				gh.Xoa(ms);
			}
//			xoa nhieu mat hang mot luc voi o checkbox
			 String[] gt = request.getParameterValues("c1"); if(gt!=null) { 
				 for(String c:gt) { 
					 gh.Xoa(c); 
					 }
			 	}
//			 tong thanh tien
			 long tong= gh.Tong();
			 session.setAttribute("tong", tong);
			 
//			doi giohangbo thanh arraylist
			ArrayList<giohangbean> ds= null;
			if(session.getAttribute("gh")==null) {
				ds = new ArrayList<giohangbean>();
				session.setAttribute("ghds", ds);
			}
//			gan ds = session giohangbo.ds
			ds = ((giohangbo)session.getAttribute("gh")).ds;
			session.setAttribute("ghds", ds);
			if(ms!=null) {
				response.sendRedirect("giohangController");
				return;
			}
			
			session.setAttribute("gh", gh);
			response.sendRedirect("htGioController");
		}catch (Exception e) {
			e.getMessage();
		}
		
	}
//	 String[] gt= request.getParameterValues("c1"); if(gt!=null){ giohangbo gh =
//	 (giohangbo)session.getAttribute("gh"); for(String c: gt){ //Hien thi cac ma
//	  sach vua chon gh.Xoa(c); } }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
