package com.example.Servlets;

import Bean.Raw;
import Bean.RawBean;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ResultServlet extends HttpServlet {
    private String message;

    boolean ODZX(double x){
        return -4 <= x && x <= 4;
    }
    boolean ODZY(double y){
        return -5 <= y && y <= 5;
    }
    boolean ODZR(double r){
        return 1 <= r && r <= 3;
    }
    String checkerOblast(double x, double y, double r){
        boolean b1 = true && (x >= 0)  && (y >= 0) && (y <= -x + r);
        boolean b2 = true && (x >= 0) && (y <= 0) && (x * x + y*y <= r * r);
        boolean b3 = true && (x >= -r/2) && (x <= 0) && (y >= -r) && (y <= 0);
        if(b1 || b2 || b3){
            return "yoy got shot";
        }
        return "loser";
    }

    public void init() {
        message = "Hello World!";
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        double x = Double.parseDouble(request.getParameter("X"));
        double y = Double.parseDouble(request.getParameter("Y"));
        double r = Double.parseDouble(request.getParameter("RSelector"));

        if(ODZX(x) && ODZY(y) && ODZR(r)){
            String resultStr = checkerOblast(x, y, r);
            //out.println(temp);
            RawBean list = (RawBean)request.getSession().getAttribute("table");
            if(list == null)
                list = new RawBean();

            Raw nowZapros = new Raw(x, y, r, resultStr);
            list.getRaws().add(nowZapros);

            request.getSession().setAttribute("table", list);
            request.getSession().setAttribute("nowZapros", nowZapros);

            request.getRequestDispatcher("resultPage.jsp").forward(request, response);
        }
        else{
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }



    public void destroy() {
    }
}