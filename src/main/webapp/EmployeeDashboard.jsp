<%@ page import="com.example.project.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
        }

        /* Left-side slider */
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

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #333;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
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

        /* Style for active section */
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
    <a href="javascript:void(0)" onclick="showList('employee')">Employee Information</a>
    <a href="EmployeeLogoutServlet">Logout</a>
    <!-- You can add more links here as needed -->
</div>

<!-- Content -->
<div class="content">
    <div class="dashboard-container">
        <h1>Welcome to the Employee Dashboard</h1>

        <!-- Employee Information Section -->
        <div id="employeeInfo" class="active">
            <h2>Employee Information</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                </tr>
                <%
                    try (Connection conn = DatabaseConnection.getConnection()) {
                        String query = "SELECT * FROM employee";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();

                        if (!rs.isBeforeFirst()) { // Check if result set is empty
                            out.println("<h3>No employee data found.</h3>");
                        } else {
                            while (rs.next()) {
                                String name = rs.getString("name");
                                String email = rs.getString("email");
                                String department = rs.getString("department");
                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= department %></td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </table>
        </div>
    </div>
</div>

<script>
    // Function to show the selected section and hide others
    function showList(listType) {
        if (listType === 'employee') {
            document.getElementById('employeeInfo').classList.add('active');
            document.getElementById('employeeInfo').classList.remove('inactive');
        }
    }
</script>

</body>
</html>
