package com.meeting.servlet;

import com.meeting.bean.Department;
import com.meeting.bean.Employee;
import com.meeting.bean.EmployeeDep;
import com.meeting.bean.Meeting;
import com.meeting.dao.DepartmentDao;
import com.meeting.service.DepartmentService;
import com.meeting.service.EmployeeService;
import com.meeting.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

public class DoEditEmployeeServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();
    private DepartmentService departmentService = new DepartmentService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empid = req.getParameter("empid");
        String employeename = req.getParameter("employeename");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String departmentid = req.getParameter("Departmentid");
        //获取当前登录的用户对象
        Employee employee = new Employee(Integer.parseInt(empid), employeename, username, phone, email, Integer.parseInt(departmentid), password);
        int i = employeeService.update(employee);
        if(i == 1)
        {
            resp.sendRedirect(req.getContextPath() + "/searchemp");
        }

    }
}