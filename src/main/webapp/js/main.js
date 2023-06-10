(function ($) {
    "use strict"

    // Mobile Nav toggle
    $('.menu-toggle > a').on('click', function (e) {
        e.preventDefault();
        $('#responsive-nav').toggleClass('active');
    })

    // Fix cart dropdown from closing
    $('.cart-dropdown').on('click', function (e) {
        e.stopPropagation();
    });

    // Navigation change


    $(document).ready(function () {
        var url = window.location.href;
        var navItem= url.split('/').pop();

        console.log(navItem)
        $('#main-nav li.nav-item').each(function () {
            var href = $(this).attr("id");
            console.log(href)
            if (navItem === href) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        })
    });

    // Home Banner Slick

    $(document).ready(function () {
        $('.swiper-wrapper').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            speed: 200,
            autoplay: true,
            infinite: true,
            dots: true,
            arrows: false
        });
    });

    $(document).ready(function () {
        $('.review-wrapper').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            speed: 200,
            autoplay: true,
            infinite: true,
            dots: false,
            arrows: false
        })
    });


    // Products Slick
    $('.products-slick').each(function () {
        var $this = $(this),
            $nav = $this.attr('data-nav');

        $this.slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            autoplay: true,
            infinite: true,
            speed: 300,
            dots: false,
            arrows: true,
            appendArrows: $nav ? $nav : false,
            responsive: [{
                breakpoint: 991,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                }
            },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                },
            ]
        });
    });

    // Products Widget Slick
    $('.products-widget-slick').each(function () {
        var $this = $(this),
            $nav = $this.attr('data-nav');

        $this.slick({
            infinite: true,
            autoplay: true,
            speed: 300,
            dots: false,
            arrows: true,
            appendArrows: $nav ? $nav : false,
        });
    });

    /////////////////////////////////////////

    // Product Main img Slick
    $('#product-main-img').slick({
        infinite: false,
        speed: 300,
        dots: false,
        arrows: true,
        fade: true,
        asNavFor: '#product-imgs',
    });

    // Product imgs Slick
    $('#product-imgs').slick({
        slidesToShow: 3,
        infinite: false,
        slidesToScroll: 1,
        arrows: true,
        centerMode: true,
        focusOnSelect: true,
        centerPadding: 0,
        vertical: true,
        asNavFor: '#product-main-img',
        responsive: [{
            breakpoint: 991,
            settings: {
                vertical: false,
                arrows: false,
                dots: true,
            }
        },
        ]
    });

    // Product img zoom
    var zoomMainProduct = document.getElementById('product-main-img');
    if (zoomMainProduct) {
        $('#product-main-img .product-preview').zoom();
    }

    /////////////////////////////////////////

    // Input number
    $('.input-number').each(function () {
        var $this = $(this),
            $input = $this.find('input[type="number"]'),
            up = $this.find('.qty-up'),
            down = $this.find('.qty-down');

        down.on('click', function () {
            var value = parseInt($input.val()) - 1;
            value = value < 1 ? 1 : value;
            $input.val(value);
            $input.change();
            updatePriceSlider($this, value)
        })

        up.on('click', function () {
            var value = parseInt($input.val()) + 1;
            $input.val(value);
            $input.change();
            updatePriceSlider($this, value)
        })
    });

    var priceInputMax = document.getElementById('price-max'),
        priceInputMin = document.getElementById('price-min');

    priceInputMax.addEventListener('change', function () {
        updatePriceSlider($(this).parent(), this.value)
    });

    priceInputMin.addEventListener('change', function () {
        updatePriceSlider($(this).parent(), this.value)
    });

    function updatePriceSlider(elem, value) {
        if (elem.hasClass('price-min')) {
            console.log('min')
            priceSlider.noUiSlider.set([value, null]);
        } else if (elem.hasClass('price-max')) {
            console.log('max')
            priceSlider.noUiSlider.set([null, value]);
        }
    }

    // =================== Price Slider
    var priceSlider = document.getElementById('price-slider');
    var categoryValue = document.getElementById('category_value').value;
    var storeList = document.getElementById('store-list');

    if (priceSlider) {
        noUiSlider.create(priceSlider, {
            start: [1, 999],
            connect: true,
            step: 1,
            range: {
                'min': 20,
                'max': 999
            }
        });

        priceSlider.noUiSlider.on('set', function (values, handle) {
            if (handle === 0 || handle === 1) {
                var priceMinValue = values[0];
                var priceMaxValue = values[1];
                priceInputMin.value = priceMinValue;
                priceInputMax.value = priceMaxValue;
                console.log('price-min:', priceMinValue);
                console.log('price-max:', priceMaxValue);

                // Send AJAX request to the server
                var xhr = new XMLHttpRequest();
                var url = '/alphavn/store?category=' + encodeURIComponent(categoryValue) +
                    '&priceMin=' + encodeURIComponent(parseInt(priceMinValue)) +
                    '&priceMax=' + encodeURIComponent(parseInt(priceMaxValue)) + '&process=2';

                xhr.open('POST', url, true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                        storeList.innerHTML = xhr.responseText;
                    }
                };
                xhr.send();
            }
        })
        // =================== / Price Slider ==========================

        priceSlider.noUiSlider.on('update', function (values, handle) {
            var value = values[handle];
            handle ? priceInputMax.value = value : priceInputMin.value = value
        });
    }


    // =========== STORE HANDLE ==================

    $(document).ready(function () {
        var currentPage = 1,
            categoryValue = document.getElementById('category_value').value,
            totalPages = document.getElementById('total_pages').value;


        var priceOrder = document.getElementById('price-order');
        $(priceOrder).change(function (e) {
            e.preventDefault();
            var priceOrder = parseInt(this.value);
            console.log(priceOrder)
            if (priceOrder != null) {
                loadPage(currentPage, categoryValue, priceOrder);
            }
        })

        console.log("INFOR: ", currentPage, categoryValue, totalPages);

        $('li#nav-page-prev').click(function (e) {
            e.preventDefault();
            console.log("INTO_PRE: ", currentPage, categoryValue, totalPages);
            if (currentPage > 1) {
                --currentPage; // 1
                loadPage(currentPage, categoryValue, parseInt(priceOrder.value));

                $('#curr_page').text(currentPage);
                $('#nav-page-prev').css('display', 'inline-block');
                $('#nav-page-next').css('display', 'inline-block');
            } else {
                $('#curr_page').text(currentPage);
                $('#nav-page-prev').css('display', 'none');
            }
        })

        $('li#nav-page-next').click(function (e) {
            e.preventDefault();

            console.log("INTO_NEXT: ", this.value, categoryValue, totalPages);

            var idx = 1;
            if (currentPage < parseInt(totalPages)) {
                ++currentPage;
                loadPage(currentPage, categoryValue, parseInt(priceOrder.value));
                $('#curr_page').text(currentPage);
                $('#nav-page-prev').css('display', 'inline-block');
                $('#nav-page-next').css('display', 'inline-block');
            } else {
                $('#curr_page').text(currentPage);
                $('#nav-page-next').css('display', 'none');
            }
        })


    })

    function loadPage(currentPage, category, priceOrder) {
        console.log(currentPage, category, priceOrder);
        $.ajax({
            url: "/alphavn/store?process=1",
            method: "POST",
            data: {
                page: currentPage,
                category: category,
                priceOrder: priceOrder
            },
            success: function (response) {
                storeList.innerHTML = response;
            }
        })
    }


    // ========================== Handle Pagination

})(jQuery);
