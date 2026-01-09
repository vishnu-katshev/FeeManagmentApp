package com.app.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.FeeDAO;
import com.app.model.Fee;

@WebServlet("/addFee")
public class AddFeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        Fee f = new Fee();
        f.setFeeId(Integer.parseInt(req.getParameter("feeId")));
        f.setStudentId(Integer.parseInt(req.getParameter("studentId")));
        f.setAmount(Integer.parseInt(req.getParameter("amount")));
        f.setPaymentDate(new java.util.Date());

        boolean result = new FeeDAO().addFee(f);

        res.getWriter().println(result ? "Fee Added" : "Error");
    }
}

