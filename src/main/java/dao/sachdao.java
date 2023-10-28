package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.sachbean;

public class sachdao {
public ArrayList<sachbean> getallsach() throws Exception{
	ArrayList<sachbean> ds= new ArrayList<sachbean>();
	//b1: ket noi vao csdl
	KetNoi kn = new KetNoi();
	kn.ketnoi();
	//b2 tao cau lenh sql
	String sql = "select * from sach";
	//b3 tao cau lenh
	PreparedStatement cmd = kn.cn.prepareStatement(sql);
	//b4 thuc hien cau lenh
	ResultSet rs = cmd.executeQuery();
	//b5 Duyet rs de dua vào mảng ds
	while(rs.next()) {
		String masach  = rs.getString("masach");
		String tensach = rs.getString("tensach");
		String tacgia = rs.getString("tacgia");
		Long soluong = rs.getLong("soluong");
		Long gia = rs.getLong("gia");
		String anh = rs.getString("anh");
		String maloai = rs.getString("maloai");
		ds.add(new sachbean(masach, tensach, tacgia, (long)soluong, (long)gia, anh, maloai));
	}
	rs.close();
	kn.cn.close();
	return ds;
}
	
public int getTotalAccount() {
	String query = "select count(*) from sach";
	try {
		KetNoi kn = new KetNoi();
		PreparedStatement cmd = kn.cn.prepareStatement(query);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			return rs.getInt(1);
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return 0;
	
}
	
public ArrayList<sachbean> pagingAccount(int index){
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		String sql = "select * from sach order by masach offset ? rows fetch next 6 rows only";
		try {
			KetNoi kn = new KetNoi();
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, (index-1)*6);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				String masach  = rs.getString("masach");
				String tensach = rs.getString("tensach");
				String tacgia = rs.getString("tacgia");
				Long soluong = rs.getLong("soluong");
				Long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				ds.add(new sachbean(masach, tensach, tacgia, (long)soluong, (long)gia, anh, maloai));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ds;
	}
	public static void main(String[] args) {
		sachdao dao = new sachdao();
		ArrayList<sachbean> ds = dao.pagingAccount(1);
		for(sachbean s:ds) {
			System.out.println(s);
		}
	}
}
