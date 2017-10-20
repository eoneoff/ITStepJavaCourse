<%--
  Created by IntelliJ IDEA.
  User: e_1_o
  Date: 03.10.2017
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ups, something went wrong</title>
    <style type="text/css">
        body{
            font-family:Arial, Helvetica, sans-serif;
        }
        .wrap{
            width:1000px;
            margin:0 auto;
        }
        .logo{
            width:430px;
            position:absolute;
            top:25%;
            left:35%;
        }
        p a{
            color:#eee;
            font-size:13px;
            margin-left:30px;
            padding:5px;
            background:#FF3366;
            text-decoration:none;
            -webkit-border-radius:.3em;
            -moz-border-radius:.3em;
            border-radius:.3em;
        }
        p a:hover{
            color: #fff;
        }
        .footer{
            position:absolute;
            bottom:10px;
            right:10px;
            font-size:12px;
            color:#aaa;
        }
        .footer a{
            color:#666;
            text-decoration:none;
        }

    </style>
</head>
<body>
<div class="wrap">
    <div class="logo">
        <img src="images/404.png" alt=""  />
        <p><a href="/">Go back to Home</a></p>
    </div>
</div>


</body>
