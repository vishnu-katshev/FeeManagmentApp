<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("../login.html");
    }

    int totalStudents = 0;
    int paidCount = 0;
    int pendingCount = 0;

    String month = "JAN-2026";   // later make dynamic

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:orcl", "system", "vishnu12");

        Statement st = con.createStatement();

        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM student");
        if (rs1.next()) totalStudents = rs1.getInt(1);

        ResultSet rs2 = st.executeQuery(
          "SELECT COUNT(DISTINCT student_id) FROM fee WHERE month='"+month+"'");
        if (rs2.next()) paidCount = rs2.getInt(1);

        pendingCount = totalStudents - paidCount;

        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<style>
body{
    font-family: Arial;
    background:#f4f6f8;
}
.container{
    width:700px;
    margin:40px auto;
    background:#fff;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px #ccc;
}
.card{
    padding:15px;
    margin:10px 0;
    border-radius:8px;
    font-size:18px;
}
.blue{ background:#e3f2fd; }
.green{ background:#e8f5e9; }
.red{ background:#ffebee; }

.actions a{
    display:inline-block;
    margin:10px;
    padding:10px 15px;
    background:#1976d2;
    color:white;
    text-decoration:none;
    border-radius:6px;
}
</style>
</head>

<body>
<div class="container">
    <h2>Welcome, <%=session.getAttribute("username")%></h2>

    <div class="card blue">Total Students : <b><%=totalStudents%></b></div>
    <div class="card green"> Fees Collected : <b><%=paidCount%></b></div>
    <div class="card red"> Pending Fees : <b><%=pendingCount%></b></div>

    <div class="actions">
        <a href="addStudent.html">Add Student</a>
        <a href="viewStudents.jsp">View Students</a>
        <a href="addFee.html">Add Fee</a>
        <a href="logout">Logout</a>
    </div>
</div>
</body>
</html>
