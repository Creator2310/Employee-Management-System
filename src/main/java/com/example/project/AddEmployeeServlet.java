package com.example.project;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String department = request.getParameter("department");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "INSERT INTO employee (name, email, password, department) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, department);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("/ManagerDashboard.jsp");
                response.getWriter().println("Employee added successfully!");
            } else {
                response.getWriter().println("Failed to add employee!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
