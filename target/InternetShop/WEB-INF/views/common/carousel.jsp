<%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 28.09.2017
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header-end">
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="./images/shoe3.jpg" alt="...">
                    <div class="carousel-caption car-re-posn">
                        <h3>AirMax</h3>
                        <h4>Любовь с первого шага</h4>
                        <span class="color-bar"></span>
                    </div>
                </div>
                <div class="item">
                    <img src="./images/shoe1.jpg" alt="...">
                    <div class="carousel-caption car-re-posn">
                        <h3>AirMax</h3>
                        <h4>Любовь с первого шага</h4>
                        <span class="color-bar"></span>
                    </div>
                </div>
                <div class="item">
                    <img src="./images/shoe2.jpg" alt="...">
                    <div class="carousel-caption car-re-posn">
                        <h3>AirMax</h3>
                        <h4>Любовь с первого шага</h4>
                        <span class="color-bar"></span>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left car-icn" aria-hidden="true"></span>
                <span class="sr-only">Назад</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right car-icn" aria-hidden="true"></span>
                <span class="sr-only">Дальше</span>
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="feel-fall">
    <div class="container">
        <div class="pull-left fal-box">
            <div class=" fall-left">
                <h3>Любовь</h3>
                <img src="images/f-l.png" alt="/" class="img-responsive fl-img-wid">
                <p>Вдохновление и инновации<br> для спортсменов всего мира</p>
                <span class="fel-fal-bar"></span>
            </div>
        </div>
        <div class="pull-right fel-box">
            <div class="feel-right">
                <h3>Первый шаг</h3>
                <img src="images/f-r.png" alt="/" class="img-responsive fl-img-wid">
                <p>Вдохновление и инновации<br> для спортсменов всего мира</p>
                <span class="fel-fal-bar2"></span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
