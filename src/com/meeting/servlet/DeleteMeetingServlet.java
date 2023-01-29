package com.meeting.servlet;

import com.meeting.bean.Department;
import com.meeting.bean.Employee;
import com.meeting.bean.EmployeeDep;
import com.meeting.service.DepartmentService;
import com.meeting.service.EmployeeService;
import com.meeting.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DeleteMeetingServlet extends HttpServlet {
    private MeetingService meetingService = new MeetingService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mid = req.getParameter("mid");
        int i = meetingService.delete(Integer.parseInt(mid));
        if(i == 1){
            req.getRequestDispatcher("/mybooking").forward(req, resp);
        }
    }
}
