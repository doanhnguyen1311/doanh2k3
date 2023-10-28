package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class test {
    public static void main(String[] args) {

        try {
        	KetNoi kn = new KetNoi();
        	kn.ketnoi();
            PreparedStatement st= kn.cn.prepareStatement("Select * from KhachHang");
            ResultSet rs=  st.executeQuery();
            while(rs.next())
            	System.out.print(rs.getString("hoten"));
           rs.close();
        } catch (Exception e) {
            System.out.println("Failed: JDBC Driver Error: " + e.getMessage());
        }
    }
}
