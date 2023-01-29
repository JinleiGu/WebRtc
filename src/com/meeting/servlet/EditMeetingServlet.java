package com.meeting.servlet;

import com.meeting.bean.Meeting;
import com.meeting.bean.MeetingRoom;
import com.meeting.service.MeetingRoomService;
import com.meeting.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class EditMeetingServlet extends HttpServlet {
    private MeetingService meetingService = new MeetingService();
    private MeetingRoomService meetingRoomService = new MeetingRoomService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mid = req.getParameter("mid");
        Meeting meeting = meetingService.getMeetingDetailsByMeetingId(Integer.parseInt(mid));
        List<MeetingRoom> list = meetingRoomService.getAllMeetingRoom();
        req.setAttribute("mrs", list);
        req.setAttribute("m", meeting);
        req.getRequestDispatcher("/editmeeting.jsp").forward(req, resp);
    }
}
