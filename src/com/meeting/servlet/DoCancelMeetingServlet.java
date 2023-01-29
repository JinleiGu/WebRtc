package com.meeting.servlet;

import com.meeting.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DoCancelMeetingServlet extends HttpServlet {
    private MeetingService meetingService = new MeetingService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mid = req.getParameter("mid");
        String canceledreason = req.getParameter("canceledreason");
        int i = meetingService.cancelMeeting(Integer.parseInt(mid), canceledreason);
        if (i == 1) {
            //取消成功
            resp.sendRedirect(req.getContextPath()+"/mybooking");
        }
    }
}
