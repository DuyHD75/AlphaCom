<%--
  Created by IntelliJ IDEA.
  User: DOANCONGHUUNGHIA
  Date: 6/22/2023
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Order Details - E-commerce | Front - Admin &amp; Dashboard Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets\css\vendor.min.css">
    <link rel="stylesheet" href="assets\vendor\icon-set\style.css">



    <!-- CSS Front Template -->
    <link rel="stylesheet" href="assets\css\theme.min.css?v=1.0">
</head>

<body class="   footer-offset">

<script src="assets\vendor\hs-navbar-vertical-aside\hs-navbar-vertical-aside-mini-cache.js"></script>


<!-- ONLY DEV -->

<!-- Builder -->
<div id="styleSwitcherDropdown" class="hs-unfold-content sidebar sidebar-bordered sidebar-box-shadow" style="width: 35rem;">
    <div class="card card-lg border-0 h-100">
        <div class="card-header align-items-start">
            <div class="mr-2">
                <h3 class="card-header-title">Front Builder</h3>
                <p>Customize your overview page layout. Choose the one that best fits your needs.</p>
            </div>

            <!-- Toggle Button -->
            <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark" href="javascript:;" data-hs-unfold-options='{
                  "target": "#styleSwitcherDropdown",
                  "type": "css-animation",
                  "animationIn": "fadeInRight",
                  "animationOut": "fadeOutRight",
                  "hasOverlay": true,
                  "smartPositionOff": true
                 }'>
                <i class="tio-clear tio-lg"></i>
            </a>
            <!-- End Toggle Button -->
        </div>

        <!-- Body -->
        <div class="card-body sidebar-scrollbar">
            <h4 class="mb-1">Layout skins <span id="js-builder-disabled" class="badge badge-soft-danger" style="opacity: 0">Disabled</span></h4>
            <p>3 kinds of layout skins to choose from.</p>

            <div class="row gx-2 mb-5">
                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="layoutSkinsRadio" id="layoutSkinsRadio1" checked="" value="default">
                            <label class="custom-checkbox-card-label" for="layoutSkinsRadio1">
                                <img class="custom-checkbox-card-img" src="svg\layouts\layouts-sidebar-default.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Default</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="layoutSkinsRadio" id="layoutSkinsRadio2" value="navbar-dark">
                            <label class="custom-checkbox-card-label" for="layoutSkinsRadio2">
                                <img class="custom-checkbox-card-img" src="svg\layouts\layouts-sidebar-dark.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Dark</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="layoutSkinsRadio" id="layoutSkinsRadio3" value="navbar-light">
                            <label class="custom-checkbox-card-label" for="layoutSkinsRadio3">
                                <img class="custom-checkbox-card-img" src="svg\layouts\layouts-sidebar-light.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Light</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->
            </div>
            <!-- End Row -->

            <h4 class="mb-1">Sidebar layout options</h4>
            <p>Choose between standard navigation sizing, mini or even compact with icons.</p>

            <div class="row gx-2 mb-5">
                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="sidebarLayoutOptions" id="sidebarLayoutOptions1" checked="" value="default">
                            <label class="custom-checkbox-card-label" for="sidebarLayoutOptions1">
                                <img class="custom-checkbox-card-img" src="svg\layouts\sidebar-default-classic.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Default</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="sidebarLayoutOptions" id="sidebarLayoutOptions2" value="navbar-vertical-aside-compact-mode">
                            <label class="custom-checkbox-card-label" for="sidebarLayoutOptions2">
                                <img class="custom-checkbox-card-img" src="svg\layouts\sidebar-compact.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Compact</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="sidebarLayoutOptions" id="sidebarLayoutOptions3" value="navbar-vertical-aside-mini-mode">
                            <label class="custom-checkbox-card-label" for="sidebarLayoutOptions3">
                                <img class="custom-checkbox-card-img" src="svg\layouts\sidebar-mini.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Mini</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->
            </div>
            <!-- End Row -->

            <h4 class="mb-1">Header layout options</h4>
            <p>Choose the primary navigation of your header layout.</p>

            <div class="row gx-2">
                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="headerLayoutOptions" id="headerLayoutOptions1" value="single">
                            <label class="custom-checkbox-card-label" for="headerLayoutOptions1">
                                <img class="custom-checkbox-card-img" src="svg\layouts\header-default-fluid.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Default (Fluid)</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="headerLayoutOptions" id="headerLayoutOptions2" value="single-container">
                            <label class="custom-checkbox-card-label" for="headerLayoutOptions2">
                                <img class="custom-checkbox-card-img" src="svg\layouts\header-default-container.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Default (Container)</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="headerLayoutOptions" id="headerLayoutOptions3" value="double">
                            <label class="custom-checkbox-card-label" for="headerLayoutOptions3">
                                <img class="custom-checkbox-card-img" src="svg\layouts\header-double-line-fluid.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Double line (Fluid)</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->

                <!-- Custom Radio -->
                <div class="col-4 text-center mt-2">
                    <div class="text-center">
                        <div class="custom-checkbox-card mb-2">
                            <input type="radio" class="custom-checkbox-card-input" name="headerLayoutOptions" id="headerLayoutOptions4" value="double-container">
                            <label class="custom-checkbox-card-label" for="headerLayoutOptions4">
                                <img class="custom-checkbox-card-img" src="svg\layouts\header-double-line-container.svg" alt="Image Description">
                            </label>
                            <span class="custom-checkbox-card-text">Double line (Container)</span>
                        </div>
                    </div>
                </div>
                <!-- End Custom Radio -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Body -->

        <!-- Footer -->
        <div class="card-footer">
            <div class="row gx-2">
                <div class="col">
                    <button type="button" id="js-builder-reset" class="btn btn-block btn-lg btn-white">
                        <i class="tio-restore"></i> Reset
                    </button>
                </div>
                <div class="col">
                    <button type="button" id="js-builder-preview" class="btn btn-block btn-lg btn-primary">
                        <i class="tio-visible"></i> Preview
                    </button>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Footer -->
    </div>
</div>
<!-- End Builder -->

<!-- Builder Toggle -->
<div class="d-none d-md-block position-fixed bottom-0 right-0 mr-5 mb-10" style="z-index: 3;">
    <div style="position: fixed; top: 50%; right: 0; margin-right: -.25rem; transform: translateY(-50%); writing-mode: vertical-rl; text-orientation: sideways;">
        <div class="hs-unfold">
            <a id="builderPopover" class="js-hs-unfold-invoker btn btn-sm btn-soft-dark py-3" href="javascript:;" data-template='<div class="d-none d-md-block popover" role="tooltip"><div class="arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>' data-toggle="popover" data-placement="left" title="<div class='d-flex align-items-center'>Front Builder <a href='#!' class='close close-light ml-auto'><i id='closeBuilderPopover' class='tio-clear'></i></a></div>" data-content="Customize your overview page layout. Choose the one that best fits your needs." data-html="true" data-hs-unfold-options='{
                "target": "#styleSwitcherDropdown",
                "type": "css-animation",
                "animationIn": "fadeInRight",
                "animationOut": "fadeOutRight",
                "hasOverlay": true,
                "smartPositionOff": true
               }'>
                <i class="tio-tune mr-2"></i>
                <span class="font-weight-bold text-uppercase">Builder</span>
            </a>
        </div>
    </div>
</div>
<!-- End Builder Toggle -->

<!-- JS Preview mode only -->
<jsp:include page="../../components/commons/adminCommons/header.jsp"/>
<!-- END ONLY DEV -->

<!-- Search Form -->
<div id="searchDropdown" class="hs-unfold-content dropdown-unfold search-fullwidth d-md-none">
    <form class="input-group input-group-merge input-group-borderless">
        <div class="input-group-prepend">
            <div class="input-group-text">
                <i class="tio-search"></i>
            </div>
        </div>

        <input class="form-control rounded-0" type="search" placeholder="Search in front" aria-label="Search in front">

        <div class="input-group-append">
            <div class="input-group-text">
                <div class="hs-unfold">
                    <a class="js-hs-unfold-invoker" href="javascript:;" data-hs-unfold-options='{
                   "target": "#searchDropdown",
                   "type": "css-animation",
                   "animationIn": "fadeIn",
                   "hasOverlay": "rgba(46, 52, 81, 0.1)",
                   "closeBreakpoint": "md"
                 }'>
                        <i class="tio-clear tio-lg"></i>
                    </a>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- End Search Form -->

<!-- ========== HEADER ========== -->





<!-- ========== END HEADER ========== -->

<!-- ========== MAIN CONTENT ========== -->
<!-- Navbar Vertical -->



<!-- End Navbar Vertical -->

<main id="content" role="main" class="main">
    <!-- Content -->
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-no-gutter">
                            <li class="breadcrumb-item"><a class="breadcrumb-link" href="adminOrder?action=viewAllOrder">Orders</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Order details</li>
                        </ol>
                    </nav>
                    <div class="d-sm-flex align-items-sm-center">
                        <h1 class="page-header-title">Order AE${order.id}</h1>
                        <c:set var="PAYPAL" value="PAYPAL"/>
                        <c:set var="VNPAY" value="VNPAY"/>
                        <c:if test="${order.getPaymentMethod() == PAYPAL || order.getPaymentMethod() == VNPAY}">
                            ${order.setStatusPaid("Paid")}
                        </c:if>
                        <c:if test="${order.getPaymentMethod() != PAYPAL && order.getPaymentMethod() != VNPAY}">
                            ${order.setStatusPaid("Unpaid")}
                        </c:if>
                        <c:set var="Paid" value="Paid"/>
                        <c:set var="Unpaid" value="Unpaid"/>
                        <c:set var="Pending" value="Pending"/>
                        <c:set var="Cancel" value="Cancel"/>
                        <c:set var="Shipping" value="Shipping"/>
                        <c:set var="Fulfilled" value="Fulfilled"/>

                        <c:if test="${order.getStatus() == Pending}">
                            <c:set var="badge" value="badge-soft-warning"/>
                            <c:set var="bg" value="bg-warning"/>
                        </c:if>
                        <c:if test="${order.getStatus() == Cancel}">
                            <c:set var="badge" value="badge-soft-danger"/>
                            <c:set var="bg" value="bg-danger"/>
                        </c:if>
                        <c:if test="${order.getStatus() == Shipping}">
                            <c:set var="badge" value="badge-soft-primary"/>
                            <c:set var="bg" value="bg-primary"/>
                        </c:if>
                        <c:if test="${order.getStatus() == Fulfilled}">
                            <c:set var="badge" value="badge-soft-info"/>
                            <c:set var="bg" value="bg-info"/>
                            <c:set var="badgef" value="badge-soft-info"/>
                            <c:set var="bgf" value="bg-info"/>
                            <c:set var="Fulfillment" value="Fulfilled"/>
                            ${order.setStatusPaid("Paid")}
                        </c:if>

                        <c:if test="${order.getStatusPaid() == Paid}">
                            <c:set var="badgep" value="badge-soft-success"/>
                            <c:set var="pbg" value="bg-success"/>
                        </c:if>
                        <c:if test="${order.getStatusPaid() == Unpaid}">
                            <c:set var="badgep" value="badge-soft-danger"/>
                            <c:set var="pbg" value="bg-danger"/>
                        </c:if>
                        <span class="badge ${badgep} ml-2  ml-sm-3">
                            <span class="legend-indicator ${pbg}"></span>${order.getStatusPaid()}
                        </span>
                        <span class="badge ${badge} ml-2  ml-sm-3">
                            <span class="legend-indicator ${bg}"></span>${order.getStatus()}
                        </span>
                        <c:if test="${order.getStatus() != Fulfilled}">
                            <c:set var="badgef" value="badge-soft-danger"/>
                            <c:set var="bgf" value="bg-danger"/>
                            <c:set var="Fulfillment" value="Unfulfilled"/>
                            <span class="badge ${badgef} ml-2 ml-sm-3">
                            <span class="legend-indicator ${bgf}"></span>${Fulfillment}
                        </span>
                        </c:if>

                        <span class="ml-2 ml-sm-3">
                            <i class="tio-date-range"></i> ${order.getOrderDate()}
                        </span>
                    </div>

                    <div class="mt-2">
                        <a class="text-body mr-3" href="javascript:;" onclick="window.print(); return false;">
                            <i class="tio-print mr-1"></i> Print order
                        </a>

                        <!-- Unfold -->
                        <%--                        <div class="hs-unfold">--%>
                        <%--                            <a class="js-hs-unfold-invoker text-body" href="javascript:;" data-hs-unfold-options='{--%>
                        <%--                       "target": "#moreOptionsDropdown",--%>
                        <%--                       "type": "css-animation"--%>
                        <%--                     }'>--%>
                        <%--                                More options <i class="tio-chevron-down"></i>--%>
                        <%--                            </a>--%>

                        <%--                            <div id="moreOptionsDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu mt-1">--%>
                        <%--                                <a class="dropdown-item" href="#">--%>
                        <%--                                    <i class="tio-copy dropdown-item-icon"></i> Duplicate--%>
                        <%--                                </a>--%>
                        <%--                                <a class="dropdown-item" href="#">--%>
                        <%--                                    <i class="tio-clear dropdown-item-icon"></i> Cancel order--%>
                        <%--                                </a>--%>
                        <%--                                <a class="dropdown-item" href="#">--%>
                        <%--                                    <i class="tio-archive dropdown-item-icon"></i> Archive--%>
                        <%--                                </a>--%>
                        <%--                                <a class="dropdown-item" href="#">--%>
                        <%--                                    <i class="tio-visible dropdown-item-icon"></i> View order status page--%>
                        <%--                                </a>--%>
                        <%--                                <a class="dropdown-item" href="#">--%>
                        <%--                                    <i class="tio-edit dropdown-item-icon"></i> Edit order--%>
                        <%--                                </a>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <!-- End Unfold -->
                    </div>
                </div>

                <div class="col-sm-auto">
                    <a class="btn btn-icon btn-sm btn-ghost-secondary rounded-circle mr-1" href="adminOrder?action=priviousOrderDetail&&Oid=${order.id}" data-toggle="tooltip" data-placement="top" title="Previous order">
                        <i class="tio-arrow-backward"></i>
                    </a>
                    <a class="btn btn-icon btn-sm btn-ghost-secondary rounded-circle" href="adminOrder?action=nextOrderDetail&&Oid=${order.id}" data-toggle="tooltip" data-placement="top" title="Next order">
                        <i class="tio-arrow-forward"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <div class="row">
            <div class="col-lg-8 mb-3 mb-lg-0">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Order details <span class="badge badge-soft-dark rounded-circle ml-1">${countOrderDetail}</span></h4>
                        <div>
                            <div class="hs-unfold">
                                <a class="js-hs-unfold-invoker text-body" href="javascript:;" data-hs-unfold-options='{
                       "target": "#moreOptionsDropdown",
                       "type": "css-animation"
                     }'>
                                    Status order: ${order.getStatus()} <i class="tio-chevron-down"></i>
                                </a>

                                <div id="moreOptionsDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu mt-1">
                                    <a class="dropdown-item" href="adminOrder?action=updateStatus&&Oid=${order.id}&&status=Pending">
                                        Pending
                                    </a>
                                    <a class="dropdown-item" href="adminOrder?action=updateStatus&&Oid=${order.id}&&status=Shipping">
                                        Shipping
                                    </a>
                                    <a class="dropdown-item" href="adminOrder?action=updateStatus&&Oid=${order.id}&&status=Fulfilled">
                                        Fulfilled
                                    </a>
                                    <a class="dropdown-item" href="adminOrder?action=updateStatus&&Oid=${order.id}&&status=Cancel">
                                        Cancel
                                    </a>

                                </div>
                            </div>

                            <%--                            <a class="link ml-3" href="javascript:;">Edit</a>--%>
                        </div>

                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <c:set var="totalPrice" value="0" />
                        <c:forEach items="${order.getOrderDetail()}" var="orderDetail" >
                            <!-- Media -->
                            <div class="media">
                                <div class="avatar avatar-xl mr-3">
                                    <img class="img-fluid" src="imgs/productImg/${orderDetail.getProduct().getImg1()}" alt="Image Description">
                                </div>

                                <div class="media-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <a class="h5 d-block" href="ecommerce-product?action=product-details&id=${orderDetail.getProduct().getProduct().getId()}">${orderDetail.getProduct().getProduct().getName()}</a>

                                            <div class="font-size-sm text-body">
                                                <span>Category:</span>
                                                <span class="font-weight-bold">${orderDetail.getProduct().getProduct().getCategory()}</span>
                                            </div>
                                        </div>

                                        <div class="col col-md-2 align-self-center">
                                            <h5>$${orderDetail.getPrice()}</h5>
                                        </div>

                                        <div class="col col-md-2 align-self-center">
                                            <h5>${orderDetail.getQuantityOrdered()}</h5>
                                        </div>

                                        <div class="col col-md-2 align-self-center text-right">
                                            <h5>$${orderDetail.getPrice() * orderDetail.getQuantityOrdered()}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Media -->
                            <c:set  var="totalPrice" value="${totalPrice + (orderDetail.getPrice() * orderDetail.getQuantityOrdered()) }"/>
                        </c:forEach>
                        <hr>

                        <div class="row justify-content-md-end mb-3">
                            <div class="col-md-8 col-lg-7">
                                <dl class="row text-sm-right">
                                    <dt class="col-sm-6">Subtotal:</dt>
                                    <dd class="col-sm-6">$${totalPrice}</dd>
                                    <dt class="col-sm-6">Shipping fee:</dt>
                                    <dd class="col-sm-6">$0.00</dd>
                                    <dt class="col-sm-6">Tax:</dt>
                                    <dd class="col-sm-6">$0.00</dd>
                                    <dt class="col-sm-6">Total:</dt>
                                    <dd class="col-sm-6">$${totalPrice}</dd>
                                    <dt class="col-sm-6">Amount paid:</dt>
                                    <dd class="col-sm-6">$${totalPrice}</dd>
                                </dl>
                                <!-- End Row -->
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->

                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">
                            Shipping activity
                            <span class="badge badge-soft-dark ml-1">
                    <span class="legend-indicator bg-dark"></span>Marked as fulfilled
                  </span>
                        </h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <!-- Step -->
                        <ul class="step step-icon-xs">
                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <small class="step-divider">Wednesday, 19 August</small>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                    <div class="step-content">
                                        <h5 class="mb-1">
                                            <a class="text-dark" href="#">Delivered</a>
                                        </h5>

                                        <p class="font-size-sm mb-0">4:17 AM</p>
                                    </div>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                    <div class="step-content">
                                        <h5 class="mb-1">
                                            <a class="text-dark" href="#">Out for delivery</a>
                                        </h5>

                                        <p class="font-size-sm mb-0">2:38 AM</p>
                                    </div>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                    <div class="step-content">
                                        <h5 class="mb-1">
                                            <a class="text-dark" href="#">Package arrived at the final delivery station</a>
                                        </h5>

                                        <p class="font-size-sm mb-0">2:00 AM</p>
                                    </div>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <small class="step-divider">Tuesday, 18 August</small>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                    <div class="step-content">
                                        <h5 class="mb-1">
                                            <a class="text-dark" href="#">Tracking number</a>
                                        </h5>

                                        <a class="link" href="#">3981241023109293</a>
                                        <p class="font-size-sm mb-0">6:29 AM</p>
                                    </div>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                    <div class="step-content">
                                        <h5 class="mb-1">
                                            <a class="text-dark" href="#">Package has dispatched</a>
                                        </h5>

                                        <p class="font-size-sm mb-0">6:29 AM</p>
                                    </div>
                                </div>
                            </li>
                            <!-- End Step Item -->

                            <!-- Step Item -->
                            <li class="step-item">
                                <div class="step-content-wrapper">
                                    <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                                    <div class="step-content">
                                        <h5 class="mb-1">
                                            <a class="text-dark" href="#">Order was placed</a>
                                        </h5>

                                        <p class="font-size-sm mb-0">Order AE${order.id}</p>
                                    </div>
                                </div>
                            </li>
                            <!-- End Step Item -->
                        </ul>
                        <!-- End Step -->

                        <small>Times are shown in the local time zone.</small>
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>

            <div class="col-lg-4">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Customer</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <a class="media align-items-center" href="adminCustomer?action=viewCustomerDetail&&Cid=${order.getCustomer().getId()}">
                            <div class="avatar avatar-circle mr-3">
                                <img class="avatar-img" src="assets\img\160x160\img10.jpg" alt="Image Description">
                            </div>
                            <div class="media-body">
                                <span class="text-body text-hover-primary">${order.getCustomer().getName()}</span>
                            </div>
                            <div class="media-body text-right">
                                <i class="tio-chevron-right text-body"></i>
                            </div>
                        </a>

                        <hr>

                        <a class="media align-items-center" href="adminCustomer?action=viewCustomerDetail&&Cid=${order.getCustomer().getId()}">
                            <div class="icon icon-soft-info icon-circle mr-3">
                                <i class="tio-shopping-basket-outlined"></i>
                            </div>
                            <div class="media-body">
                                <span class="text-body text-hover-primary">${countOrder} orders</span>
                            </div>
                            <div class="media-body text-right">
                                <i class="tio-chevron-right text-body"></i>
                            </div>
                        </a>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <h5>Contact info</h5>
                            <a class="link" href="javascript:;">Edit</a>
                        </div>

                        <ul class="list-unstyled list-unstyled-py-2">
                            <li>
                                <i class="tio-online mr-2"></i>
                                ${order.getCustomer().getEmail()}
                            </li>
                            <li>
                                <i class="tio-android-phone-vs mr-2"></i>
                                ${order.getCustomer().getPhone()}
                            </li>
                        </ul>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <h5>Shipping address</h5>
                            <a class="link" href="javascript:;">Edit</a>
                        </div>

                        <span class="d-block">
                            ${order.getCustomer().getAddress()}
                        </span>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <h5>Billing address</h5>
                            <a class="link" href="javascript:;">Edit</a>
                        </div>

                        <span class="d-block">
                            ${order.getCustomer().getAddress()}
                        </span>

<%--                        <div class="mt-3">--%>
<%--                            <h5 class="mb-0">Mastercard</h5>--%>
<%--                            <span class="d-block">Card Number: ************4291</span>--%>
<%--                        </div>--%>
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <!-- End Row -->
    </div>
    <!-- End Content -->

    <!-- Footer -->
    <div class="d-print-none">

        <div class="footer">
            <div class="row justify-content-between align-items-center">
                <div class="col">
                    <p class="font-size-sm mb-0">&copy; Front. <span class="d-none d-sm-inline-block">2020 Htmlstream.</span></p>
                </div>
                <div class="col-auto">
                    <div class="d-flex justify-content-end">
                        <!-- List Dot -->
                        <ul class="list-inline list-separator">
                            <li class="list-inline-item">
                                <a class="list-separator-link" href="#">FAQ</a>
                            </li>

                            <li class="list-inline-item">
                                <a class="list-separator-link" href="#">License</a>
                            </li>

                            <li class="list-inline-item">
                                <!-- Keyboard Shortcuts Toggle -->
                                <div class="hs-unfold">
                                    <a class="js-hs-unfold-invoker btn btn-icon btn-ghost-secondary rounded-circle" href="javascript:;" data-hs-unfold-options='{
                                "target": "#keyboardShortcutsSidebar",
                                "type": "css-animation",
                                "animationIn": "fadeInRight",
                                "animationOut": "fadeOutRight",
                                "hasOverlay": true,
                                "smartPositionOff": true
                               }'>
                                        <i class="tio-command-key"></i>
                                    </a>
                                </div>
                                <!-- End Keyboard Shortcuts Toggle -->
                            </li>
                        </ul>
                        <!-- End List Dot -->
                    </div>
                </div>
            </div>
        </div>



    </div>
    <!-- End Footer -->
</main>
<!-- ========== END MAIN CONTENT ========== -->

<!-- ========== SECONDARY CONTENTS ========== -->
<!-- Keyboard Shortcuts -->
<div id="keyboardShortcutsSidebar" class="hs-unfold-content sidebar sidebar-bordered sidebar-box-shadow">
    <div class="card card-lg sidebar-card">
        <div class="card-header">
            <h4 class="card-header-title">Keyboard shortcuts</h4>

            <!-- Toggle Button -->
            <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;" data-hs-unfold-options='{
                "target": "#keyboardShortcutsSidebar",
                "type": "css-animation",
                "animationIn": "fadeInRight",
                "animationOut": "fadeOutRight",
                "hasOverlay": true,
                "smartPositionOff": true
               }'>
                <i class="tio-clear tio-lg"></i>
            </a>
            <!-- End Toggle Button -->
        </div>

        <!-- Body -->
        <div class="card-body sidebar-body sidebar-scrollbar">
            <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                <div class="list-group-item">
                    <h5 class="mb-1">Formatting</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span class="font-weight-bold">Bold</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">b</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <em>italic</em>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">i</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <u>Underline</u>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">u</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <s>Strikethrough</s>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">s</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span class="small">Small text</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">s</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <mark>Highlight</mark>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">e</kbd>
                        </div>
                    </div>
                </div>
            </div>

            <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                <div class="list-group-item">
                    <h5 class="mb-1">Insert</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Mention person <a href="#">(@Brian)</a></span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">@</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Link to doc <a href="#">(+Meeting notes)</a></span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">+</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <a href="#">#hashtag</a>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">#hashtag</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Date</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">/date</kbd>
                            <kbd class="d-inline-block mb-1">Space</kbd>
                            <kbd class="d-inline-block mb-1">/datetime</kbd>
                            <kbd class="d-inline-block mb-1">/datetime</kbd>
                            <kbd class="d-inline-block mb-1">Space</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Time</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">/time</kbd>
                            <kbd class="d-inline-block mb-1">Space</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Note box</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">/note</kbd>
                            <kbd class="d-inline-block mb-1">Enter</kbd>
                            <kbd class="d-inline-block mb-1">/note red</kbd>
                            <kbd class="d-inline-block mb-1">/note red</kbd>
                            <kbd class="d-inline-block mb-1">Enter</kbd>
                        </div>
                    </div>
                </div>
            </div>

            <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                <div class="list-group-item">
                    <h5 class="mb-1">Editing</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find and replace</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">r</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find next</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">n</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find previous</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">p</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Indent</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Tab</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Un-indent</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Tab</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Move line up</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1"><i class="tio-arrow-large-upward-outlined"></i></kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Move line down</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1"><i class="tio-arrow-large-downward-outlined font-size-sm"></i></kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Add a comment</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">m</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Undo</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">z</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Redo</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">y</kbd>
                        </div>
                    </div>
                </div>
            </div>

            <div class="list-group list-group-sm list-group-flush list-group-no-gutters">
                <div class="list-group-item">
                    <h5 class="mb-1">Application</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Create new doc</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">n</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Present</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">p</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Share</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">s</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Search docs</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">o</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Keyboard shortcuts</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">/</kbd>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Body -->
    </div>
</div>
<!-- End Keyboard Shortcuts -->

<!-- Activity -->
<div id="activitySidebar" class="hs-unfold-content sidebar sidebar-bordered sidebar-box-shadow">
    <div class="card card-lg sidebar-card">
        <div class="card-header">
            <h4 class="card-header-title">Activity stream</h4>

            <!-- Toggle Button -->
            <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;" data-hs-unfold-options='{
              "target": "#activitySidebar",
              "type": "css-animation",
              "animationIn": "fadeInRight",
              "animationOut": "fadeOutRight",
              "hasOverlay": true,
              "smartPositionOff": true
             }'>
                <i class="tio-clear tio-lg"></i>
            </a>
            <!-- End Toggle Button -->
        </div>

        <!-- Body -->
        <div class="card-body sidebar-body sidebar-scrollbar">
            <!-- Step -->
            <ul class="step step-icon-sm step-avatar-sm">
                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="assets\img\160x160\img9.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="mb-1">Iana Robinson</h5>

                            <p class="font-size-sm mb-1">Added 2 files to task <a class="text-uppercase" href="#"><i class="tio-folder-bookmarked"></i> Fd-7</a></p>

                            <ul class="list-group list-group-sm">
                                <!-- List Item -->
                                <li class="list-group-item list-group-item-light">
                                    <div class="row gx-1">
                                        <div class="col-6">
                                            <div class="media">
                              <span class="mt-1 mr-2">
                                <img class="avatar avatar-xs" src="svg\brands\excel.svg" alt="Image Description">
                              </span>
                                                <div class="media-body text-truncate">
                                                    <span class="d-block font-size-sm text-dark text-truncate" title="weekly-reports.xls">weekly-reports.xls</span>
                                                    <small class="d-block text-muted">12kb</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="media">
                              <span class="mt-1 mr-2">
                                <img class="avatar avatar-xs" src="svg\brands\word.svg" alt="Image Description">
                              </span>
                                                <div class="media-body text-truncate">
                                                    <span class="d-block font-size-sm text-dark text-truncate" title="weekly-reports.xls">weekly-reports.xls</span>
                                                    <small class="d-block text-muted">4kb</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- End List Item -->
                            </ul>

                            <small class="text-muted text-uppercase">Now</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <span class="step-icon step-icon-soft-dark">B</span>

                        <div class="step-content">
                            <h5 class="mb-1">Bob Dean</h5>

                            <p class="font-size-sm mb-1">Marked <a class="text-uppercase" href="#"><i class="tio-folder-bookmarked"></i> Fr-6</a> as <span class="badge badge-soft-success badge-pill"><span class="legend-indicator bg-success"></span>"Completed"</span></p>

                            <small class="text-muted text-uppercase">Today</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="assets\img\160x160\img3.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="h5 mb-1">Crane</h5>

                            <p class="font-size-sm mb-1">Added 5 card to <a href="#">Payments</a></p>

                            <ul class="list-group list-group-sm">
                                <li class="list-group-item list-group-item-light">
                                    <div class="row gx-1">
                                        <div class="col">
                                            <img class="img-fluid rounded ie-sidebar-activity-img" src="svg\illustrations\card-1.svg" alt="Image Description">
                                        </div>
                                        <div class="col">
                                            <img class="img-fluid rounded ie-sidebar-activity-img" src="svg\illustrations\card-2.svg" alt="Image Description">
                                        </div>
                                        <div class="col">
                                            <img class="img-fluid rounded ie-sidebar-activity-img" src="svg\illustrations\card-3.svg" alt="Image Description">
                                        </div>
                                        <div class="col-auto align-self-center">
                                            <div class="text-center">
                                                <a href="#">+2</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <small class="text-muted text-uppercase">May 12</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <span class="step-icon step-icon-soft-info">D</span>

                        <div class="step-content">
                            <h5 class="mb-1">David Lidell</h5>

                            <p class="font-size-sm mb-1">Added a new member to Front Dashboard</p>

                            <small class="text-muted text-uppercase">May 15</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="assets\img\160x160\img7.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="mb-1">Rachel King</h5>

                            <p class="font-size-sm mb-1">Marked <a class="text-uppercase" href="#"><i class="tio-folder-bookmarked"></i> Fr-3</a> as <span class="badge badge-soft-success badge-pill"><span class="legend-indicator bg-success"></span>"Completed"</span></p>

                            <small class="text-muted text-uppercase">Apr 29</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="assets\img\160x160\img5.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="mb-1">Finch Hoot</h5>

                            <p class="font-size-sm mb-1">Earned a "Top endorsed" <i class="tio-verified text-primary"></i> badge</p>

                            <small class="text-muted text-uppercase">Apr 06</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                  <span class="step-icon step-icon-soft-primary">
                    <i class="tio-user"></i>
                  </span>

                        <div class="step-content">
                            <h5 class="mb-1">Project status updated</h5>

                            <p class="font-size-sm mb-1">Marked <a class="text-uppercase" href="#"><i class="tio-folder-bookmarked"></i> Fr-3</a> as <span class="badge badge-soft-primary badge-pill"><span class="legend-indicator bg-primary"></span>"In progress"</span></p>

                            <small class="text-muted text-uppercase">Feb 10</small>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->
            </ul>
            <!-- End Step -->

            <a class="btn btn-block btn-white" href="javascript:;">View all <i class="tio-chevron-right"></i></a>
        </div>
        <!-- End Body -->
    </div>
</div>
<!-- End Activity -->

<!-- Welcome Message Modal -->
<div class="modal fade" id="welcomeMessageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-close">
                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal" aria-label="Close">
                    <i class="tio-clear tio-lg"></i>
                </button>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="modal-body p-sm-5">
                <div class="text-center">
                    <div class="w-75 w-sm-50 mx-auto mb-4">
                        <img class="img-fluid" src="svg\illustrations\graphs.svg" alt="Image Description">
                    </div>

                    <h4 class="h1">Welcome to Front</h4>

                    <p>We're happy to see you in our community.</p>
                </div>
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer d-block text-center py-sm-5">
                <small class="text-cap mb-4">Trusted by the world's best teams</small>

                <div class="w-85 mx-auto">
                    <div class="row justify-content-between">
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="svg\brands\gitlab-gray.svg" alt="Image Description">
                        </div>
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="svg\brands\fitbit-gray.svg" alt="Image Description">
                        </div>
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="svg\brands\flow-xo-gray.svg" alt="Image Description">
                        </div>
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="svg\brands\layar-gray.svg" alt="Image Description">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Welcome Message Modal -->

<!-- Export Orders Modal -->
<div class="modal fade" id="exportOrdersModal" tabindex="-1" role="dialog" aria-labelledby="exportOrdersModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h4 id="exportOrdersModalTitle" class="modal-title">Export orders</h4>

                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal" aria-label="Close">
                    <i class="tio-clear tio-lg"></i>
                </button>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="modal-body">
                <!-- Form Group -->
                <div class="form-group">
                    <!-- Custom Checkbox -->
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="ordersRadio1" name="ordersRadio" class="custom-control-input" checked="">
                        <label class="custom-control-label" for="ordersRadio1">Current page</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="ordersRadio2" name="ordersRadio" class="custom-control-input">
                        <label class="custom-control-label" for="ordersRadio2">All orders</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="ordersRadio3" name="ordersRadio" class="custom-control-input" disabled="">
                        <label class="custom-control-label" for="ordersRadio3">Selected: 20 orders</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="ordersRadio4" name="ordersRadio" class="custom-control-input">
                        <label class="custom-control-label" for="ordersRadio4">Order by date</label>
                    </div>
                    <!-- End Custom Checkbox -->
                </div>
                <!-- End Form Group -->

                <label class="input-label">Export as</label>

                <!-- Custom Checkbox -->
                <div class="custom-control custom-radio mb-2">
                    <input type="radio" id="orderAsRadio1" name="orderAsRadio" class="custom-control-input" checked="">
                    <label class="custom-control-label" for="orderAsRadio1">CSV for Excel, Numbers, or other spreadsheet programs</label>
                </div>
                <div class="custom-control custom-radio">
                    <input type="radio" id="orderAsRadio2" name="orderAsRadio" class="custom-control-input">
                    <label class="custom-control-label" for="orderAsRadio2">Plain CSV file</label>
                </div>
                <!-- End Custom Checkbox -->
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-white mr-2" data-dismiss="modal" aria-label="Close">Cancel</button>
                <button type="button" class="btn btn-primary">Export orders</button>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Export Orders Modal -->
<!-- ========== END SECONDARY CONTENTS ========== -->


<!-- JS Implementing Plugins -->
<script src="assets\js\vendor.min.js"></script>



<!-- JS Front -->
<script src="assets\js\theme.min.js"></script>

<!-- JS Plugins Init. -->
<script>
    $(document).on('ready', function () {
        // ONLY DEV
        // =======================================================

        if (window.localStorage.getItem('hs-builder-popover') === null) {
            $('#builderPopover').popover('show')
                .on('shown.bs.popover', function () {
                    $('.popover').last().addClass('popover-dark')
                });

            $(document).on('click', '#closeBuilderPopover' , function() {
                window.localStorage.setItem('hs-builder-popover', true);
                $('#builderPopover').popover('dispose');
            });
        } else {
            $('#builderPopover').on('show.bs.popover', function () {
                return false
            });
        }

        // END ONLY DEV
        // =======================================================


        // BUILDER TOGGLE INVOKER
        // =======================================================
        $('.js-navbar-vertical-aside-toggle-invoker').click(function () {
            $('.js-navbar-vertical-aside-toggle-invoker i').tooltip('hide');
        });


        // INITIALIZATION OF MEGA MENU
        // =======================================================
        var megaMenu = new HSMegaMenu($('.js-mega-menu'), {
            desktop: {
                position: 'left'
            }
        }).init();



        // INITIALIZATION OF NAVBAR VERTICAL NAVIGATION
        // =======================================================
        var sidebar = $('.js-navbar-vertical-aside');
        sidebar.hsSideNav({
            mobileOverlayClass: 'd-print-none'
        });

        $('.js-navbar-vertical-aside').addClass('d-print-none');


        // INITIALIZATION OF TOOLTIP IN NAVBAR VERTICAL MENU
        // =======================================================
        $('.js-nav-tooltip-link').tooltip({ boundary: 'window' })

        $(".js-nav-tooltip-link").on("show.bs.tooltip", function(e) {
            if (!$("body").hasClass("navbar-vertical-aside-mini-mode")) {
                return false;
            }
        });


        // INITIALIZATION OF UNFOLD
        // =======================================================
        $('.js-hs-unfold-invoker').each(function () {
            var unfold = new HSUnfold($(this)).init();
        });


        // INITIALIZATION OF FORM SEARCH
        // =======================================================
        $('.js-form-search').each(function () {
            new HSFormSearch($(this)).init()
        });
    });
</script>

<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>

