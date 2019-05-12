package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommonDao {
    protected Connection db;
    protected PreparedStatement ps;
    protected ResultSet rs;

    protected void getConnection() throws NamingException, SQLException {
        Context context = new InitialContext();
        DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/jsp");
        this.db = ds.getConnection();
    }

    protected void disconnect() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (db != null) {
                db.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
