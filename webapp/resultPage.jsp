<%@ page import="Bean.Raw" %>
<%@ page import="Bean.RawBean" %><%--
<%@ page import="Bean.RawBean" %><%--
  Created by IntelliJ IDEA.
  User: romay
  Date: 30.11.2022
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/ResultPageStyle.css">
</head>
<body>
    <div id="container">
        <div id="lastGetting">
            <%Raw nowZapros = (Raw)request.getSession().getAttribute("nowZapros"); %>
            <p>
            <h2>your X was</h2> <label> <%= nowZapros.getX()%> </label>
            </p>
            <p>
            <h2>your Y was</h2> <label> <%= nowZapros.getY()%> </label>
            </p>
            <p>
            <h2>your R was</h2> <label> <%= nowZapros.getR()%> </label>
            </p>
            <p>
            <h2>your result</h2> <label> <%= nowZapros.getHitFact()%> </label>
            </p>

        </div>

        <div id="goBackSite">
            <form action="/lab2/main"  method="post">
                <input type = "hidden" name = "typeQuest" value="goToJSP">
                <p></p>
                <button type="submit">go back to question Form</button>
            </form>
        </div>

        <div id="clear"></div>

        <jsp:include page="resultTable.jsp" />


    </div>

</body>
</html>
