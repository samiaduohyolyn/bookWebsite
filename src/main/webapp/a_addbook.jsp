<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java"
pageEncoding="UTF-8" %>
<%@ include file="check.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>book管理员界面</title>
    <link href="css/book.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript">
    function exit() {
        if (confirm("确认退出？"))
            return true;
        else return false;
    }
</script>
<body>
<ul>
    <li><a href="admin.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
    <li><a  href="a_user.jsp">用户管理</a></li>
    <li><a style="background: rgba(217, 125, 103, 0.73)" href="a_book.jsp">图书管理</a></li>
    <li><a href="a_history.jsp">图书借还</a></li>
    <li><a href="exit.jsp" onclick="return exit()">退出登录</a></li>
</ul>
<div class="box">
    <h1>添加新图书</h1>
    <br/>
    <div class="addtable1">
        <form action="Addbook" method="post">
            <table>
                <tr>
                    <td>编号：<input class="a" type="text" name="id" placeholder="000XXX" required></td>
                </tr>
                <tr>
                    <td>书名：<input class="a" type="text" name="name" placeholder="《XXX》" required></td>
                </tr>
                <tr>
                    <td>作者：<input class="a" type="text" name="writer" placeholder="XXX" ></td>
                </tr>
                <tr>
                    <td>价格：<input class="a" type="text" name="price" placeholder="XX.XX" ></td>
                </tr>
                <tr>
                    <td>类型：<input class="a" type="text" name="type" placeholder="XX" ></td>
                </tr>
                <tr>
                    <td>位置：<input class="a" type="text" name="floor" placeholder="X楼XX书架X层" ></td>
                </tr>
                <tr>
                    <td><input class="b" type="submit" value="添加"> <input class="b" type="reset" value="重置"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>