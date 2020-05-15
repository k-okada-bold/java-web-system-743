<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユー登録もどき</title>
</head>
<body>
	<form action="/example/FormSampleServlet" method="post">
		名前：<br> <input type="text" name="name"><br> 性別：<br>
		男<input type="radio" name="gender" value="0"> 女<input
			type="radio" name="gender" value="0"> <input type="submit"
			value="登録">
	</form>
</body>
</html>