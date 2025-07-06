package org.example.bookwebsite.myBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBcon {
    Connection con;
    Statement stm;
    ResultSet rs;
    
    public Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/sea_book";
            String user = "root";
            String psw = "root";
            con = DriverManager.getConnection(url, user, psw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    
    public ResultSet getRs(String sql) {
        try {
            con = getCon();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public int Exec(String sql){
        int n = 0;
        try {
            con = getCon();
            stm = con.createStatement();
            n = stm.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return n;
    }

public void closeCon() {
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
