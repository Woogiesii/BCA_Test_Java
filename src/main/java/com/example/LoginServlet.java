package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String USER_ID = "user";
    private static final String PASSWORD = "password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        if (USER_ID.equals(userId) && PASSWORD.equals(password)) {
            request.getSession().setAttribute("userId", userId);
            response.sendRedirect("welcome");
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}
