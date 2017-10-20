<%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 22.09.2017
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Войти</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="login">
        <div class="container">
            <div class="login-grids">
                <div class="col-md-6 log">
                    <h3>Войти</h3>
                    <div class="strip"></div>
                    <p>Добро пожаловать. Пожалуйста введите ваши данные</p>
                    <form method="post" action="login/action">
                        <h5>Логин:</h5>
                        <input type="text" name ="login" value="">
                        <h5>Пароль:</h5>
                        <input type="password" name="password" value=""><br>
                        <input type="submit" value="Войти">

                    </form>
                    <a href="#">Forgot Password ?</a>
                </div>
                <div class="col-md-6 login-right">
                    <h3>Регистрация нового пользователя</h3>
                    <div class="strip"></div>
                    <p>Создав учетную запись в нашем магазине, вы сможете быстрее совершать заказы, указывать несколько адресов доставки, просматривать и отслежвать заказы в личном кабитене и многое другое.</p>
                    <a href="/register" class="button">Создать учетнкую запись</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
