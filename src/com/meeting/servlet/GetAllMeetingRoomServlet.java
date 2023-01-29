package com.meeting.servlet;

import com.meeting.bean.MeetingRoom;
import com.meeting.service.MeetingRoomService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class GetAllMeetingRoomServlet extends HttpServlet {
    private MeetingRoomService meetingRoomService = new MeetingRoomService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MeetingRoom> allMeetingRoom = meetingRoomService.getAllMeetingRoom();
        req.setAttribute("list", allMeetingRoom);
        req.getRequestDispatcher("/meetingrooms.jsp").forward(req, resp);
    }
}
