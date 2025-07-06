<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>book登录</title>
    <link href="css/login.css" type="text/css" rel="stylesheet">
</head>
<body>

<div class="box">
    <form method="post" action="Emp">
    <span class="top">登录</span><br/>
    <span class="top1">USER LOGIN</span>
    <div class="input">
        <p> <span>账号：</span>
            <input type="text" name="user" placeholder="用户名 " required/>
        </p>
        <p> <span>密码：</span>
            <input type="password" name="pwd" placeholder="密码"  required/>
        </p>
    </div>
    <input type="submit" value="登录">
</form>
    <hr/>
    <div class="sign">
        <span> ——— &nbsp; 没有账号请先<a href="regitesr.jsp">注册</a> &nbsp; ———</span><br/>
    </div>
    <hr/>
</div>
</body>
</html>