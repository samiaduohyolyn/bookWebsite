<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ include file="check.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>book用户界面</title>
    <link href="css/book.css" rel="stylesheet" type="text/css" />
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
    <li><a style="background: rgba(217, 125, 103, 0.73)" href="user.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
    <li><a href="b_book.jsp">查询图书</a></li>
    <li><a href="b_set.jsp">借阅图书</a></li>
    <li><a href="b_history.jsp">借阅纪录</a></li>
    <li><a href="exit.jsp" onclick="return exit()">退出登录</a></li>
</ul>

<div class="box">
    <%
    String name = (String) session.getAttribute("user");
    out.print("<h1>用户:"+name+"欢迎访问book图书管理系统</h1>");
    %>
    <br/>
    <h2>·查询图书：查询图书基本信息</h2>
    <h2>·借阅图书：借书</h2>
    <h2>·借阅纪录：查询本人借阅图书的信息、还书</h2>
</div>

</body>
</html>