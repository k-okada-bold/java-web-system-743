<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  //セッションスコープからインスタンスを取得![スクリーンショット 2016-02-25 13.43.01.png](https://qiita-image-store.s3.amazonaws.com/0/95187/871a7c0f-3793-0d1b-e24e-4cec9ae4cdf3.png)![スクリーンショット 2016-02-25 13.43.01.png](https://qiita-image-store.s3.amazonaws.com/0/95187/699aaea9-2ada-e7bc-bcd8-11b4c554c334.png)
  User loginuser = (User) session.getAttribute("loginuser");

  List<User> users = (List<User>) session.getAttribute("users");

  User user = (User) request.getAttribute("user");
  String user_id = user == null ? "" : String.valueOf(user.getUserId());
  String user_name = user == null ? "" : String.valueOf(user.getUserName());
  String password = user == null ? "" : String.valueOf(user.getPassword());

  String title = (String) request.getAttribute("title");

  String err = (String) request.getAttribute("err");
  String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
  integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
  crossorigin="anonymous">
<title>ログイン成功</title>
</head>
<body>
  <div class="container" style="margin-top: 20px;">
    <%
      if (err != null) {
    %>
    <div class="alert alert-danger" role="alert">
      <%=err%>
    </div>
    <%
      }
    %>

    <%
      if (msg != null) {
    %>
    <div class="alert alert-success" role="alert">
      <%=msg%>
    </div>
    <%
      }
    %>
    <p><%=title%></p>
    ようこそ！！
    <%=loginuser.getUserName()%>
    さん <br />

    <form action="UserServlet" method="POST">
      <div class="form-group">
        <label for="user_name">名前:</label> <input type="text" id="user_name"
          name="user_name" class="form-control" style="width: 200px;"
          value="<%=user_name%>"> <label for="name">名前:</label>
      </div>
    </form>
    <table class="table table-striped mt-4">
      <tr>
        <th>ID</th>
        <th>名前</th>
        <th>パスワード</th>
        <th>処理</th>
      </tr>
      <c:forEach var="u" items="${users}" varStatus="status">
        <tr>
          <td>${u.userId }</td>
          <td>${u.userName}</td>
          <td>${u.password}</td>
          <td><a
            href="/WebSystemDemo/UserServlet?action=update&id=${u.userId }"
            class="btn btn-primary">更新</a> <a
            href="/WebSystemDemo/UserServlet?action=delete&id=${u.userId }"
            class="btn btn-danger" onclick="return confirm('削除してよろしいですか？');">削除</a>
          </td>
        </tr>
      </c:forEach>
    </table>

    <form method="GET" action="LoginServlet">
      <input type="submit" value="ログイン画面へ" style="margin: 5px">
    </form>
  </div>
</body>
</html>