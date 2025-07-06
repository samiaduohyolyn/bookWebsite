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
    <li><a href="user.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
    <li><a style="background: rgba(217, 125, 103, 0.73)" href="b_book.jsp">查询图书</a></li>
    <li><a href="b_set.jsp">借阅图书</a></li>
    <li><a href="b_history.jsp">借阅纪录</a></li>
    <li><a href="exit.jsp" onclick="return exit()">退出登录</a></li>
</ul>
<%@ page import="java.sql.*,org.example.bookwebsite.myBean.DBcon" %>
<jsp:useBean id="bd" class="org.example.bookwebsite.myBean.DBcon"/>
<%
    response.setContentType("text/html;charset=utf-8");
    String id = request.getParameter("id");
    String sql = "select * from books where bookid ='" + id + "'";
    System.out.println(sql);
    ResultSet rs = bd.getRs(sql);
    while (rs.next()) {
%>
<div class="box">
    <h1>图书详情</h1>
    <br/>
    <div class="addtable2">
        <table>
            <tr>
                <td>图书编号：<input class="a" type="text" name="id" readonly value="<%=rs.getString(1) %>"></td>
            </tr>
            <tr>
                <td>图书名称：<input class="a" type="text" name="name" readonly value="<%=rs.getString(2) %>"></td>
            </tr>
            <tr>
                <td>作者名称：<input class="a" type="text" name="writer" readonly value="<%=rs.getString(3) %>"></td>
            </tr>
            <tr>
                <td>图书价格：<input class="a" type="text" name="price" readonly value="<%=rs.getString(4) %>"></td>
            </tr>
            <tr>
                <td>图书类型：<input class="a" type="text" name="type" readonly value="<%=rs.getString(5) %>"></td>
            </tr>
            <tr>
                <td>图书位置：<input class="a" type="text" name="floor" readonly value="<%=rs.getString(6) %>"></td>
            </tr>
            <tr>
                <td>是否借出：<input class="a" type="text" name="condi" readonly value="<%=rs.getString(7) %>"></td>
            </tr>
            <%
                }
                bd.closeCon();
            %>
            <tr>
                <td><a href="b_book.jsp">
                    <button class="c">返回</button>
                </a></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>