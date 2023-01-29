package com.meeting.servlet;

import com.google.gson.Gson;
import com.meeting.bean.Employee;
import com.meeting.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class GetEmpByDepIdServlete extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String depid = req.getParameter("depid");
        List<Employee> list = employeeService.getEmpByDepId(Integer.parseInt(depid));
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().write(new Gson().toJson(list));
    }
}
