package com.app.controller;

import com.app.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class TestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection con = DBConnection.getConnection();

        if (con != null) {
            out.println("<h2>Oracle DB Connected Successfully</h2>");
        } else {
            out.println("<h2>DB Connection Failed</h2>");
        }
    }
}
