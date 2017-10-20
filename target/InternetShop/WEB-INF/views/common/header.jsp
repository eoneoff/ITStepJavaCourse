<%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 18.09.2017
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="basket" class="objects.Basket" scope="session"/>
<div class="header">
    <div class="container">
        <div class="header-top">
            <div class="logo">
                <a href="/">N-AIR</a>
            </div>
            <div class="login-bars">
                <%
                    String register="Зарегистрироваться";
                    String login = "Войти";
                    String loginHref = "/login";
                    if(basket.getUser()!=null)
                    {
                        register = (basket.getUser().getName()==null)?basket.getUser().getLogin():basket.getUser().getName();
                        login = "Выйти";
                        loginHref = "/logout";
                    }
                %>
                <a class="btn btn-default log-bar" href="/register" role="button"><%=register%></a>
                <a class="btn btn-default log-bar" href="<%=loginHref%>" role="button"><%=login%></a>
                <%if (basket.getUser()!=null && basket.getUser().isAdmin()){%>
                <a class="btn btn-default log-bar" href="/admin" role="button">Консоль администратора</a>
                <%}%>
                <div class="cart box_1">
                    <a href="/order">
                        <h3>
                            <div class="total">
                                <span class="simpleCart_total">&#8372; <%=basket.getTotalPrice()%> </span>(<span id="simpleCart_quantity" class="simpleCart_quantity"><%=basket.getQuantity()%></span>)</div></h3>
                    </a>
                    <p><a href="/emptybasket" class="simpleCart_empty">Очистить корзину</a></p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!---menu-----bar--->
        <div class="header-botom">
            <div class="content white">
                <nav class="navbar navbar-default nav-menu" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="clearfix"></div>
                    <!--/.navbar-header-->


                    <!--/.navbar-collapse-->
                    <div class="clearfix"></div>
                </nav>
                <!--/.navbar-->
                <div class="clearfix"></div>
            </div>
            <!--/.content--->
        </div>
        <!--header-bottom-->
    </div>
</div>
