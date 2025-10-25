package com.eazycart;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/submit-contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Handle GET request gracefully
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the Contact page if accessed via GET
        response.sendRedirect("Contact.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Set attributes to show on success page
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("message", message);

        RequestDispatcher dispatcher = request.getRequestDispatcher("contact-success.jsp");
        dispatcher.forward(request, response);
    }
}
