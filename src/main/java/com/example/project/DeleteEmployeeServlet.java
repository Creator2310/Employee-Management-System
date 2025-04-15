package com.example.project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("id");

        if (employeeId != null) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String query = "DELETE FROM employee WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, employeeId);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("ManagerDashboard.jsp"); // Redirect back to the manager dashboard
                } else {
                    response.getWriter().println("Error: Unable to delete employee.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.getWriter().println("Invalid employee ID.");
        }
    }
}

