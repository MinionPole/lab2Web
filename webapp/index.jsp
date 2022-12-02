<%@ page import="Bean.Raw" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <title>web_Lab2</title>
    <link rel="stylesheet" href="css/myStyleToMainForm.css">
    <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.2.min.js"></script>
    <script src="js/script.js"></script>

</head>

<body>
<jsp:useBean id="nowZapros" class = "Bean.Raw" scope="session"/>
<div id="container">
    <div id = "headSite">
        <h2>Здравствуйте, это лабораторная работа Юнусова Романа P32102, по всем вопросам прошу обращаться в <a href = "https://vk.com/minionpole">личные сообщения</a><p></p>Номер группы P32102, Номер варианта 1617</h2>
    </div>

    <div id="pictureSite">
        <div id="stage-container" style="width: 100%; height: 550px;"></div>
    </div>

    <form id="parInForm" action="/main"  method="post">
        <div id="parameterSite">

            <div class="inputBlock">
                <label>ввод x</label>

                <p>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="-4">
                    <p></p>
                    <label>-4</label>
                </div>
                <div id = "firstRadio" class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="-3">
                    <p></p>
                    <label>-3</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="-2">
                    <p></p>
                    <label>-2</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="-1">
                    <p></p>
                    <label>-1</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="0">
                    <p></p>
                    <label>0</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="1">
                    <p></p>
                    <label>1</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="2">
                    <p></p>
                    <label>2</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="3">
                    <p></p>
                    <label>3</label>
                </div>
                <div class = radioBlock>
                    <input class = "radioDot" name="X" type="radio" value="4">
                    <p></p>
                    <label>4</label>
                </div>
                </p>


            </div>
            <div id = "yInputId" class="inputBlock">
                <label>ввод y</label>
                <p></p>
                <textarea id = "yInputIdField" name = "Y"></textarea>
            </div>

            <div class="inputBlock">
                <label>ввод R</label>
                <select name="RSelector" id = "selectingR">
                    <option name="R" value="1">1</option>
                    <option name="R" value="1.5">1.5</option>
                    <option name="R" value="2">2</option>
                    <option name="R" value="2.5">2.5</option>
                    <option name="R" value="3">3</option>
                </select>
            </div>

            <div class="inputBlock">
                <button type="submit">проверить точку</button>
            </div>
        </div>
    </form>

    <div id="clear"></div>

    <div id="footerSite" class = "footerSite">
    </div>

</div>
<script src="https://cdn.anychart.com/js/latest/graphics.min.js"></script>
<script src="js/graphic.js"></script>

<%
    String lastPoint = "";
    if (nowZapros != null && nowZapros.getX() != 0)
        lastPoint = "makeLastPoint(" + nowZapros.getX() + "," + nowZapros.getY() + ")";
%>
<%= "<script>" + lastPoint +  "</script>"%>


</body>


</html>
