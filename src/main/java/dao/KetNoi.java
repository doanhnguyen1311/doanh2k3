package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoi {
	public Connection cn;

	public void ketnoi() throws Exception {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433;database=QLSach;user=sa;password=123;encrypt=false";
			cn = DriverManager.getConnection(url);
}
}