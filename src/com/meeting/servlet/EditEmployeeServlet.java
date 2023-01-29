package com.meeting.servlet;

import com.meeting.bean.EmployeeDep;
import com.meeting.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EditEmployeeServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empid = req.getParameter("empid");
        EmployeeDep employeedep = employeeService.getEmpByEmpId(Integer.parseInt(empid));
        req.setAttribute("emp", employeedep);
        req.getRequestDispatcher("/editemployee.jsp").forward(req, resp);
    }
}
