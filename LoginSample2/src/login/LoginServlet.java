package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Connection con = null;
    private ResultSet rs = null;
    private ResultSet rs2 = null;
    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatch = null;
        dispatch = request.getRequestDispatcher("Login.jsp");
        dispatch.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("user_id");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(
                    "jdbc:mysql://javasystem-demo.cwcncfovruyw.us-east-2.rds.amazonaws.com:3306/javasystem","root","javasystem");
            ps = con.prepareStatement(
                    "select user_name from user where user_id = ? and password = ?");
            ps.setString(1, userId);
            ps.setString(2, password);
            rs = ps.executeQuery();

            List<User> list = new ArrayList<User>();
            ps2 = con.prepareStatement(
                    "select * from user;");

            rs2 = ps2.executeQuery();
            while (rs2.next()) {
				String _user_id = rs2.getString("user_id");
				String _user_name = rs2.getString("user_name");
				String _password = rs2.getString("password");
				list.add(new User(_user_id,_user_name,_password));
			}


            request.setAttribute("users", list);
            String userName = null;
            while(rs.next()) {
                userName = rs.getString("user_name");
                request.setAttribute("name", userName);
            }

             RequestDispatcher dispatch = null;
            if (userName != null) {
                dispatch = request.getRequestDispatcher("LoginOK.jsp");
                dispatch.forward(request, response);
            } else {
                dispatch = request.getRequestDispatcher("LoginNG.jsp");
                dispatch.forward(request, response);
            }
        } catch(SQLException e_sql) {
            e_sql.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (ps2 != null) {
                    ps2.close();
                }
                if (rs2 != null) {
                    rs2.close();
                }


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}