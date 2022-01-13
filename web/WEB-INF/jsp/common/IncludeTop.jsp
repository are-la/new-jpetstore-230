<%--
  Created by IntelliJ IDEA.
  User: 28011
  Date: 2021/10/30
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
          media="screen"/>
    <link rel="stylesheet" href="css/main.css">
    <script src="js/jquery.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta name="generator"
          content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org"/>
    <title>My JPetStore</title>
    <meta content="text/html; charset=windows-1252"
          http-equiv="Content-Type"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <style>
        #searchBox {
            position: relative;
            display: inline-block;
        }

        .autocomplete-results {
            list-style: none;
            position: absolute;
            top: 75%;
            line-height: 1em;
            text-align: left;
            margin: 0;
            padding: 0;
            z-index: 999;
            color: #000;
            border: 1px solid #d4d4d4;
        }

        .autocomplete-result {
            padding: 10px;
            cursor: pointer;
            background: #fff;
            border-bottom: 1px solid #d4d4d4;
        }

        .autocomplete-result:hover {
            background-color: #e9e9e9;
        }

        #search-input {
            padding: 10px;
        }

        .autocomplete-result.is-active {
            background-color: DodgerBlue !important;
            color: #ffffff;
        }
    </style>
</head>

<body>

<header id="header">
    <div class="form-inline" id="MyMenu">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="main">Our Jpetstore</a>
            </div>
            <div style="padding: 10px 100px">
                <ul class="nav nav-pills">
                    <li class="active">
                        <a href="main">
                            <span class="glyphicon glyphicon-home"></span>&nbsp;main
                        </a>
                    </li>
                    <li>
                        <c:if test="${sessionScope.account != null}">
                            <a href="viewDCart">
                                <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;cart
                                <span class="badge pull-right">3</span>
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${sessionScope.account == null}">
                            <a href="viewAccount?msg=logIn">
                                <span class="glyphicon glyphicon-ok"></span>&nbsp;login
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${sessionScope.account != null}">
                            <a href="signOut">
                                <span class="glyphicon glyphicon-remove"></span>&nbsp;sign out
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${sessionScope.account != null}">
                            <a href="viewAccount?msg=Edit">
                                <span class="glyphicon glyphicon-user"></span>&nbsp;My Account
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${sessionScope.account != null}">
                            <a href="listOrders">
                                <span class="glyphicon glyphicon-usd"></span>&nbsp;My Orders
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${sessionScope.account != null}">
                            <a href="viewLog">
                                <span class="glyphicon glyphicon-list-alt"></span>&nbsp;My Log
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <a href="../help.html">
                            <span class="glyphicon glyphicon-wrench"></span>&nbsp;help
                        </a>
                    </li>
                </ul>

                <div id="Search">
                    <div id="SearchContent">
                        <form action="search" method="post" id="searchBox">
                            <div class="form-inline">
                                <input class="form-control" id="search-input" @keydown.down="onArrowDown"
                                       @keydown.up="onArrowUp"
                                       @keydown.enter="onEnter" :value="keyword" v-model="keyword" v-on:input="changed"
                                       autocomplete="off"
                                       placeholder="Input Product" type="text" name="keyword" size="14"/>
                                <ul
                                        v-show="isOpen"
                                        class="autocomplete-results"
                                >
                                    <li
                                            v-for="(product, i) in products"
                                            :key="i"
                                            @click="setResult(product.name)"
                                            class="autocomplete-result"
                                            :class="{ 'is-active': i === arrowCounter }"
                                    >
                                        {{ product.name }}
                                    </li>
                                </ul>
                                <input class="btn btn-info btn-sm" type="submit" name="searchProducts" value="Search"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>

<div id="Content">
    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH" style="font-size: x-large;color: #222222;text-decoration: none">
            fish
        </a>
        &nbsp;
        <a href="viewCategory?categoryId=DOGS" style="font-size: x-large;color: #222222;text-decoration: none">
            dog
        </a>
        &nbsp;
        <a href="viewCategory?categoryId=REPTILES" style="font-size: x-large;color: #222222;text-decoration: none">
            reptiles
        </a>
        &nbsp;
        <a href="viewCategory?categoryId=CATS" style="font-size: x-large;color: #222222;text-decoration: none">
            cat
        </a>
        &nbsp;
        <a href="viewCategory?categoryId=BIRDS" style="font-size: x-large;color: #222222;text-decoration: none">
            bird
        </a>
    </div>
<%--<%@ include file="../common/IncludeBottom.jsp"%>--%>