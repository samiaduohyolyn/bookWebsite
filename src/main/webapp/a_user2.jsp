<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ include file="check.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>book</title>
    <link href="css/book.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        function checkDel() {
            if (confirm("确认删除？"))
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
    <li><a href="admin.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
    <li><a style="background: rgba(217, 125, 103, 0.73)" href="a_user.jsp">用户管理</a></li>
    <li><a  href="a_book.jsp">图书管理</a></li>
    <li><a href="a_history.jsp">图书借还</a></li>
    <li><a href="exit.jsp" onclick="return exit()">退出登录</a></li>
</ul>

<div class="box">
    <%
        String name = (String) session.getAttribute("user");
        out.print("<h1>管理员:" + name + "欢迎访问book图书管理系统</h1>");
    %>
    <br/>
    <table width="" border="0">
        <tr>
            <td valign="top">
                <table  width="965px" border="0" cellpadding="0" cellspacing="0" class="table1">
                    <tr>
                        <td colspan="3" align="center"><span style="font-size: 30px">用户管理</span>
                        </td>
                    </tr>
                    <tr style="background-color: rgba(217, 125, 103, 0.73)">
                        <th class="td1">用户名</th>
                        <th class="td1">密码</th>
                        <th class="td1">操作</th>
                    </tr>
                    <jsp:useBean id="bd" class="org.example.bookwebsite.myBean.DBcon"/>
                    <%
                        request.setCharacterEncoding("utf-8");
                        String username=request.getParameter("name");
                        String sql="select * from users where UserName like '%"+username+"%' ";
                        System.out.println(sql);
                        ResultSet rs = bd.getRs(sql);
                        while(rs.next()){
                    %>
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><a class="modbuttom" href="a_upuser.jsp?id=<%= rs.getString(1)%>">修改</a>
                            <a  class="delbuttom" href="Deluser?id=<%= rs.getString(1)%>" onclick="return  checkDel()">删除</a>
                        </td>
                    </tr>
                    <% } %>

                </table>
            </td>
        </tr>
    </table>
    <div class="foot">
        <a href="a_user.jsp"><button class="s">返回</button></a>
    </div>
</div>
</body>
</html>