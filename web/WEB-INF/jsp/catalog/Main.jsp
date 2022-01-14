<%--
  Created by IntelliJ IDEA.
  User: 28011
  Date: 2021/10/30
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>

<%@ include file="../common/IncludeTop.jsp" %>
<div id="Main" style="padding: 15px 35px;">
    <div id="Sidebar">
        <div id="SidebarContent" style="font-size: 20px">
            <a href="viewCategory?categoryId=FISH"><img src="images/fish_icon.gif" style="width: 40px"/></a>
            <br><br/> Saltwater, Freshwater <br/><br>
            <a href="viewCategory?categoryId=DOGS"><img src="images/dogs_icon.gif" style="width: 45px"/></a>
            <br><br/> Various Breeds <br/><br>
            <a href="viewCategory?categoryId=CATS"><img src="images/cats_icon.gif" style="width: 40px"/></a>
            <br><br/>Various Breeds, Exotic Varieties <br/><br>
            <a href="viewCategory?categoryId=REPTILES"><img src="images/reptiles_icon.gif" style="width: 70px"/></a>
            <br><br/> Lizards, Turtles, Snakes <br/><br>
            <a href="viewCategory?categoryId=BIRDS"><img src="images/birds_icon.gif" style="width: 50px"/></a>
            <br><br/> Exotic Varieties
        </div>
    </div>

    <div id="MainImage">

        <ul class="menu" v-show="show" :style="style">
            <p class="title">{{name}}</p>
            <li v-for="(product, i) in products" :key="i">
                <a :href="'/viewProduct?productId='+product.productId">{{ product.name }}</a>
            </li>
        </ul>

        <div id="myCarousel" class="carousel slide"
             style="position:absolute;left: 630px;top: 130px;width: 730px;height: 330px">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
         <%--       <li data-target="#myCarousel" data-slide-to="5"></li>   --%>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="/images/background.gif" style="width: 730px;height: 330px" alt="Cats"
                         href="viewCategory?categoryId=CATS" v-on:mousemove="mouseMove"
                         v-on:mouseenter="showMenu('cats')" >
                </div>
                <div class="item">
                    <img src="/images/mainback1.jpg" style="width: 730px;height: 330px" alt="Dogs"
                         href="viewCategory?categoryId=DOGS" v-on:mousemove="mouseMove"
                         v-on:mouseenter="showMenu('dogs')" >
                </div>
                <div class="item">
                    <img src="/images/bird.png" alt="Birds" style="width: 730px;height: 330px"
                         href="viewCategory?categoryId=BIRDS" v-on:mousemove="mouseMove"
                         v-on:mouseenter="showMenu('birds')" >
                </div>
                <div class="item">
                    <img src="/images/fish1.jpeg" alt="Fish" style="width: 730px;height: 330px"
                         href="viewCategory?categoryId=FISH" v-on:mousemove="mouseMove"
                         v-on:mouseenter="showMenu('fish')" >
                </div>
                <div class="item">
                    <img src="/images/reptiles1.jpeg" alt="Reptiles" style="width: 730px;height: 330px"
                         href="viewCategory?categoryId=REPTILES" v-on:mousemove="mouseMove"
                         v-on:mouseenter="showMenu('reptiles')" >
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div id="Separator">&nbsp;</div>
    <div style="position: absolute;left: 630px;top:490px;width: 300px">
        <%--       <marquee scrolldelay=500 scrollamount=40 driction="up" size="1">Welcome!</marquee>--%>
        <br>
        <h4 data-toggle="collapse" data-target="#demo_1">We have a lot of animals!</h4>
        <div id="demo_1" class="collapse">
            Saltwater-fish, Freshwater-fish,Various Breeds of dogs and cats,Lizards, Turtles, Snakes...
        </div>


    </div>
    <div style="position: absolute;right: 220px;top:490px;width: 300px">
        <br>
        <h4 data-toggle="collapse" data-target="#demo_2">We can get the almost places in this word!</h4>
        <div id="demo_2" class="collapse">
            every places in China, almost places besides China, such as American, England, France and Canada.
        </div>
    </div>
    <p></p>
    <p></p>


</div>


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

<script>
    $('#myCarousel').carousel('cycle');
</script>

<%@ include file="../common/IncludeBottom.jsp" %>