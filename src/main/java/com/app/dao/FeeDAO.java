package com.app.dao;

import com.app.model.Fee;
import com.app.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class FeeDAO {

    public boolean addFee(Fee f) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO FEE VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, f.getFeeId());
            ps.setInt(2, f.getStudentId());
            ps.setInt(3, f.getAmount());
            ps.setDate(4, new java.sql.Date(f.getPaymentDate().getTime()));
            ps.setString(5, "JAN-2026");

            status = ps.executeUpdate() > 0;
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
