package org.example.bookwebsite.myServlet;
//楠岃瘉鐧诲綍

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.bookwebsite.myBean.DBcon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet("/Emp")
public class Emp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("user");
        String psw = request.getParameter("pwd");
        DBcon bd = new DBcon();
        String sql = "select * from users where username='" + name + "'and password='" + psw + "'";
        System.out.println(sql);

        ResultSet rs = bd.getRs(sql);

        try {
            if (rs.next()) {
                if (Objects.equals(name, "admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", name);
                    RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                    rd.forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", name);
                    RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
                    rd.forward(request, response);
                }

            } else {
                out.print("<script language='javascript'>alert('登录失败!')</script>");
                out.print("<script language='javascript'>location='login.jsp'</script>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

