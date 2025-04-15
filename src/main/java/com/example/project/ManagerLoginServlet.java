package com.example.project;

import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM manager WHERE name = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                response.sendRedirect("ManagerDashboard.jsp"); // ✅ Use relative path
            } else {
                response.getWriter().println("<html><body><h1>Invalid Credentials</h1></body></html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

