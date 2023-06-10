<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="pageSize" value="6"/>

<c:set var="totalpages" value="${Math.ceil(products.size() / 6)}"/>

<c:set var="totalpages" value="${Math.ceil(products.size() / 6)}"/>
<fmt:parseNumber var="totalpagesInt" value="${totalpages}" integerOnly="true"/>
<c:set var="totalpages" value="${totalpagesInt}"/>


<c:set var="currpage" value="${page eq null ? 1 : page}"/>

<c:set var="beginIdx" value="${(currpage -1) * pageSize}"/>
<c:set var="endIdx" value="${currpage * pageSize -1}"/>


<%-- PAGICINATION--%>

<%-- SET THE INDEX OF DISCOUNT LIST--%>
<c:set var="idx" value="0"/>


<!-- product -->


<c:forEach items="${products}" var="p" begin="${beginIdx}" end="${endIdx}">

    <div class="col-md-4 col-xs-6">
        <div class="product">
            <div class="product-img">
                <img src="imgs/productImg/${p.getImg1()}" alt="">
                <div class="product-label">
                    <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                        <span class="sale">${pdDiscount.get(idx).getDis_amount() * 100} %</span>
                    </c:if>
                    <span class="new">NEW</span>
                </div>
            </div>
            <div class="product-body">
                <p class="product-category">${p.getProduct().getCategory()}</p>
                <h3 class="product-name"><a
                        href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                </h3>

                <c:choose>
                    <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                        <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                    </c:when>

                    <c:otherwise>
                        <c:set var="finalPrice" value="${p.getPrice()}"/>
                    </c:otherwise>
                </c:choose>

                <h4 class="product-price">$${finalPrice}
                    <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                        <del
                                class="product-old-price">$${p.getPrice()}
                        </del>
                    </c:if>
                </h4>
                <div class="product-rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <div class="product-btns">
                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                            class="tooltipp">add to wishlist</span></button>
                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                            class="tooltipp">add to compare</span></button>
                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                    </button>
                </div>
            </div>
            <div class="add-to-cart">
                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart
                </button>
            </div>
        </div>
    </div>

    <c:set var="idx" value="${idx + 1}"/>
</c:forEach>
<!-- /product -->
<!-- /store products -->



