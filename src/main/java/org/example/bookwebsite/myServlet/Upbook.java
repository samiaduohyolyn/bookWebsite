package org.example.bookwebsite.myServlet;
//修改图书信息

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Upbook")
public class Upbook extends HttpServlet {
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
        String condi=request.getParameter("condi");
        String sql = "update books set bookname='"+name+"', writer='"+writer+"', " +
                "price='"+price+"',type='"+type+"',floor='"+floor+"',condi='"+condi+"' where bookid ='"+id+"'" ;
        System.out.println(sql);
        int n=con.Exec(sql);
        if(n>0){
            out.println("<script language ='javascript'>alert('修改成功!')</script>");
        }else {
            out.println("<script language ='javascript'>alert('修改失败!')</script>");
        }
        out.println("<script language ='javascript'>location='a_book.jsp'</script>");
        con.closeCon();
    }
}