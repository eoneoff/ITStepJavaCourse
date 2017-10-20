<%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 25.09.2017
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Консоль администратора</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
    <div style="padding: 15px;">
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <form action="/admin/base">
            <input type="submit" value="Редактировать базу">
        </form>
        <br>
        <form action="/admin/users">
            <input type="submit" value="Пользователи">
        </form>
        <br>
        <form action="/admin/orders">
            <input type="submit" value="Заказы">
        </form>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </div>
</body>
</html>
