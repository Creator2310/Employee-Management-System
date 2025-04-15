<%@ page import="com.example.project.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #333;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 30px;
        }

        .sidebar a {
            padding: 12px 16px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            border-bottom: 1px solid #444;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        .dashboard-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #333333;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #dddddd;
            text-align: left;
        }

        th, td {
            padding: 10px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .active {
            display: block;
        }

        .inactive {
            display: none;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <a href="javascript:void(0)" onclick="showList('manager')">Manager Information</a>
    <a href="javascript:void(0)" onclick="showList('employee')">Employee Information</a>
    <a href="ManagerLogoutServlet">Logout</a>
</div>

<!-- Content -->
<div class="content">
    <div class="dashboard-container">
        <h1>Welcome to the Manager Dashboard</h1>

        <!-- Manager Info -->
        <div id="managerInfo" class="active">
            <h2>Manager Information</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
                <%
                    try (Connection conn = DatabaseConnection.getConnection()) {
                        String query = "SELECT * FROM manager";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td>
                        <a href="UpdateManager.jsp?id=<%= rs.getString("id") %>">Update</a> |
                        <a href="DeleteManagerServlet?id=<%= rs.getString("id") %>">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>

        <!-- Employee Info -->
        <div id="employeeInfo" class="inactive">
            <h2>Employee Information</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
                <%
                    try (Connection conn = DatabaseConnection.getConnection()) {
                        String query = "SELECT * FROM employee";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td>
                        <a href="UpdateEmployee.jsp?id=<%= rs.getString("id") %>">Update</a> |
                        <a href="DeleteEmployeeServlet?id=<%= rs.getString("id") %>">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <div class="button-container">
                <button onclick="window.location.href='employeereg.jsp'">Add New Employee</button>
            </div>
        </div>
    </div>
</div>

<script>
    function showList(type) {
        document.getElementById("managerInfo").className = (type === 'manager') ? "active" : "inactive";
        document.getElementById("employeeInfo").className = (type === 'employee') ? "active" : "inactive";
    }
</script>

</body>
</html>
