package com.ssafy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil_for_parse {
	final String url = "jdbc:mysql://127.0.0.1:3306/happyhouse?serverTimezone=UTC";
    private static DBUtil_for_parse util = new DBUtil_for_parse();

    public static DBUtil_for_parse getUtil() {
        return util;
    }

    private DBUtil_for_parse() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, "ssafy", "ssafy");
    }

    public void close(Connection con) {
        this.close(null, null, con);
    }

    public void close(ResultSet rset, Statement stmt) {
        this.close(rset, stmt, null);
    }

    public void close(ResultSet rset, Statement stmt, Connection con) {
        try {
            if (rset != null) {
                rset.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
