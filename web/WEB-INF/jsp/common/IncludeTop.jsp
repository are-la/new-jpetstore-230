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

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="images/logo-topbar.gif"/></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <c:if test="${sessionScope.account != null}">
                <a href="viewDCart">
                    <img align="middle" name="img_cart" src="images/cart.gif"/>
                </a>
            </c:if>
            <c:if test="${sessionScope.account != null}"><img align="middle" src="images/separator.gif"/></c:if>
            <c:if test="${sessionScope.account == null}"><a href="viewAccount?msg=logIn">Sign In</a></c:if>
            <c:if test="${sessionScope.account != null}"><img align="middle" src="images/separator.gif"/></c:if>
            <c:if test="${sessionScope.account != null}"><a href="signOut">Sign Out</a></c:if>
            <c:if test="${sessionScope.account != null}"><img align="middle" src="images/separator.gif"/></c:if>
            <c:if test="${sessionScope.account != null}"><a href="viewAccount?msg=Edit">My Account</a></c:if>
            <c:if test="${sessionScope.account != null}"><img align="middle" src="images/separator.gif"/></c:if>
            <c:if test="${sessionScope.account != null}"><a href="listOrders">My Order</a></c:if>
            <img align="middle" src="images/separator.gif"/>
            <c:if test="${sessionScope.account != null}"><a href="viewLog">My Log</a></c:if>

            <c:if test="${sessionScope.account != null}"><img align="middle" src="images/separator.gif"/></c:if>
            <a href="../help.html">?</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="search" method="post" id="searchBox">
                <input id="search-input" @keydown.down="onArrowDown"
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
                <input type="submit" name="searchProducts" value="Search"/>
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH">
            <img src="images/sm_fish.gif"/>
        </a> <img src="images/separator.gif"/>
        <a href="viewCategory?categoryId=DOGS">
            <img src="images/sm_dogs.gif"/>
        </a>
        <img src="images/separator.gif"/>
        <a href="viewCategory?categoryId=REPTILES">
            <img src="images/sm_reptiles.gif"/>
        </a> <img src="images/separator.gif"/>
        <a href="viewCategory?categoryId=CATS">
            <img src="images/sm_cats.gif"/>
        </a> <img src="images/separator.gif"/>
        <a href="viewCategory?categoryId=BIRDS">
            <img src="images/sm_birds.gif"/>
        </a>
    </div>

</div>

<div id="Content">
<%--<%@ include file="../common/IncludeBottom.jsp"%>--%>