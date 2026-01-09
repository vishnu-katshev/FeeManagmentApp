package com.app.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.StudentDAO;
import com.app.model.Student;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        Student s = new Student();
        s.setStudentId(Integer.parseInt(req.getParameter("id")));
        s.setName(req.getParameter("name"));
        s.setPhone(req.getParameter("phone"));
        s.setCourse(req.getParameter("course"));
        s.setJoinDate(new java.util.Date());

        boolean result = new StudentDAO().addStudent(s);

        res.getWriter().println(result ? "Student Added" : "Error");
    }
}
