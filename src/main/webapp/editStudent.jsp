<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name="", course="";

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:orcl","system","vishnu12");

    PreparedStatement ps =
      con.prepareStatement("SELECT name,course FROM student WHERE STUDENT_ID=?");
    ps.setInt(1,id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        name = rs.getString(1);
        course = rs.getString(2);
    }
    con.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>

<style>
body {
    margin: 0;
    height: 100vh;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #43cea2, #185a9d);
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-container {
    background: #ffffff;
    width: 360px;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(0,0,0,0.25);
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-weight: 600;
    color: #555;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
    transition: 0.3s;
}

.form-group input:focus {
    border-color: #43cea2;
    outline: none;
    box-shadow: 0 0 6px rgba(67,206,162,0.5);
}

button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #43cea2, #185a9d);
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 15px rgba(0,0,0,0.2);
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #185a9d;
    font-weight: 500;
}

.back-link:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="form-container">
    <h2>Update Student</h2>

    <form action="updateStudent" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Student Name</label>
            <input type="text" name="name" value="<%=name%>" required>
        </div>

        <div class="form-group">
            <label>Course</label>
            <input type="text" name="course" value="<%=course%>" required>
        </div>

        <button type="submit">Update Student</button>
    </form>

    <a class="back-link" href="viewStudents.jsp">⬅ Back to Students</a>
</div>

</body>
</html>
