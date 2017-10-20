<%@ page import="objects.Article" %>
<%@ page import="java.util.List" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
    <jsp:include page="/WEB-INF/views/common/declaration.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<jsp:include page="/WEB-INF/views/common/carousel.jsp"/>

<div class="shop-grid">
    <div class="container">
        <%List<Article> articles = (List<Article>)request.getAttribute("articles");%>
        <%for(Article a : articles){%>
            <div class="col-md-4 grid-stn simpleCart_shelfItem">
                <!-- normal -->
                <div class="ih-item square effect3 bottom_to_top">
                    <div class="bottom-2-top">
                        <div class="img"><img src="images/<%=a.getId()%>/grid.jpg" alt="/" class="img-responsive gri-wid"></div>
                        <div class="info">
                            <div class="pull-left styl-hdn">
                                <h3><%=a.getName()%></h3>
                            </div>
                            <div class="pull-right styl-price">
                                <p><a  href="/quickadd/<%=a.getId()%>" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">&#8372; <%=a.getPrice()%></span></a></p>
                            </div>
                            <div class="clearfix"></div>
                        </div></div>
                </div>
                <!-- end normal -->
                <div class="quick-view">
                    <a href="/articles/<%=a.getId()%>">Подробнее</a>
                </div>
            </div>
        <%}%>
        <div class="clearfix"></div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>