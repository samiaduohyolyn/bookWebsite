package org.example.bookwebsite.myServlet;
//借书

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/borrowbook")
public class borrowbook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        DBcon con = new DBcon();

        String bookid = request.getParameter("bookid");
        String bookname= request.getParameter("bookname");
        String username = request.getParameter("username");
        String begintime = request.getParameter("begintime");
        String endtime = request.getParameter("endtime");

        String sql = "insert into borrowbook values('" + bookid + "','" + bookname + "','" + username + "','" + begintime + "','" + endtime + "','否')";
        String sql1="update  books set condi='是' where bookid='"+bookid+"'";
        System.out.println(sql);
        System.out.println(sql1);

        con.Exec(sql1);
        int n = con.Exec(sql);
        if (n > 0) {
            out.println("<script language ='javascript'>alert('借阅成功!')</script>");
        } else {
            out.println("<script language ='javascript'>alert('借阅失败!')</script>");
        }
        out.println("<script language ='javascript'>location='b_set.jsp'</script>");
        con.closeCon();
    }
}