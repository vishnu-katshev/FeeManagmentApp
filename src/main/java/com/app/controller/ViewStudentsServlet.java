package com.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.StudentDAO;
import com.app.model.Student;

@WebServlet("/viewStudents")
public class ViewStudentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        StudentDAO dao = new StudentDAO();
        List<Student> list = dao.getAllStudents();

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        out.println("<html><body>");
        out.println("<h2>Student List</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Phone</th><th>Course</th></tr>");

        for (Student s : list) {
            out.println("<tr>");
            out.println("<td>" + s.getStudentId() + "</td>");
            out.println("<td>" + s.getName() + "</td>");
            out.println("<td>" + s.getPhone() + "</td>");
            out.println("<td>" + s.getCourse() + "</td>");
            out.println("</tr>");
        }

        out.println("</table>");
        out.println("</body></html>");
    }
}

