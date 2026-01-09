<%@ page import="java.sql.*" %>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("../login.html");
    }

    String month = "JAN-2026";
%>

<html>
<head>
<title>View Students</title>
<style>
table{
    width:100%;
    border-collapse:collapse;
}
th,td{
    padding:10px;
    border:1px solid #ccc;
    text-align:center;
}
th{ background:#1976d2; color:white; }
.paid{ color:green; font-weight:bold; }
.pending{ color:red; font-weight:bold; }
a.btn{
    padding:5px 10px;
    background:#1976d2;
    color:white;
    text-decoration:none;
    border-radius:4px;
}
</style>
</head>

<body>
<h2>Student List</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Course</th>
    <th>Fee Status</th>
    <th>Actions</th>
</tr>

<%
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:orcl","system","vishnu12");

    String sql =
      "SELECT s.STUDENT_ID , s.name, s.course, " +
      "CASE WHEN f.student_id IS NULL THEN 'Pending' ELSE 'Paid' END status " +
      "FROM student s LEFT JOIN fee f " +
      "ON s.STUDENT_ID=f.student_id AND f.month=?";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, month);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>

<td class="<%=rs.getString(4).equals("Paid")?"paid":"pending"%>">
    <%=rs.getString(4)%>
</td>

<td>
<a class="btn" href="editStudent.jsp?id=<%=rs.getInt(1)%>">Update</a>
<a class="btn" href="feeHistory.jsp?id=<%=rs.getInt(1)%>">Fees</a>
</td>
</tr>
<%
    }
    con.close();
}catch(Exception e){ e.printStackTrace(); }
%>
</table>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>
