package org.example.bookwebsite.myServlet;
//添加新用户
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Adduser")
public class Adduser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        DBcon con =new DBcon();
        String name=request.getParameter("username");
        String phone=request.getParameter("phone");
        String pwd=request.getParameter("pwd");
        String sql = "insert into users values('"+name+"','"+pwd+"','"+phone+"')";
        System.out.println(sql);
        int n=con.Exec(sql);
        if(n>0){
            out.println("<script language ='javascript'>alert('添加成功!')</script>");
        }else {
            out.println("<script language ='javascript'>alert('添加失败!')</script>");
        }
        out.println("<script language ='javascript'>location='a_user.jsp'</script>");
        con.closeCon();
    }
}