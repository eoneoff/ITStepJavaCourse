<%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 23.09.2017
  Time: 08:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="reg-form">
        <div class="container">
            <div class="reg">
                <h3>Зарегистрируйтесь сейчас</h3>
                <p>Добро пожаловать. Пожалуйста, заполните поля ниже</p>
                <form action="/register/action">
                    <ul>
                        <li class="text-info">Имя: </li>
                        <li><input type="text" name = "screenname" value=""></li>
                    </ul>
                    <ul>
                        <li class="text-info">Логин: </li>
                        <li><input type="text" name = "login" value=""></li>
                    </ul>
                    <ul>
                        <li class="text-info">Пароль: </li>
                        <li><input type="password" name="password" value=""></li>
                    </ul>
                    <ul>
                        <li class="text-info">Подтвердите пароль:</li>
                        <li><input type="password" name="confPassword" value=""></li>
                    </ul>
                    <input type="submit" value="Зарегистрируйтесь">
                    <p class="click">Нажимя на эту кнопку, вы соглашаетесь на условия  нашего <a href="#">Пользовательствого Соглашения</a></p>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
