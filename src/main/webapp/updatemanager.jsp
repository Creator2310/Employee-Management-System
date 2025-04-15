<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.project.DatabaseConnection" %>
<%
    String id = request.getParameter("id");
    String name = "", email = "", department = "";
    try (Connection conn = DatabaseConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM manager WHERE id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            department = rs.getString("department");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Manager</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #444;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"] {
            width: 90%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #2575fc;
            outline: none;
        }

        input[type="submit"] {
            width: 90%;
            padding: 12px;
            background-color: #2575fc;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #1f66c1;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Update Manager</h2>
    <form action="UpdateManagerServlet" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" required><br><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" value="<%= department %>" required><br><br>

        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>
