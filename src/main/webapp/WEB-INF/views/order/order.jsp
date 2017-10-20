<%@ page import="objects.Purchase" %>
<%@ page import="objects.Basket" %>
<%@ page import="objects.Order" %><%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 23.09.2017
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="basket" class="objects.Basket" scope="session"/>
<html>
<head>
    <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
    <!-- FlexSlider -->
    <script src="/js/imagezoom.js"></script>
    <script defer src="/js/jquery.flexslider.js"></script>
    <link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen" />

    <script>
        // Can also be used with $(document).ready()
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
    <!-- //FlexSlider-->
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- check-out -->
<div class="check">
    <div class="container">
        <div class="col-md-3 cart-total">
            <hr class="featurette-divider">
            <ul class="total_price">
                <li class="last_price"> <h4>ВСЕГО</h4></li>
                <li class="last_price"><span><%=basket.getTotalPrice()%></span></li>
                <div class="clearfix"> </div>
            </ul>
            <div class="clearfix"></div>
            <a class="order" href="/order/action">Оплатить заказ</a>
        </div>
        <div class="col-md-9 cart-items">
            <h1>Моя корзина (<%=basket.getQuantity()%>)</h1>
            <%
                int i=1;
                for(Purchase p:basket){
            %>
            <script>$(document).ready(function(c) {
                $('.close<%=i%>').on('click', function(c){
                    $('.cart-header<%=i%>').fadeOut('slow', function(c){
                        $('.cart-header<%=i%>').remove();
                    });
                });
            });
            </script>
            <div class="cart-header<%=i%>">
                <div class="close<%=i%>"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div>
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc">
                        <img src="/images/<%=p.getArticle().getId()%>/grid.jpg" class="img-responsive" alt=""/>
                    </div>
                    <div class="cart-item-info">
                        <ul class="qty">
                            <li><p>Количество : <%=p.getQuantity()%></p></li>
                            <li><p>Цена : &#8372;<%=p.getArticle().getPrice()%></p></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
          <%++i;}%>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>