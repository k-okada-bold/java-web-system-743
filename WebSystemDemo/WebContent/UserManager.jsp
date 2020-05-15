<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  //セッションスコープからインスタンスを取得![スクリーンショット 2016-02-25 13.43.01.png](https://qiita-image-store.s3.amazonaws.com/0/95187/871a7c0f-3793-0d1b-e24e-4cec9ae4cdf3.png)![スクリーンショット 2016-02-25 13.43.01.png](https://qiita-image-store.s3.amazonaws.com/0/95187/699aaea9-2ada-e7bc-bcd8-11b4c554c334.png)
  User loginuser = (User) session.getAttribute("loginuser");

  List<User> users = (List<User>) request.getAttribute("users");

  User user = (User) request.getAttribute("user");
  String user_id = user == null ? "" : String.valueOf(user.getUserId());
  String user_name = user == null ? "" : String.valueOf(user.getUserName());
  String password = user == null ? "" : String.valueOf(user.getPassword());
  String passwordMsk = password.replaceAll("[a-z]+", "*");

  String title = (String) request.getAttribute("title");
  title = title == null ? "": title;
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
    さん <br /><br />

    <form action="UserServlet" method="POST">
      <div class="form-group">
      <table class="table table-striped mt-4">
      <tr>
        <th><label for="user_id">ユーザID:</label></th>
        <th><label for="user_name">名前:</label></th>
        <th><label for="password">パスワード:</label></th>
        <th>処理</th>
      </tr>
      <tr>
      <td>
         <input type="text" id="user_id"
          name="user_id" class="form-control" style="width: 200px;"
          value="<%=user_id%>" <%=!user_id.isEmpty()? "readonly=\"readonly\"" : "" %>>
      </td>
      <td>
         <input type="text" id="user_name"
          name="user_name" class="form-control" style="width: 200px;"
          value="<%=user_name%>"></td>
      <td>
          <input type="password" id="password"
          name="password" class="form-control" style="width: 200px;"
          value="<%=password%>"></td>
      <td>
        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-certificate" aria-hidden="true"></span> <%=user_id.isEmpty()?"登録":"更新確定" %></button>
        <input type="hidden" name="mode" style="display: none;" value="<%=user_id.isEmpty()?"insert":"update" %>">
      </td></tr>
        </table>
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
          <td>${u.password.replaceAll("[ -~]+", "********")}</td>
          <td>
          <c:choose>
            <c:when test = "${u.userId != loginuser.userId}">
              <a
            href="/WebSystemDemo/UserServlet?action=update&user_id=${u.userId }"
            class="btn btn-primary"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 更新</a>
            <a
            href="/WebSystemDemo/UserServlet?action=delete&user_id=${u.userId }"
            class="btn btn-danger" onclick="return confirm('削除してよろしいですか？');"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 削除</a>
            </c:when>
          </c:choose>
           </td>
        </tr>
      </c:forEach>
    </table>

    <form method="GET" action="LoginServlet">
      <button type="submit" class="btn btn-warning" aria-label="Left Align"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> ログイン画面へ</button>
    </form>
  </div>
</body>
</html>