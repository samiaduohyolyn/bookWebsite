package org.example.bookwebsite.myServlet;
//注册功能

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/regitesr")
public class regitesr extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        DBcon con =new DBcon();
        String UserName=request.getParameter("user");
        String pwd=request.getParameter("pwd");
        String sql = "insert into users values('"+UserName+"','"+pwd+"')";
        System.out.println(sql);
        int n=con.Exec(sql);
        if(n>0){
            out.println("<script language ='javascript'>alert('注册成功!')</script>");
        }else {
            out.println("<script language ='javascript'>alert('注册失败!')</script>");
        }
        out.println("<script language ='javascript'>location='login.jsp'</script>");
        con.closeCon();
    }
}