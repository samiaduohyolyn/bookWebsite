<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ include file="check.jsp"%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>book</title>
    <link href="css/book.css" rel="stylesheet" type="text/css"/>
    <script>
        function redly() {
            if (confirm("确认借书？"))
                return true;
            else return false;
        }

        function exit() {
            if (confirm("确认退出？"))
                return true;
            else return false;
        }
    </script>
</head>
<body>
<ul>
    <li><a href="user.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
    <li><a href="b_book.jsp">查询图书</a></li>
    <li><a style="background: rgba(217, 125, 103, 0.73)" href="b_set.jsp">借阅图书</a></li>
    <li><a href="b_history.jsp">借阅纪录</a></li>
    <li><a href="exit.jsp" onclick="return exit()">退出登录</a></li>
</ul>
<div class="box">
    <%
    String name = (String) session.getAttribute("user");
    out.print("<h1>用户:" + name + "欢迎访问book图书管理系统</h1>");
    %>
    <br/>
    <table width="" border="0">
        <tr>
            <td valign="top">
                <table width="965px" border="0" cellpadding="0" cellspacing="0" class="table1">
                    <form action="borrowbook" method="post">
                        <tr>
                            <td colspan="9" align="center"><p style="font-size: 30px">借阅图书</p></td>
                        </tr>
                        <tr style="background-color: rgba(217, 125, 103, 0.73)">
                            <th class="td1">图书编号</th>
                            <th class="td1">图书名称</th>
                            <th class="td1">借书人</th>
                            <th class="td1">借书日期</th>
                            <th class="td1">最迟还书日期</th>
                        </tr>
                        <tr>
                            <td><input class="text" type="text" name="bookid"  placeholder="000001" required></td>
                            <td><input class="text" type="text" name="bookname"  placeholder="《百妖谱" required></td>
                            <td><input class="text" type="text" name="username"  value="<%= name %>" readonly></td>
                            <td><input class="text" type="text" name="begintime" value="<%String now=new SimpleDateFormat("yyyy-MM-dd").format(new Date());out.print(now);%>" required></td>
                            <td><input class="text" type="text" name="endtime"  placeholder="xxxx-xx-xx" required></td>
                        </tr>

                        <tr>
                            <td rowspan="2" colspan="5"><input class="b_history" type="submit" value="确定" onclick="return redly();"></td>
                        </tr>
                    </form>
                </table>
            </td>
        </tr>
    </table>
</div>
</body>
</html>