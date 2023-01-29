package com.meeting.servlet;

import com.meeting.bean.Employee;
import com.meeting.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class ChangePasswordServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String newpwd = req.getParameter("new");
        int loginEmpId = ((Employee) req.getSession().getAttribute("loginUser")).getEmployeeid();
        int i = employeeService.changepwdById(loginEmpId, newpwd);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("<script language='javascript'>alert('修改成功');window.location.href='login.jsp';</script>");
        }
        else {
            out.write("修改失败");
        }
    }
}
