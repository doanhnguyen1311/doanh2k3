package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import bean.loaibean;

public class loaidao {
    public ArrayList<loaibean> getloai() throws Exception{
    	ArrayList<loaibean> ds= new ArrayList<loaibean>();
    	//b1: ket noi vao csdl
    	KetNoi kn = new KetNoi();
    	kn.ketnoi();
    	//b2 tao cau lenh sql
    	String sql = "select * from loai";
    	//b3 tao cau lenh
    	PreparedStatement cmd = kn.cn.prepareStatement(sql);
    	//b4 thuc hien cau lenh
    	ResultSet rs = cmd.executeQuery();
    	//b5 Duyet rs de dua vào mảng ds
    	while(rs.next()) {
    		String maloai = rs.getString("maloai");
    		String tenloai = rs.getString("tenloai");
    		ds.add(new loaibean(maloai, tenloai));
    	}
    	rs.close();
    	kn.cn.close();
    	return ds;
    }
}
