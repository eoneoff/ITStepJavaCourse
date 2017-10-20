<%@ page import="objects.User" %>
<%@ page import="objects.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="objects.Purchase" %>
<%@ page import="java.util.Set" %>
<%@ page import="objects.Article" %><%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 27.09.2017
  Time: 09:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Order> orders = (List<Order>) request.getAttribute("orders");%>
<html>
<head>
    <title>Заказы</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div style="padding: 15px;">
        <%for(Order o:orders){%>
            <table border="1">
            <tr>
                <td><%=o.getId()%></td>
                <td><%=o.getDate().toString()%></td>
                <td></td><td></td><td></td>
            </tr>
            <tr>
                <td><%=o.getUser().getId()%></td>
                <td><%=o.getUser().getName()%></td>
                <td><%=o.getUser().getLogin()%></td>
                <td></td><td></td>
            </tr>
            <%Set<Purchase> purchases = o.getPurchases();%>
            <%for(Purchase p:purchases){%>
            <tr>
                <%Article a = p.getArticle();%>
                <td><%=p.getId()%></td>
                <td><%=a.getId()%> <%=a.getName()%></td>
                <td><%=a.getPrice()%></td>
                <td><%=p.getQuantity()%></td>
            </tr>
            <%}%>
            <tr>
                <td>Всего</td><td></td>
                <td><%=o.getPrice()%></td><td></td>
            </tr>
            </table>
            <br><br>
        <%}%>
    </div>
</body>
</html>
