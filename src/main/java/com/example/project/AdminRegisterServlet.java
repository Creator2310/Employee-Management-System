package com.example.project;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "INSERT INTO admin (name, password, email) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, password);
            stmt.setString(3, email);
            stmt.executeUpdate();

            // Redirect to index.jsp after successful registration
            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><body><h1>Error during registration!</h1></body></html>");
        }
    }
}
