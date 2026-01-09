package com.app.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse res)
throws IOException {

    int id = Integer.parseInt(req.getParameter("id"));
    String name = req.getParameter("name");
    String course = req.getParameter("course");

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(
          "jdbc:oracle:thin:@localhost:1521:xe","system","oracle");

        PreparedStatement ps =
          con.prepareStatement("UPDATE students SET name=?, course=? WHERE id=?");
        ps.setString(1,name);
        ps.setString(2,course);
        ps.setInt(3,id);
        ps.executeUpdate();

        con.close();
        res.sendRedirect("viewStudents.jsp");
    }catch(Exception e){ e.printStackTrace(); }
}
}
