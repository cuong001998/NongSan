package data;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCConnection {

    public Connection getConnection() {
        try {
            final String username = "root";
            final String password = "admin";
            final String url = "jdbc:mysql://localhost:3306/javaweb09";
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, username, password);
            return conn;
        } catch (Exception e) {
            System.out.println("Loi ket noi connection : " + e);
        }
        return null;
    }

//    public static void main(String[] args) {
//        JDBCConnection jdbcConnection = new JDBCConnection();
//        Connection con = jdbcConnection.getConnection();
//        if (con == null) {
//            System.out.println("That bai");
//        } else {
//            System.out.println("Thanh cong");
//        }
//    }
}
