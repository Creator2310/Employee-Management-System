<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.project.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Admin Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
    }

    /* Top Navigation Bar */
    .navbar {
      background-color: #333;
      color: white;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .navbar .logo {
      font-size: 22px;
      font-weight: bold;
      letter-spacing: 1px;
    }

    .navbar .nav-links a {
      color: white;
      text-decoration: none;
      margin-left: 20px;
      font-size: 16px;
    }

    .navbar .nav-links a:hover {
      text-decoration: underline;
    }

    /* Sidebar */
    .sidebar {
      width: 250px;
      background-color: #333;
      height: 100vh;
      position: fixed;
      top: 58px; /* below navbar */
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

    /* Main content */
    .content {
      margin-left: 250px;
      margin-top: 58px; /* below navbar */
      padding: 20px;
      width: calc(100% - 250px);
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
      display: inline-block;
      text-align: center;
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

<!-- Top Navigation Bar -->
<div class="navbar">
  <div class="logo">EMS</div>
  <div class="nav-links">
    <a href="admin.jsp">Admin Login</a>
    <a href="manager.jsp">Manager Login</a>
    <a href="employee.jsp">Employee Login</a>
  </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
  <a href="javascript:void(0)" onclick="showList('admin')">Admin List</a>
  <a href="javascript:void(0)" onclick="showList('manager')">Manager List</a>
  <a href="AdminLogoutServlet">Logout</a>
</div>

<!-- Content -->
<div class="content">
  <div class="dashboard-container">
    <h1>Welcome to the Admin Dashboard</h1>

    <!-- Admin List -->
    <div id="adminList" class="active">
      <h2>Admin List</h2>
      <table>
        <tr>
          <th>Username</th>
          <th>Email</th>
          <th>Action</th>
        </tr>
        <%
          try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM admin";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
              String username = rs.getString("name");
              String email = rs.getString("email");
        %>
        <tr>
          <td><%= username %></td>
          <td><%= email %></td>
          <td><a href="updateadmin.jsp?id=<%= rs.getString("id") %>">Edit</a></td>
        </tr>
        <%
            }
          } catch (Exception e) {
            e.printStackTrace();
          }
        %>
      </table>
    </div>

    <!-- Manager List -->
    <div id="managerList" class="inactive">
      <h2>Manager List</h2>
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
              String id = rs.getString("id");
              String name = rs.getString("name");
              String email = rs.getString("email");
              String department = rs.getString("department");
        %>
        <tr>
          <td><%= name %></td>
          <td><%= email %></td>
          <td><%= department %></td>
          <td>
            <a href="updatemanager.jsp?id=<%= id %>">Edit</a> |
            <a href="DeleteManagerServlet?id=<%= id %>">Delete</a>
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
        <button onclick="window.location.href='managerreg.jsp'">Add New Manager</button>
      </div>
    </div>
  </div>
</div>

<script>
  function showList(listType) {
    document.getElementById('adminList').classList.toggle('active', listType === 'admin');
    document.getElementById('adminList').classList.toggle('inactive', listType !== 'admin');
    document.getElementById('managerList').classList.toggle('active', listType === 'manager');
    document.getElementById('managerList').classList.toggle('inactive', listType !== 'manager');
  }
</script>

</body>
</html>
