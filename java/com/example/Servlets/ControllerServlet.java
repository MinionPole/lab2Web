package com.example.Servlets;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ControllerServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
        response.sendRedirect("/lab2/jsp_page");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("typeQuest") != null){
            response.sendRedirect("/lab2/jsp_page");
        }
        else
            request.getRequestDispatcher("/resultPage").forward(request, response);
        //getServletContext().getNamedDispatcher("resultServlet").forward(request, response);
    }



    public void destroy() {
    }
}