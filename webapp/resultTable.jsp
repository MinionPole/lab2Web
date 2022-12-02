<%@ page import="Bean.Raw" %><%--
  Created by IntelliJ IDEA.
  User: romay
  Date: 30.11.2022
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="footerSite" class = "footerSite">
    <jsp:useBean id="table" class = "Bean.RawBean" scope="session"/>
    <div class="answerBlock">X</div>
    <div class="answerBlock">Y</div>
    <div class="answerBlock">R</div>
    <div class="answerBlock">Result</div>
    <div class="deltaBlock"></div>

    <%
        for(int i = table.getRaws().size() - 1;i >= 0;i--){
            out.println("<div class=answerBlock>" + table.getRaws().get(i).getX() + "</div>");
            out.println("<div class=answerBlock>" + table.getRaws().get(i).getY() + "</div>");
            out.println("<div class=answerBlock>" + table.getRaws().get(i).getR() + "</div>");
            out.println("<div class=answerBlock>" + table.getRaws().get(i).getHitFact() + "</div>");
            out.println("<div class=deltaBlock></div>");
        }
    %>

</div>