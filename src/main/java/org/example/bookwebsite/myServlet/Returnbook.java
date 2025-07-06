package org.example.bookwebsite.myServlet;
//设置图书已还


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/Returnbook ")
public class Returnbook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String id=request.getParameter("id");
        String sql="update  borrowbook set condi='是' where bookid='"+id+"'";
        String sql1="update  books set condi='否' where bookid='"+id+"'";
        System.out.println(sql);
        DBcon db=new DBcon();
        db.Exec(sql1);
        int n=db.Exec(sql);
        if(n>0){
            out.println("<script language ='javascript'>alert('设置成功！')</script>");
        }else {
            out.println("<script language ='javascript'>alert('设置失败！')</script>");
        }
        out.println("<script language ='javascript'>location='a_history.jsp'</script>");
        db.closeCon();

    }
}

