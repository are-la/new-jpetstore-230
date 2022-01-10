<%--
  Created by IntelliJ IDEA.
  User: 28011
  Date: 2021/10/30
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
</div>

<div id="Footer">

    <div id="PoweredBy">&nbsp<a href="www.csu.edu.cn">www.csu.edu.cn</a>
    </div>

    <div id="Banner">
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<script>
    var app = new Vue({
        el: '#SearchBox',
        data: {
            click: null,
            keyword: '',
            isOpen: false,
            arrowCounter: -1,
            products: [{
                "productId": "K9-BD-01",
                "categoryId": "DOGS",
                "name": "Bulldog",
                "description": "\u003cimage src\u003d\"images/dog2.gif\"\u003eFriendly dog from England"
            }, {
                "productId": "K9-RT-02",
                "categoryId": "DOGS",
                "name": "Labrador Retriever",
                "description": "\u003cimage src\u003d\"images/dog5.gif\"\u003eGreat hunting dog"
            }]
        },
        mounted() {
            document.addEventListener('click', this.handleClickOutside);
        },
        destroyed() {
            document.removeEventListener('click', this.handleClickOutside);
        },
        updated() {
            if (this.click)
            {
                this.$el.submit();
            }
        },
        methods: {
            getProducts() {
                fetch("/searchapi?product="+this.keyword).then(res => res.json())
                .then(data => {
                    console.log(data)
                    this.products = data;
                })
            },
            handleClickOutside(event) {
                if (!this.$el.contains(event.target)) {
                    this.isOpen = false;
                }
            },
            changed() {
                this.getProducts();
                this.isOpen = true;
            },
            setResult(name) {
                this.keyword = name;
                this.isOpen = false;
                this.$el.submit();
                this.click = true;
            },
            onArrowDown() {
                if (this.arrowCounter < this.products.length) {
                    this.arrowCounter = this.arrowCounter + 1;
                }
            },
            onArrowUp() {
                if (this.arrowCounter > 0) {
                    this.arrowCounter = this.arrowCounter - 1;
                }
            },
            onEnter() {
                this.keyword = this.products[this.arrowCounter].name;
                this.arrowCounter = -1;
                this.isOpen = false;
            }
        }
    })
</script>
</body>
</html>
