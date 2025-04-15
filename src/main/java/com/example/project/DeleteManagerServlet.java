package com.example.project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteManagerServlet")
public class DeleteManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String managerId = request.getParameter("id"); // Get the manager's ID from the query parameter

        if (managerId != null) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String query = "DELETE FROM manager WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, managerId); // Set the ID of the manager to be deleted

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("AdminDashboard.jsp"); // Redirect back to the admin dashboard
                } else {
                    response.getWriter().println("Error: Unable to delete manager.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.getWriter().println("Invalid manager ID.");
        }
    }
}
