<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ include file="check.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>book管理员界面</title>
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
  <li><a style="background: rgba(217, 125, 103, 0.73)" href="admin.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
  <li><a href="a_user.jsp">用户管理</a></li>
  <li><a href="a_book.jsp">图书管理</a></li>
  <li><a href="a_history.jsp">图书借还</a></li>
  <li><a href="exit.jsp" onclick="return exit()">退出登录</a></li>
</ul>

  <div class="box">
  <%
    String name = (String) session.getAttribute("user");
    out.print("<h1>管理员:"+name+"欢迎访问book图书管理系统</h1>");
    %>
    <br/>
      <h2>·用户管理：查询用户基本信息、修改、添加、删除用户信息</h2>
      <h2>·图书管理：查询图书基本信息、修改、添加、删除图书信息</h2>
      <h2>·图书借还：展现所有图书借阅和归还信息、可设置是否归还</h2>
  </div>

</body>
</html>