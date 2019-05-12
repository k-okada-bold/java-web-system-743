<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User"%>
<%@ page import="java.util.List"%>
<%
    //セッションスコープからインスタンスを取得![スクリーンショット 2016-02-25 13.43.01.png](https://qiita-image-store.s3.amazonaws.com/0/95187/871a7c0f-3793-0d1b-e24e-4cec9ae4cdf3.png)![スクリーンショット 2016-02-25 13.43.01.png](https://qiita-image-store.s3.amazonaws.com/0/95187/699aaea9-2ada-e7bc-bcd8-11b4c554c334.png)
  String name = (String)session.getAttribute("name");

    List<User> users = (List<User>) session.getAttribute("users");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログイン成功</title>
</head>
<body style="margin: 5px">
    ようこそ！！
    <br/>
    <form method="GET" action="LoginServlet">
      <table border="1"  style="margin: 5px">
      <tr>
        <th>ユーザID</th>
        <th>ユーザ名</th>
        <th>パスワード</th>
      </tr>
    <c:forEach var="user" items="${users}">
      <tr>
        <td>${user.userId }</td>
        <td>${user.userName}</td>
        <td>${user.password }</td>
      </tr>
    </c:forEach>
  </table>
        <input type="submit" value="ログイン画面へ" style="margin: 5px">
    </form>
</body>
</html>