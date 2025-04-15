package com.example.project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/RemoveManagerServlet")
public class RemoveManagerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "DELETE FROM manager WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.getWriter().println("Manager removed successfully!");
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                response.getWriter().println("Failed to remove manager!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
