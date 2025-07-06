<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>book注册中心</title>
    <link href="css/register.css" type="text/css" rel="stylesheet">
</head>
<body>
<form action="regitesr" method="post">
<div class="box">
    <span class="top">用户注册</span>
    <span class="top1">REGITESR</span>
    <table style="margin-top: 20px">
        <tr>
            <td style=" font-size: 20px; width: 40%;text-align: right">用户名：</td>
            <td style="width: 60%"><input type="text" name="user" required/></td>
        </tr>
        <tr>
            <td style=" font-size: 20px; width: 40%;text-align: right">密码：</td>
            <td style="width:60%"> <input type="password" name="pwd" required/></td>
        </tr>
    </table>
    <input type="submit" value="注册">
</div>
</form>
</body>
</html>