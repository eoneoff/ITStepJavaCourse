<%@ page import="objects.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 26.09.2017
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<User> users = (List<User>)request.getAttribute("users");%>
<html>
<head>
    <title>Управление пользователями</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div style="padding: 15px;">
    <table border="1">
        <%for(User u: users){
            if(!u.isAdmin()){
        %>
        <tr>
            <td><%=u.getId()%></td>
            <td><%=u.getName()%></td>
            <td><%=u.getLogin()%></td>
            <td><%=u.getLogin()%></td>
            <td><%=u.getPassword()%></td>
            <td>
                <form method="post" action="/admin/users/delete">
                    <input type="hidden" value="<%=u.getId()%>">
                    <input type="submit" value="Удалить">
                </form>
            </td>
        </tr>
        <%}}%>
    </table>
    </div>
</body>
</html>
