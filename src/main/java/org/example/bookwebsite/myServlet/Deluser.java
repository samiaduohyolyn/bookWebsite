package org.example.bookwebsite.myServlet;
//删除用户

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Deluser")
public class Deluser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String id=request.getParameter("id");
        String sql="delete from users where UserName='"+id+"'";
        System.out.println(sql);
        DBcon db=new DBcon();
        int n=db.Exec(sql);
        if(n>0){
            out.println("<script language ='javascript'>alert('删除成功！')</script>");
        }else {
            out.println("<script language ='javascript'>alert('删除失败！')</script>");
        }
        out.println("<script language ='javascript'>location='a_user.jsp'</script>");
        db.closeCon();

    }
}
