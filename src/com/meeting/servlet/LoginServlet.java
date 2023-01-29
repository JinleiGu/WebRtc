package com.meeting.servlet;

import com.meeting.service.EmployeeService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LoginServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int login = employeeService.login(username, password);
        if (login == 0) {
            req.setAttribute("error", "用户待审批，请稍候");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if (login == 1) {
            req.getSession().setAttribute("loginUser", employeeService.getLoginUser());
            resp.sendRedirect(req.getContextPath() + "/notifications");
        } else if (login == 2) {
            req.setAttribute("error", "用户审批未通过，请重新注册");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if (login == 3) {
            req.setAttribute("error", "用户名或者密码输入错误，请重新登录");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if (login == -1) {
            req.setAttribute("error", "账号已注销，登陆失败，请联系管理员");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
