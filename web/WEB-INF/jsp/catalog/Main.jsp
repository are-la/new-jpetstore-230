<%--
  Created by IntelliJ IDEA.
  User: 28011
  Date: 2021/10/30
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>

<%@ include file="../common/IncludeTop.jsp"%>

<div id="Welcome">
    <div id="WelcomeContent">
        Welcome to MyPetStore!
    </div>
</div>

<div id="Main">
    <div id="Sidebar">
        <div id="SidebarContent">
            <a href="viewCategory?categoryId=FISH"><img src="images/fish_icon.gif" /></a>
            <br/> Saltwater, Freshwater <br/>
            <a href="viewCategory?categoryId=DOGS"><img src="images/dogs_icon.gif" /></a>
            <br /> Various Breeds <br />
            <a href="viewCategory?categoryId=CATS"><img src="images/cats_icon.gif" /></a>
            <br /> Various Breeds, Exotic Varieties <br />
            <a href="viewCategory?categoryId=REPTILES"><img src="images/reptiles_icon.gif" /></a>
            <br /> Lizards, Turtles, Snakes <br />
            <a href="viewCategory?categoryId=BIRDS"><img src="images/birds_icon.gif" /></a>
            <br /> Exotic Varieties
        </div>
    </div>

    <div id="MainImage">
        <div id="MainImageContent">
            <map name="estoremap">
                <area alt="Birds" v-on:mousemove="mouseMove" v-on:mouseenter="showMenu('birds')" v-on:mouseleave="close" coords="72,2,280,250" href="viewCategory?categoryId=BIRDS" shape="rect" />
                <area alt="Fish" v-on:mousemove="mouseMove" v-on:mouseenter="showMenu('fish')" coords="2,180,72,250" href="viewCategory?categoryId=FISH" shape="rect" />
                <area alt="Dogs" v-on:mousemove="mouseMove" v-on:mouseenter="showMenu('dogs')" coords="60,250,130,320" href="viewCategory?categoryId=DOGS" shape="rect" />
                <area alt="Reptiles" v-on:mousemove="mouseMove" v-on:mouseenter="showMenu('reptiles')" coords="140,270,210,340" href="viewCategory?categoryId=REPTILES" shape="rect" />
                <area alt="Cats" v-on:mousemove="mouseMove" v-on:mouseenter="showMenu('cats')" coords="225,240,295,310" href="viewCategory?categoryId=CATS" shape="rect" />
                <area alt="Birds" v-on:mousemove="mouseMove" v-on:mouseenter="showMenu('birds')" coords="280,180,350,250" href="viewCategory?categoryId=BIRDS" shape="rect" />
            </map>
            <img height="355" src="images/splash.gif" align="middle" usemap="#estoremap" width="350" />
        </div>
        <ul class="menu" v-show="show" :style="style">
            <p class="title">{{name}}</p>
            <li v-for="(product, i) in products" :key="i">
                <a :href="'/viewProduct?productId='+product.productId">{{ product.name }}</a>
            </li>
        </ul>
    </div>
    <div id="Separator">&nbsp;</div>
</div>
<style>
    .menu {
        text-align: left;
        position: absolute;
        list-style: none;
        padding: 0;
        z-index: 999;
        border-radius: 0.5rem;
        background: #fff;
        width: 20%;
        filter: drop-shadow(0 4px 3px rgba(0, 0, 0, 0.07)) drop-shadow(0 2px 2px rgba(0, 0, 0, 0.06));
    }
    .menu .title {
        font-weight: bold;
        padding: 1em 16px;
        text-transform: uppercase;
        font-size: 11px;
        margin: 0;
    }
    /*.menu li {*/
    /*    padding: 1em;*/
    /*}*/
    .menu li a, a:visited {
        display: block;
        padding: 1em;
        color: #000;
    }
    .menu li a:hover {
        color: white;
        text-decoration: none;
        font-weight: bold;
    }
    .menu li:first-child {
        border-radius: 0.5rem;
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
    }
    .menu li:last-child {
        border-radius: 0.5rem;
        border-top-left-radius: 0px;
        border-top-right-radius: 0px;
    }
    .menu li:hover {
        background: #1976D2;
        cursor: pointer;
    }
</style>
<%@ include file="../common/IncludeBottom.jsp"%>