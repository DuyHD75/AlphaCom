<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Dashboard | Front - Admin &amp; Dashboard Template</title>

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
<body class="footer-offset">
<script src="assets\vendor\hs-navbar-vertical-aside\hs-navbar-vertical-aside-mini-cache.js"></script>


<%-- BEGIN CODE --%>

<%--  HEADER --%>
<%@include file="../../components/commons/adminCommons/header.jsp" %>
<%--  END HEADER --%>

<!-- End Navbar Vertical -->

<main id="content" role="main" class="main">
    <!-- Content -->
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">Welcome Back Mark</h1>
                    <p class="page-header-text">Here's what's happening with your store today.</p>
                </div>
            </div>
        </div>
        <!-- End Page Header -->


        <c:set var="revenueWeek" value="0"/>
        <c:set var="totalProducts" value="0"/>


        <c:forEach items="${statistic}" var="item">
            <c:set var="revenueWeek" value="${revenueWeek + item.getRevernues()}"/>
            <c:set var="totalProducts" value="${totalProducts + item.getTotalProducts()}"/>
        </c:forEach>


        <!-- Card -->
        <div class="card card-body mb-3 mb-lg-5">
            <div class="row gx-lg-4">
                <div class="col-sm-12 col-lg-4 column-divider-sm">
                    <div class="media">
                        <div class="media-body">
                            <h6 class="card-subtitle">Daily Revenues</h6>

                            <div class="d-flex align-items-center">
                                <span class="card-title h3 mr-3">$${empty manages ? manages.get().getRevernues() : 0}</span>

                                <span class="badge badge-soft-success ml-2">
                                    <i class="tio-trending-up"></i> 12.5%
                                </span>
                            </div>
                        </div>

                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                            <i class="tio-website"></i>
                          </span>
                    </div>

                    <div class="d-lg-none">
                        <hr>
                    </div>
                </div>

                <div class="col-sm-12 col-lg-4 column-divider-lg">
                    <div class="media">
                        <div class="media-body">
                            <h6 class="card-subtitle">Total Orders</h6>

                            <div class="d-flex align-items-center">
                                <span class="card-title h3 mr-3">${empty manages ? manages.get().getTotalOrders() : 0}</span>
                                <span class="d-block font-size-sm">orders</span>
                            </div>
                        </div>

                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                            <i class="tio-label-off"></i>
                          </span>
                    </div>

                    <div class="d-lg-none">
                        <hr>
                    </div>
                </div>

                <div class="col-sm-12 col-lg-4 column-divider-sm">
                    <div class="media">
                        <div class="media-body">
                            <h6 class="card-subtitle">Total products sold</h6>

                            <div class="d-flex align-items-center">
                                <span class="card-title h3 mr-3">${empty manages ? manages.get().getTotalProducts() : 0}</span>

                                <span class="d-block font-size-sm">products</span>
                                <span class="badge badge-soft-danger ml-2">
                                    <i class="tio-trending-down"></i> 4.4%
                                  </span>
                            </div>
                        </div>

                        <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">
                            <i class="tio-users-switch"></i>
                          </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Card -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
            <!-- Header -->
            <div class="card-header">
                <div class="row align-items-center flex-grow-1">
                    <div class="col-sm mb-2 mb-sm-0">
                        <h4 class="card-header-title">Sales <i class="tio-help-outlined text-body ml-1"
                                                               data-toggle="tooltip"
                                                               data-placement="top"
                                                               title="Net sales (gross sales minus discounts and returns) plus taxes and shipping.
                            Includes orders from all sales channels."></i>
                        </h4>
                    </div>

                    <div class="col-sm-auto">
                        <!-- Daterangepicker -->
                       <%-- <button id="js-daterangepicker-predefined"
                                class="btn btn-sm btn-white dropdown-toggle mb-2 mb-sm-0">
                            <i class="tio-date-range"></i>
                            <span class="js-daterangepicker-predefined-preview ml-1"></span>
                        </button>--%>
                        <a href="?action=overview&week=25" class="btn btn-light">Last week</a>
                        <a href="?action=overview&week=26" class="btn btn-light">This week</a>
                        <!-- End Daterangepicker -->
                    </div>

                </div>
                <!-- End Row -->
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="card-body">
                <div class="row">
                    <div class="col-md-9 mb-5 mb-md-0">


                        <!-- Bar Chart -->
                        <div class="chartjs-custom mb-4">
                            <canvas class="js-chart" id="js-chart-1" style="height: 18rem;"
                                    data-hs-chartjs-options='{
                                "type": "bar",
                                "data": {
                                  "labels": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],
                                  "datasets": [
                                  {
                                    "data": [],
                                    "backgroundColor": "#377dff",
                                    "hoverBackgroundColor": "#377dff",
                                    "borderColor": "#377dff"
                                  },
                                  {
                                    "data": [],
                                    "backgroundColor": "#e7eaf8",
                                    "borderColor": "#e7eaf3"
                                  }
                                  ]
                                },
                                "options": {
                                  "scales": {
                                    "yAxes": [{
                                      "gridLines": {
                                        "color": "#e7eaf3",
                                        "drawBorder": false,
                                        "zeroLineColor": "#e7eaf3"
                                      },
                                      "ticks": {
                                        "beginAtZero": true,
                                        "stepSize": 500,
                                        "fontSize": 12,
                                        "fontColor": "#33B",
                                        "fontFamily": "Open Sans, sans-serif",
                                        "padding": 10
                                      }
                                    }],
                                    "xAxes": [{
                                      "gridLines": {
                                        "display": false,
                                        "drawBorder": false
                                      },
                                      "ticks": {
                                        "fontSize": 12,
                                        "fontColor": "#333",
                                        "fontFamily": "Open Sans, sans-serif",
                                        "padding": 5
                                      },
                                      "categoryPercentage": 0.5,
                                      "maxBarThickness": "10"
                                    }]
                                  },
                                  "cornerRadius": 2,
                                  "tooltips": {
                                    "hasIndicator": true,
                                    "mode": "index",
                                    "intersect": false
                                  },
                                  "hover": {
                                    "mode": "nearest",
                                    "intersect": true
                                  }
                                }
                              }'></canvas>
                        </div>
                        <!-- End Bar Chart -->

                        <!-- Legend Indicators -->
                        <div class="row justify-content-center">
                            <div class="col-auto">
                                <span class="legend-indicator"></span> Revenue
                            </div>
                            <div class="col-auto">
                                <span class="legend-indicator bg-primary"></span> Products Sold
                            </div>
                        </div>
                        <!-- End Legend Indicators -->
                    </div>

                    <div class="col-md-3 column-divider-md">
                        <div class="row">
                            <div class="col-sm-6 col-md-12">
                                <!-- Stats -->
                                <div class="d-flex justify-content-center flex-column" style="min-height: 10.5rem;">
                                    <h6 class="card-subtitle">Revenue</h6>
                                    <span class="d-block display-4 text-dark mb-1 mr-3">
                                        $${revenueWeek}
                                    </span>
                                    <span class="d-block text-success">
                                      <i class="tio-trending-up mr-1"></i> $579.3 (3.7%)
                                    </span>
                                </div>
                                <!-- End Stats -->

                                <div class="d-sm-none">
                                    <hr class="my-0">
                                </div>

                                <div class="d-none d-md-block">
                                    <hr class="my-0">
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-12">
                                <!-- Stats -->
                                <div class="d-flex justify-content-center flex-column" style="min-height: 10.5rem;">
                                    <h6 class="card-subtitle">Products</h6>
                                    <span class="d-block display-4 text-dark mb-1 mr-3">${totalProducts}</span>
                                    <span class="d-block text-danger">
                                      <i class="tio-trending-down mr-1"></i> +${totalProducts} (1.2%)
                                    </span>
                                </div>
                                <!-- End Stats -->
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                </div>
                <!-- End Row -->
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->

        <div class="row">
            <div class="col-lg-4 mb-3 mb-lg-5">
                <!-- Card -->
                <a class="card card-hover-shadow mb-4" href="ecommerce-product?action=add-product">
                    <div class="card-body">
                        <div class="media align-items-center">
                            <img class="avatar avatar-xl mr-4" src="assets\svg\illustrations\create.svg"
                                 alt="Image Description">

                            <div class="media-body">
                                <h3 class="text-hover-primary mb-1">Product</h3>
                                <span class="text-body">Create a new product</span>
                            </div>

                            <div class="ml-2 text-right">
                                <i class="tio-chevron-right tio-lg text-body text-hover-primary"></i>
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                </a>
                <!-- End Card -->

                <!-- Card -->
                <a class="card card-hover-shadow mb-4" href="#">
                    <div class="card-body">
                        <div class="media align-items-center">
                            <img class="avatar avatar-xl mr-4" src="assets\svg\illustrations\choice.svg"
                                 alt="Image Description">

                            <div class="media-body">
                                <h3 class="text-hover-primary mb-1">Collection</h3>
                                <span class="text-body">Create a new collection</span>
                            </div>

                            <div class="ml-2 text-right">
                                <i class="tio-chevron-right tio-lg text-body text-hover-primary"></i>
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                </a>
                <!-- End Card -->

                <!-- Card -->
                <a class="card card-hover-shadow" href="#">
                    <div class="card-body">
                        <div class="media align-items-center">
                            <img class="avatar avatar-xl mr-4" src="assets\svg\illustrations\presenting.svg"
                                 alt="Image Description">

                            <div class="media-body">
                                <h3 class="text-hover-primary mb-1">Discount</h3>
                                <span class="text-body">Create a new discount</span>
                            </div>

                            <div class="ml-2 text-right">
                                <i class="tio-chevron-right tio-lg text-body text-hover-primary"></i>
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                </a>
                <!-- End Card -->
            </div>

            <div class="col-lg-8 mb-3 mb-lg-5">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Top products</h4>

                        <a class="btn btn-sm btn-ghost-secondary" href="ecommerce-product?action=products">View all</a>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body-height">
                        <!-- Table -->
                        <div class="table-responsive">
                            <table class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col">Item</th>
                                    <th scope="col">Change</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Sold</th>
                                    <th scope="col">Sales</th>
                                </tr>
                                </thead>

                                <tbody>

                                <c:forEach items="${prdTops}" var="entry">
                                    <c:set var="sold" value="${entry.key.getPrice() * entry.value}"/>

                                    <c:set var="percen" value="${Math.ceil((entry.value / sold) * 100)}"/>

                                    <tr>
                                        <td>
                                            <!-- Media -->
                                            <a class="media align-items-center" href="">
                                                <img class="avatar mr-3" src="imgs/productImg/${entry.key.getImg2()}"
                                                     alt="Image Description">

                                                <div class="media-body">
                                                    <h5 class="text-hover-primary mb-0">${entry.key.getProduct().getName()}</h5>
                                                </div>
                                            </a>
                                            <!-- End Media -->
                                        </td>

                                        <td><i class="tio-trending-up text-success mr-1"></i> ${percen}%</td>
                                        <td>${entry.key.getPrice()}</td>
                                        <td>${entry.value}</td>
                                        <td>
                                            <c:set var="sold" value="${entry.key.getPrice() * entry.value}"/>
                                            <h4 class="mb-0">$${sold}</h4>
                                        </td>
                                    </tr>


                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- End Table -->
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <!-- End Row -->


        <!-- Card -->
        <div class="card">
            <div class="row">
                <div class="col-lg-6">
                    <!-- Body -->
                    <div class="card-body">
                        <h4>Total sales <i class="tio-help-outlined text-body ml-1" data-toggle="tooltip"
                                           data-placement="top"
                                           title="Net sales (gross sales minus discounts and returns) plus taxes and shipping. Includes orders from all sales channels."></i>
                        </h4>

                        <div class="row align-items-sm-center mb-5">
                            <div class="col-sm">
                                <span class="display-4 text-dark mr-2">${empty manages ? manages.get().getRevernues() : 0}</span>
                            </div>

                            <div class="col-sm-auto">
                                  <span class="h3 text-success">
                                    <i class="tio-trending-up"></i> 25.9%
                                  </span>
                                <span class="d-block">&mdash; ${empty manages ? manages.get().getTotalOrders() : 0} orders <span
                                        class="badge badge-soft-dark badge-pill ml-1">+$97k today</span></span>
                            </div>
                        </div>
                        <!-- End Row -->

                        <!-- Bar Chart -->
                        <div class="chartjs-custom mb-4" style="height: 18rem;">
                            <canvas class="js-chart" id="js-chart-1"  data-hs-chartjs-options='{
                            "type": "line",
                            "data": {
                                "labels": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],
                               "datasets": [{
                                "data": [200, 200, 240, 350, 200, 350, 200, 250, 285, 220],
                                "backgroundColor": "transparent",
                                "borderColor": "#377dff",
                                "borderWidth": 2,
                                "pointRadius": 0,
                                "hoverBorderColor": "#377dff",
                                "pointBackgroundColor": "#377dff",
                                "pointBorderColor": "#fff",
                                "pointHoverRadius": 0
                              },
                              {
                                "data": [150, 230, 382, 204, 269, 290, 200, 250, 200, 225],
                                "backgroundColor": "transparent",
                                "borderColor": "#e7eaf3",
                                "borderWidth": 2,
                                "pointRadius": 0,
                                "hoverBorderColor": "#e7eaf3",
                                "pointBackgroundColor": "#e7eaf3",
                                "pointBorderColor": "#fff",
                                "pointHoverRadius": 0
                              }]
                            },
                            "options": {
                               "scales": {
                                  "yAxes": [{
                                    "gridLines": {
                                      "color": "#e7eaf3",
                                      "drawBorder": false,
                                      "zeroLineColor": "#e7eaf3"
                                    },
                                    "ticks": {
                                      "beginAtZero": true,
                                      "stepSize": 100,
                                      "fontSize": 12,
                                      "fontColor": "#97a4af",
                                      "fontFamily": "Open Sans, sans-serif",
                                      "padding": 10,
                                      "prefix": "$",
                                      "postfix": "k"
                                    }
                                  }],
                                  "xAxes": [{
                                    "gridLines": {
                                      "display": false,
                                      "drawBorder": false
                                    },
                                    "ticks": {
                                      "fontSize": 12,
                                      "fontColor": "#97a4af",
                                      "fontFamily": "Open Sans, sans-serif",
                                      "padding": 5
                                    }
                                  }]
                              },
                              "tooltips": {
                                "prefix": "$",
                                "postfix": "k",
                                "hasIndicator": true,
                                "mode": "index",
                                "intersect": false,
                                "lineMode": true,
                                "lineWithLineColor": "rgba(19, 33, 68, 0.075)"
                              },
                              "hover": {
                                "mode": "nearest",
                                "intersect": true
                              }
                            }
                          }'>
                            </canvas>
                        </div>
                        <!-- End Bar Chart -->

                        <!-- Legend Indicators -->
                        <div class="row justify-content-center">
                            <div class="col-auto">
                                <span class="legend-indicator"></span> Last week
                            </div>
                            <div class="col-auto">
                                <span class="legend-indicator bg-primary"></span> This week
                            </div>
                        </div>
                        <!-- End Legend Indicators -->
                    </div>
                    <!-- End Body -->

                    <div class="d-lg-none">
                        <hr>
                    </div>
                </div>

                <div class="col-lg-6 column-divider-lg">
                    <!-- Body -->
                    <div class="card-body">
                        <h4>Total orders</h4>

                        <div class="row align-items-sm-center mb-5">
                            <div class="col-sm">
                                <span class="display-4 text-dark mr-2">${empty manages ? manages.get().getTotalOrders() : 0}</span>
                            </div>

                            <div class="col-sm-auto">
                  <span class="h3 text-success">
                    <i class="tio-trending-up"></i> 4.7%
                  </span>
                                <span class="d-block">&mdash; orders over time <span
                                        class="badge badge-soft-dark badge-pill ml-1">+${empty manages ? manages.get().getTotalOrders() : 0}k
                      today</span></span>
                            </div>
                        </div>
                        <!-- End Row -->

                        <!-- Bar Chart -->
                        <div class="chartjs-custom mb-4" style="height: 18rem;">
                            <canvas class="js-chart" id="js-chart-1" data-hs-chartjs-options='{
                            "type": "line",
                            "data": {
                               "labels": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],
                               "datasets": [{
                                "data": [15, 26, 29, 20, 23, 38, 20, 30, 20, 22],
                                "backgroundColor": "transparent",
                                "borderColor": "#377dff",
                                "borderWidth": 2,
                                "pointRadius": 0,
                                "hoverBorderColor": "#377dff",
                                "pointBackgroundColor": "#377dff",
                                "pointBorderColor": "#fff",
                                "pointHoverRadius": 0
                              },
                              {
                                "data": [20, 20, 15, 18, 20, 24, 35, 20, 35, 22],
                                "backgroundColor": "transparent",
                                "borderColor": "#e7eaf3",
                                "borderWidth": 2,
                                "pointRadius": 0,
                                "hoverBorderColor": "#e7eaf3",
                                "pointBackgroundColor": "#e7eaf3",
                                "pointBorderColor": "#fff",
                                "pointHoverRadius": 0
                              }]
                            },
                            "options": {
                               "scales": {
                                  "yAxes": [{
                                    "gridLines": {
                                      "color": "#e7eaf3",
                                      "drawBorder": false,
                                      "zeroLineColor": "#e7eaf3"
                                    },
                                    "ticks": {
                                      "beginAtZero": true,
                                      "stepSize": 10,
                                      "fontSize": 12,
                                      "fontColor": "#97a4af",
                                      "fontFamily": "Open Sans, sans-serif",
                                      "padding": 10,
                                      "postfix": "k"
                                    }
                                  }],
                                  "xAxes": [{
                                    "gridLines": {
                                      "display": false,
                                      "drawBorder": false
                                    },
                                    "ticks": {
                                      "fontSize": 12,
                                      "fontColor": "#97a4af",
                                      "fontFamily": "Open Sans, sans-serif",
                                      "padding": 5
                                    }
                                  }]
                              },
                              "tooltips": {
                                "postfix": "k",
                                "hasIndicator": true,
                                "mode": "index",
                                "intersect": false,
                                "lineMode": true,
                                "lineWithLineColor": "rgba(19, 33, 68, 0.075)"
                              },
                              "hover": {
                                "mode": "nearest",
                                "intersect": true
                              }
                            }
                          }'>
                            </canvas>
                        </div>
                        <!-- End Bar Chart -->

                        <!-- Legend Indicators -->
                        <div class="row justify-content-center">
                            <div class="col-auto">
                                <span class="legend-indicator"></span> Last Week
                            </div>
                            <div class="col-auto">
                                <span class="legend-indicator bg-primary"></span> This week
                            </div>
                        </div>
                        <!-- End Legend Indicators -->
                    </div>
                    <!-- End Body -->

                    <div class="d-lg-none">
                        <hr>
                    </div>
                </div>


            </div>
            <!-- End Row -->

            <hr class="my-0">

            <div class="row">

                <%--   <div class="col-lg-6 ">
                       <!-- Body -->
                       <div class="card-body">
                           <h4>Visitors</h4>

                           <div class="row align-items-sm-center mb-5">
                               <div class="col-sm">
                                   <span class="display-4 text-dark mr-2">831,071</span>
                               </div>

                               <div class="col-sm-auto">
                     <span class="h3 text-danger">
                       <i class="tio-trending-down"></i> 16%
                     </span>
                                   <span class="d-block">&mdash; 467,001 unique <span
                                           class="badge badge-soft-dark badge-pill ml-1">+7k
                         today</span></span>
                               </div>
                           </div>
                           <!-- End Row -->

                           <!-- Bar Chart -->
                           <div class="chartjs-custom mb-4" style="height: 18rem;">
                               <canvas class="js-chart" data-hs-chartjs-options='{
                               "type": "line",
                               "data": {
                                  "labels": ["1AM","2AM","3AM","4AM","5AM","6AM","7AM","8AM","9AM","10AM"],
                                  "datasets": [{
                                   "data": [20, 20, 24, 15, 30, 35, 20, 28, 18, 16],
                                   "backgroundColor": "transparent",
                                   "borderColor": "#377dff",
                                   "borderWidth": 2,
                                   "pointRadius": 0,
                                   "hoverBorderColor": "#377dff",
                                   "pointBackgroundColor": "#377dff",
                                   "pointBorderColor": "#fff",
                                   "pointHoverRadius": 0
                                 },
                                 {
                                   "data": [15, 23, 18, 20, 36, 29, 20, 22, 20, 22],
                                   "backgroundColor": "transparent",
                                   "borderColor": "#e7eaf3",
                                   "borderWidth": 2,
                                   "pointRadius": 0,
                                   "hoverBorderColor": "#e7eaf3",
                                   "pointBackgroundColor": "#e7eaf3",
                                   "pointBorderColor": "#fff",
                                   "pointHoverRadius": 0
                                 }]
                               },
                               "options": {
                                  "scales": {
                                     "yAxes": [{
                                       "gridLines": {
                                         "color": "#e7eaf3",
                                         "drawBorder": false,
                                         "zeroLineColor": "#e7eaf3"
                                       },
                                       "ticks": {
                                         "beginAtZero": true,
                                         "stepSize": 10,
                                         "fontSize": 12,
                                         "fontColor": "#97a4af",
                                         "fontFamily": "Open Sans, sans-serif",
                                         "padding": 10,
                                         "postfix": "k"
                                       }
                                     }],
                                     "xAxes": [{
                                       "gridLines": {
                                         "display": false,
                                         "drawBorder": false
                                       },
                                       "ticks": {
                                         "fontSize": 12,
                                         "fontColor": "#97a4af",
                                         "fontFamily": "Open Sans, sans-serif",
                                         "padding": 5
                                       }
                                     }]
                                 },
                                 "tooltips": {
                                   "postfix": "k",
                                   "hasIndicator": true,
                                   "mode": "index",
                                   "intersect": false,
                                   "lineMode": true,
                                   "lineWithLineColor": "rgba(19, 33, 68, 0.075)"
                                 },
                                 "hover": {
                                   "mode": "nearest",
                                   "intersect": true
                                 }
                               }
                             }'>
                               </canvas>
                           </div>
                           <!-- End Bar Chart -->

                           <!-- Legend Indicators -->
                           <div class="row justify-content-center">
                               <div class="col-auto">
                                   <span class="legend-indicator"></span> Yesterday
                               </div>
                               <div class="col-auto">
                                   <span class="legend-indicator bg-primary"></span> Today
                               </div>
                           </div>
                           <!-- End Legend Indicators -->
                       </div>
                       <!-- End Body -->
                   </div>--%>

                <%--  REFUNDED --%>
                <%-- <div class="col-lg-6 column-divider-lg">
                     <!-- Body -->
                     <div class="card-body">
                         <h4>Refunded</h4>

                         <div class="row align-items-sm-center mb-5">
                             <div class="col-sm">
                                 <span class="display-4 text-dark mr-2">52,441</span>
                             </div>

                             <div class="col-sm-auto">
                   <span class="h3 text-success">
                     <i class="tio-trending-up"></i> 11%
                   </span>
                                 <span class="d-block">&mdash; refunds over time <span
                                         class="badge badge-soft-dark badge-pill ml-1">+21 today</span></span>
                             </div>
                         </div>
                         <!-- End Row -->

                         <!-- Bar Chart -->
                         <div class="chartjs-custom mb-4" style="height: 18rem;">
                             <canvas class="js-chart" data-hs-chartjs-options='{
                             "type": "line",
                             "data": {
                                "labels": ["1AM","2AM","3AM","4AM","5AM","6AM","7AM","8AM","9AM","10AM"],
                                "datasets": [{
                                 "data": [10, 20, 22, 15, 20, 15, 20, 19, 14, 15],
                                 "backgroundColor": "transparent",
                                 "borderColor": "#377dff",
                                 "borderWidth": 2,
                                 "pointRadius": 0,
                                 "hoverBorderColor": "#377dff",
                                 "pointBackgroundColor": "#377dff",
                                 "pointBorderColor": "#fff",
                                 "pointHoverRadius": 0
                               },
                               {
                                 "data": [15, 13, 18, 10, 16, 19, 15, 14, 10, 26],
                                 "backgroundColor": "transparent",
                                 "borderColor": "#e7eaf3",
                                 "borderWidth": 2,
                                 "pointRadius": 0,
                                 "hoverBorderColor": "#e7eaf3",
                                 "pointBackgroundColor": "#e7eaf3",
                                 "pointBorderColor": "#fff",
                                 "pointHoverRadius": 0
                               }]
                             },
                             "options": {
                                "scales": {
                                   "yAxes": [{
                                     "gridLines": {
                                       "color": "#e7eaf3",
                                       "drawBorder": false,
                                       "zeroLineColor": "#e7eaf3"
                                     },
                                     "ticks": {
                                       "beginAtZero": true,
                                       "stepSize": 10,
                                       "fontSize": 12,
                                       "fontColor": "#97a4af",
                                       "fontFamily": "Open Sans, sans-serif",
                                       "padding": 10
                                     }
                                   }],
                                   "xAxes": [{
                                     "gridLines": {
                                       "display": false,
                                       "drawBorder": false
                                     },
                                     "ticks": {
                                       "fontSize": 12,
                                       "fontColor": "#97a4af",
                                       "fontFamily": "Open Sans, sans-serif",
                                       "padding": 5
                                     }
                                   }]
                               },
                               "tooltips": {
                                 "hasIndicator": true,
                                 "mode": "index",
                                 "intersect": false,
                                 "lineMode": true,
                                 "lineWithLineColor": "rgba(19, 33, 68, 0.075)"
                               },
                               "hover": {
                                 "mode": "nearest",
                                 "intersect": true
                               }
                             }
                           }'>
                             </canvas>
                         </div>
                         <!-- End Bar Chart -->

                         <!-- Legend Indicators -->
                         <div class="row justify-content-center">
                             <div class="col-auto">
                                 <span class="legend-indicator"></span> Yesterday
                             </div>
                             <div class="col-auto">
                                 <span class="legend-indicator bg-primary"></span> Today
                             </div>
                         </div>
                         <!-- End Legend Indicators -->
                     </div>
                     <!-- End Body -->
                 </div>--%>
                <%--  END REFUNDED --%>

            </div>
            <!-- End Row -->
        </div>
        <!-- End Card -->
    </div>
    <!-- End Content -->

    <!-- Footer -->

    <div class="footer">
        <div class="row justify-content-between align-items-center">
            <div class="col">
                <p class="font-size-sm mb-0">&copy; Alpha - Front <span
                        class="d-none d-sm-inline-block">2023 </span></p>
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
                    </ul>
                    <!-- End List Dot -->
                </div>
            </div>
        </div>
    </div>

    <!-- End Footer -->
</main>
<!-- ========== END MAIN CONTENT ========== -->


<%-- END CODE --%>

<input type="hidden" value="${statistic}" name="data-statistic" id="data-statistic">


<!-- JS Implementing Plugins -->
<script src="assets\js\vendor.min.js"></script>
<script src="assets\vendor\chart.js\dist\Chart.min.js"></script>
<script src="assets\vendor\chartjs-chart-matrix\dist\chartjs-chart-matrix.min.js"></script>
<!-- JS Front -->
<script src="assets\js\theme.min.js"></script>
<script src="assets/js/handleChart.js"></script>

<!-- JS Plugins Init. -->
<script>
    $(document).on('ready', function () {


        // =======================================================================

        if (window.localStorage.getItem('hs-builder-popover') === null) {
            $('#builderPopover').popover('show')
                .on('shown.bs.popover', function () {
                    $('.popover').last().addClass('popover-dark')
                });

            $(document).on('click', '#closeBuilderPopover', function () {
                window.localStorage.setItem('hs-builder-popover', true);
                $('#builderPopover').popover('dispose');
            });
        } else {
            $('#builderPopover').on('show.bs.popover', function () {
                return false
            });
        }


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
        var sidebar = $('.js-navbar-vertical-aside').hsSideNav();


        // INITIALIZATION OF TOOLTIP IN NAVBAR VERTICAL MENU
        // =======================================================
        $('.js-nav-tooltip-link').tooltip({boundary: 'window'})

        $(".js-nav-tooltip-link").on("show.bs.tooltip", function (e) {
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


        // INITIALIZATION OF SELECT2
        // =======================================================
        $('.js-select2-custom').each(function () {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });


        // INITIALIZATION OF DATERANGEPICKER
        // =======================================================
        $('.js-daterangepicker').daterangepicker();

        $('.js-daterangepicker-times').daterangepicker({
            timePicker: true,
            startDate: moment().startOf('hour'),
            endDate: moment().startOf('hour').add(32, 'hour'),
            locale: {
                format: 'M/DD hh:mm A'
            }
        });

        var start = moment();
        var end = moment();

        function cb(start, end) {
            $('#js-daterangepicker-predefined .js-daterangepicker-predefined-preview').html(start.format('MMM D') + ' - ' + end.format('MMM D, YYYY'));
        }

        $('#js-daterangepicker-predefined').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'This week': [moment(), moment()],
                'Last week': [moment().subtract(6, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end);


        // INITIALIZATION OF CHARTJS
        // =======================================================
        $('.js-chart').each(function () {
            $.HSCore.components.HSChartJS.init($(this));
        });


        // INITIALIZATION OF JVECTORMAP
        // =======================================================
        $('.js-jvectormap').each(function () {
            var jVectorMap = $.HSCore.components.HSJVectorMap.init($(this));
        });
    });
</script>

<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>