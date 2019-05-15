package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        UserDao dao = new UserDao();


        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            dao.deleteOne(request.getParameter("user_id"));
            request.setAttribute("msg", "1件削除しました。");
        } else if (action != null && action.equals("update")) {
            User user = dao.findOne(request.getParameter("user_id"));
            request.setAttribute("user", user);
            request.setAttribute("title", "項目を編集してください。");
        }
        List<User> list = dao.findAll();
        request.setAttribute("users", list);

        RequestDispatcher dispatch = request.getRequestDispatcher("UserManager.jsp");
        dispatch.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String userId = request.getParameter("user_id");
        String userName = request.getParameter("user_name");
        String password = request.getParameter("password");

        if (userName.isEmpty() || userId.isEmpty() || password.isEmpty()) {
            request.setAttribute("err", "未記入の項目があります！");
        } else {
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String updated = sdf.format(date);
            UserDao dao = new UserDao();
            User user = dao.findOne(userId);
            if (user != null) {
                dao.updateOne(new User(userId, userName, password));
                request.setAttribute("msg","1件更新しました。");

                User loginUser = (User) request.getSession().getAttribute("loginuser");
                if (loginUser.getUserId().equals(userId)) {
                    loginUser.setUserName(userName);
                    request.getSession().setAttribute("loginuser", loginUser);
                }
            } else {
                dao.insertOne(new User(userId, userName, password));
                request.setAttribute("msg","1件登録しました。");
            }
        }
//        request.removeAttribute("list");

        doGet(request,response);
    }
}