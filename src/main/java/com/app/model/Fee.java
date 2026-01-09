package com.app.model;

import java.util.Date;

public class Fee {
    private int feeId;
    private int studentId;
    private int amount;
    private Date paymentDate;

    public int getFeeId() { return feeId; }
    public void setFeeId(int feeId) { this.feeId = feeId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getAmount() { return amount; }
    public void setAmount(int amount) { this.amount = amount; }

    public Date getPaymentDate() { return paymentDate; }
    public void setPaymentDate(Date paymentDate) { this.paymentDate = paymentDate; }
}
