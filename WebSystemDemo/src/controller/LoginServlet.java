package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import dao.UserDao;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatch = null;

        request.getSession().invalidate();

        dispatch = request.getRequestDispatcher("Login.jsp");
        dispatch.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("user_id");
        String password = request.getParameter("password");
        LoginDao loginDao = new LoginDao();
        UserDao userDao = new UserDao();
        List<User> list = new ArrayList<User>();
        User user = new User();
        HttpSession session = request.getSession();
        try {
            user = loginDao.findLoginUser(userId, password);
            list = userDao.findAll();

            request.setAttribute("users", list);

            RequestDispatcher dispatch = null;
            if (user != null) {
                session.setAttribute("loginuser", user);

                dispatch = request.getRequestDispatcher("UserManager.jsp");
                dispatch.forward(request, response);
            } else {
                dispatch = request.getRequestDispatcher("LoginNG.jsp");
                dispatch.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}