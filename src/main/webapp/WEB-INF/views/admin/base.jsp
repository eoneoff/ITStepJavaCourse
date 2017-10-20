<%@ page import="objects.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 25.09.2017
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Article> articles = (List<Article>) request.getAttribute("articles");%>
<html>
<head>
    <title>Управление базой</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div style="padding: 15px;">
    <table border = "1">
        <%for (Article a: articles){%>
            <tr>
                <form method="post">
                    <td><%=a.getId()%><input name ="id" type="hidden" value="<%=a.getId()%>"></td>
                    <td><input type="text" name = "name" value="<%=a.getName()%>"></td>
                    <td><input type="text" name="price" value="<%=a.getPrice()%>"></td>
                    <td><input type="submit" formaction="/admin/base/update" value="Изменить"></td>
                    <td><input type="submit" formaction="/admin/base/delete" value="Удалить"></td>
                </form>
            </tr>
        <%}%>
    </table>
    <br>
    Новый товар<br>
    <form method="post" action="/admin/base/insert">
        <input type="text" name="name">
        <input type="text" name="price">
        <input type="submit" name="new" value="Сохранить">
    </form>
    <br>
    <form method="post" action="/uploadPicture" enctype="multipart/form-data">
        <input type="file" name="picture">
        <input type="submit" value="upload">
    </form>
    </div>
</body>
</html>
