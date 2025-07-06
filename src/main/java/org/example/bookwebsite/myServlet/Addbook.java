package org.example.bookwebsite.myServlet;
//添加新书

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Addbook")
public class Addbook extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        DBcon con =new DBcon();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String writer=request.getParameter("writer");
        String price=request.getParameter("price");
        String type=request.getParameter("type");
        String floor=request.getParameter("floor");

        String sql = "insert into books values('"+id+"','"+name+"','"+writer+"','"+price+"','"+type+"','"+floor+"','否')";
        System.out.println(sql);

        int n=con.Exec(sql);
        if(n>0){
            out.println("<script language ='javascript'>alert('添加成功!')</script>");
        }else {
            out.println("<script language ='javascript'>alert('添加失败!')</script>");
        }
        out.println("<script language ='javascript'>location='a_book.jsp'</script>");
        con.closeCon();
    }
}