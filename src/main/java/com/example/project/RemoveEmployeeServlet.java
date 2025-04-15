package com.example.project;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/RemoveEmployeeServlet")
public class RemoveEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "DELETE FROM employee WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.getWriter().println("Employee removed successfully!");
                response.sendRedirect("ManagerDashboard.jsp");
            } else {
                response.getWriter().println("Failed to remove employee!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
