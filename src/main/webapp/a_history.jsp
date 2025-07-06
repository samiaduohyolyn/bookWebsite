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

                    <jsp:useBean id="con" class="org.example.bookwebsite.myBean.DBcon"/>
                    <%
                        String page1 = request.getParameter("page"); //接受传递过来的页码
                        int p;       //记录当前的页码
                        int pagesize = 9;   //设定每一页显示记录的个数
                        int pagecount = 9;   //设定总共多少页
                        int rowcount = 0;   //设定一共有多少条记录
                        if (page1 == null) {
                            p = 1;
                        } else {
                            try {
                                p = Integer.parseInt(page1);
                            } catch (Exception e) {
                                p = 1;
                            }
                        }
                        String sql = "select * from borrowbook";
                        ResultSet rs = con.getRs(sql);
                        rs.last();//把指针指向最后一条记录
                        rowcount = rs.getRow();//获取的记号就是记录的总个数
                        //分两种情况考虑一共有多少页
                        if (rowcount % pagecount == 0) pagecount = rowcount / pagecount;
                        if (rowcount % pagecount != 0) pagecount = rowcount / pagecount + 1;
                        //对于当前页码的合法性判断，不能越界
                        if (p < 1) p = 1;
                        if (p > pagecount) p = pagecount;
                        sql = "select * from borrowbook limit " + (p - 1) * pagesize + "," + pagesize;
                        System.out.println(sql);
                        rs = con.getRs(sql);
                        while (rs.next()) {
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
                    <tr>
                        <td colspan="9" align="center">
                            <from action="a_history.jsp">
                                第<font style="color: red"><%=p %></font>页 共<font style="color: red"><%=pagecount %></font>页
                                    <% if (p > 1) { %>
                                <a href="a_history.jsp?page=1"><button>第一页</button></a>
                                <a href="a_history.jsp?page=<%=p-1%>"><button>上一页</button></a>
                                    <% }
                                    if (p < pagecount) { %>
                                <a href="a_history.jsp?page=<%=p+1%>"><button>下一页</button></a>
                                <a href="a_history.jsp?page=<%=pagecount %>"><button>最后一页</button></a>
                                    <% } %></from>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
    <form method="post" action="a_history2.jsp">
        <div class="foot">
            <input name="id" class="m" type="text" placeholder="输入图书id(例：000xxx)"><input  class="s" type="submit" value="查找">
        </div>
    </form>
</div>
</body>
</html>