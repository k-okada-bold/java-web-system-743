<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>ログイン画面</title>
</head>
<body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <form method="POST" action="LoginServlet" style="margin: 5px; padding: 5px;">
        <span class="label label-primary">ユーザーID：</span>
        <input type="text" name="user_id" style="margin: 5px;" />
        <br/>
        <span class="label label-primary">パスワード：</span>
        <input type="password" name="password" style="margin: 5px;">
        <br/>
        <button type="submit" class="btn btn-success" aria-label="Left Align"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> ログイン</button>
    </form>
</body>
</html>