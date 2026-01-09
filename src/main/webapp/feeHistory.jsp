<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fee History</title>

<style>
body {
    margin: 0;
    min-height: 100vh;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #f7971e, #ffd200);
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    background: #ffffff;
    width: 600px;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(0,0,0,0.25);
}

.container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    text-align: center;
}

th {
    background: #f7971e;
    color: white;
}

tr:nth-child(even) {
    background: #f9f9f9;
}

tr:hover {
    background: #fff3cd;
}

.amount {
    font-weight: bold;
    color: #2e7d32;
}

.back-link {
    display: block;
    margin-top: 20px;
    text-align: center;
    text-decoration: none;
    color: #f7971e;
    font-weight: 600;
}

.back-link:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="container">
    <h2>Fee History</h2>

    <table>
        <tr>
            <th>Month</th>
            <th>Amount</th>
            <th>Payment Date</th>
        </tr>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(
 "jdbc:oracle:thin:@localhost:1521:orcl","system","vishnu12");

PreparedStatement ps =
 con.prepareStatement("SELECT month,amount,PAYMENT_DATE FROM fee WHERE student_id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td class="amount"> <%=rs.getInt(2)%></td>
            <td><%=rs.getDate(3)%></td>
        </tr>
<%
}
con.close();
%>
    </table>

    <a class="back-link" href="viewStudents.jsp">Back to Students</a>
</div>

</body>
</html>
