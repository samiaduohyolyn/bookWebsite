<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ include file="check.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>book</title>
    <link href="css/book.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        function check() {
            if (confirm("确认已还？"))
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
    <li><a  href="a_user.jsp">用户管理</a></li>
    <li><a  href="a_book.jsp">图书管理</a></li>
    <li><a style="background: rgba(217, 125, 103, 0.73)" href="a_history.jsp">图书借还</a></li>
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
                        <td colspan="9" align="center"><p style="font-size: 30px">图书借还纪录</p></td>
                    </tr>
                    <tr style="background-color: rgba(217, 125, 103, 0.73)">
                        <th class="td1">图书编号</th>
                        <th class="td1">书名</th>
                        <th class="td1">用户名</th>
                        <th class="td1">借书日期</th>
                        <th class="td1">还书日期</th>
                        <th class="td1">是否已经归还</th>
                        <th class="td1">操作</th>
                    </tr>
                    <jsp:useBean id="bd" class="org.example.bookwebsite.myBean.DBcon"/>
                    <%
                        request.setCharacterEncoding("utf-8");
                        String id=request.getParameter("id");
                        String sql="select * from borrowbook where bookid like '%"+id+"%' ";
                        System.out.println(sql);
                        ResultSet rs = bd.getRs(sql);
                        while(rs.next()){
                    %>
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td><%= rs.getString(6)%></td>
                        <td><% if(Objects.equals(rs.getString(6), "否")) { %>
                            <a  class="modbuttom" href="Returnbook ?id=<%= rs.getString(1)%>" onclick="return  check()">已还</a>
                            <% }else{ %>
                            <a  class="delbuttom" href="Notbook ?id=<%= rs.getString(1)%>">未还</a>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </td>
        </tr>
    </table>
    <div class="foot">
        <a href="a_history.jsp"><button class="s">返回</button></a>
    </div>
</div>
</body>
</html>