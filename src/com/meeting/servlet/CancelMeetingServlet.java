package com.meeting.servlet;

import com.meeting.bean.Meeting;
import com.meeting.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class CancelMeetingServlet extends HttpServlet {
    private MeetingService meetingService = new MeetingService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mid = req.getParameter("mid");
        Meeting meeting = meetingService.getMeetingDetailsByMeetingId(Integer.parseInt(mid));
        req.setAttribute("m", meeting);
        req.getRequestDispatcher("/cancelmeeting.jsp").forward(req, resp);
    }
}
