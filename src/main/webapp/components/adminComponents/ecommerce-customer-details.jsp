<%--
  Created by IntelliJ IDEA.
  User: DOANCONGHUUNGHIA
  Date: 6/26/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Title -->
  <title>Customer Details - E-commerce | Front - Admin &amp; Dashboard Template</title>

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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\layouts-sidebar-default.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\layouts-sidebar-dark.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\layouts-sidebar-light.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\sidebar-default-classic.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\sidebar-compact.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\sidebar-mini.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\header-default-fluid.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\header-default-container.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\header-double-line-fluid.svg" alt="Image Description">
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
                <img class="custom-checkbox-card-img" src="assets\svg\layouts\header-double-line-container.svg" alt="Image Description">
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
    <div class="page-header">
      <div class="row align-items-center">
        <div class="col-sm mb-2 mb-sm-0">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-no-gutter">
              <li class="breadcrumb-item"><a class="breadcrumb-link" href="adminCustomer?action=viewAllCustomer">Customers</a></li>
              <li class="breadcrumb-item active" aria-current="page">Customer details</li>
            </ol>
          </nav>

          <h1 class="page-header-title">${customer.getName()}</h1>
        </div>

        <div class="col-sm-auto">
          <a class="btn btn-icon btn-sm btn-ghost-secondary rounded-circle mr-1" href="adminCustomer?action=previousCustomerDetail&&Cid=${customer.getId()}" data-toggle="tooltip" data-placement="top" title="Previous customer">
            <i class="tio-arrow-backward"></i>
          </a>
          <a class="btn btn-icon btn-sm btn-ghost-secondary rounded-circle" href="adminCustomer?action=nextCustomerDetail&&Cid=${customer.getId()}" data-toggle="tooltip" data-placement="top" title="Next customer">
            <i class="tio-arrow-forward"></i>
          </a>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <div class="row">
      <div class="col-lg-8">
        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
          <!-- Body -->
          <div class="card-body">
            <!-- Media -->
            <div class="d-flex align-items-center mb-5">
              <div class="avatar avatar-lg avatar-circle">
                <img class="avatar-img" src="assets\img\160x160\img9.jpg" alt="Image Description">
              </div>

              <div class="mx-3">
                <div class="d-flex mb-1">
                  <h3 class="mb-0 mr-3">
                    ${customer.getName()}

                  </h3>

                  <!-- Unfold -->
<%--                  <div class="hs-unfold">--%>
<%--                    <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-white rounded-circle" href="javascript:;" data-toggle="tooltip" data-placement="top" title="Edit" data-hs-unfold-options='{--%>
<%--                             "target": "#editDropdown",--%>
<%--                             "type": "css-animation"--%>
<%--                           }'>--%>
<%--                      <i class="tio-edit"></i>--%>
<%--                    </a>--%>

<%--                    <div id="editDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-card mt-1" style="min-width: 20rem;">--%>
<%--                      <!-- Card -->--%>
<%--                      <div class="card">--%>
<%--                        <div class="card-body">--%>
<%--                          <div class="form-row">--%>
<%--                            <div class="col-sm-6">--%>
<%--                              <label for="firstNameLabel" class="input-label">First name</label>--%>
<%--                              <input type="text" class="form-control" name="firstName" id="firstNameLabel" placeholder="Clarice" aria-label="Clarice" value="Anna">--%>
<%--                            </div>--%>

<%--                            <div class="col-sm-6">--%>
<%--                              <label for="lastNameLabel" class="input-label">Last name</label>--%>
<%--                              <input type="text" class="form-control" name="lastName" id="lastNameLabel" placeholder="Boone" aria-label="Boone" value="Richard">--%>
<%--                            </div>--%>
<%--                          </div>--%>
<%--                          <!-- End Row -->--%>

<%--                          <div class="d-flex justify-content-end mt-3">--%>
<%--                            <button type="button" class="btn btn-sm btn-white mr-2">Cancel</button>--%>
<%--                            <button type="button" class="btn btn-sm btn-primary">Save</button>--%>
<%--                          </div>--%>
<%--                        </div>--%>
<%--                      </div>--%>
<%--                      <!-- End Body -->--%>
<%--                    </div>--%>
<%--                  </div>--%>
                  <!-- End Unfold -->
                </div>
<%--                <c:set var="currentDate" value="${LocalDate.now()}"/>--%>
<%--                <c:set var="daysBetween" value="${java.time.temporal.ChronoUnit.DAYS.between(customer.getCreate_At(), currentDate)}"/>--%>
                <span class="font-size-sm">Customer create at ${customer.getCreate_At()}</span> <br>
                <c:set var="active" value="Active"/>
                <c:set var="block" value="Block"/>
                <c:if test="${customer.getStatus() == active}">
                  <c:set var="color" value="green"/>
                </c:if>
                <c:if test="${customer.getStatus() == block}">
                  <c:set var="color" value="red"/>
                </c:if>
                <span class="font-size-sm" style="color: ${color}">${customer.getStatus()}</span>
              </div>

              <div class="d-none d-sm-inline-block ml-auto text-right">
                <!-- Unfold -->
                <div class="hs-unfold">
                  <a class="js-hs-unfold-invoker btn btn-sm btn-white" href="javascript:;" data-hs-unfold-options='{
                           "target": "#actionsDropdown",
                           "type": "css-animation"
                         }'>
                    Status: ${customer.getStatus()}<i class="tio-chevron-down"></i>
                  </a>

                  <div id="actionsDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu mt-1">
                    <a class="dropdown-item" href="adminCustomer?action=updateStatus&&Cid=${customer.getId()}&&status=Active">
<%--                      <i class="tio-email-outlined dropdown-item-icon"></i> Email--%>
                      Active
                    </a>
                    <a class="dropdown-item" href="adminCustomer?action=updateStatus&&Cid=${customer.getId()}&&status=Block">
<%--                      <i class="tio-call dropdown-item-icon"></i> Call--%>
                      Block
                    </a>
<%--                    <a class="dropdown-item" href="#">--%>
<%--                      <i class="tio-sync dropdown-item-icon"></i> Merge--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a class="dropdown-item text-danger" href="#">--%>
<%--                      <i class="tio-delete-outlined dropdown-item-icon text-danger"></i>--%>
<%--                      Delete--%>
<%--                    </a>--%>
                  </div>
                </div>
                <!-- End Unfold -->
              </div>
            </div>
            <!-- End Media -->

<%--            <label class="input-label">Customer note</label>--%>

<%--            <!-- Quill -->--%>
<%--            <div class="quill-custom">--%>
<%--              <div id="toolbar-container">--%>
<%--                <ul class="list-inline ql-toolbar-list">--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-bold"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-italic"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-underline"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-strike"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-link"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-image"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-blockquote"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-code"></button>--%>
<%--                  </li>--%>
<%--                  <li class="list-inline-item">--%>
<%--                    <button class="ql-list" value="bullet"></button>--%>
<%--                  </li>--%>
<%--                </ul>--%>
<%--              </div>--%>

<%--              <div class="js-quill" style="min-height: 10rem;" data-hs-quill-options='{--%>
<%--                          "placeholder": "Start typing to leave a note...",--%>
<%--                          "toolbarBottom": true,--%>
<%--                          "modules": {--%>
<%--                            "toolbar": "#toolbar-container"--%>
<%--                          }--%>
<%--                         }'>--%>
<%--              </div>--%>
<%--            </div>--%>
            <!-- End Quill -->
          </div>
          <!-- Body -->

          <!-- Footer -->
<%--          <div class="card-footer">--%>
<%--            <div class="d-flex justify-content-end">--%>
<%--              <button type="submit" class="btn btn-white mr-2">Discard</button>--%>
<%--              <button type="submit" class="btn btn-primary">Save changes</button>--%>
<%--            </div>--%>
<%--          </div>--%>
          <!-- End Footer -->
        </div>
        <!-- End Card -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
          <!-- Header -->
          <div class="card-header">
            <div class="row justify-content-between align-items-center flex-grow-1">
              <div class="col-sm mb-3 mb-sm-0">
                <h4 class="card-header-title">Orders placed</h4>
              </div>

              <div class="col-sm-auto">
                <!-- Nav -->
                <ul class="js-tabs-to-dropdown nav nav-segment nav-fill nav-sm-down-break" data-hs-transform-tabs-to-btn-options='{
                          "transformResolution": "sm",
                          "btnClassNames": "btn btn-block btn-white dropdown-toggle justify-content-center"
                        }'>
                  <li class="nav-item">
                    <a class="nav-link active" href="#">All orders</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Open</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unfulfilled</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unpaid</a>
                  </li>
                </ul>
                <!-- End Nav -->

                <!-- Datatable Info -->
                <div id="datatableCounterInfo" style="display: none;">
                  <div class="d-flex align-items-center">
                        <span class="font-size-sm mr-3">
                          <span id="datatableCounter">0</span>
                          Selected
                        </span>
                    <a class="btn btn-sm btn-outline-danger" href="javascript:;">
                      <i class="tio-delete-outlined"></i> Delete
                    </a>
                  </div>
                </div>
                <!-- End Datatable Info -->
              </div>
            </div>
            <!-- End Row -->
          </div>
          <!-- End Header -->

          <!-- Body -->
          <div class="card-body">
            <!-- Input Group -->
            <div class="input-group input-group-merge">
              <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="tio-search"></i>
                    </span>
              </div>

              <input id="datatableSearch" type="search" class="form-control" placeholder="Search orders" aria-label="Search orders">
            </div>
            <!-- End Input Group -->
          </div>
          <!-- End Body -->

          <!-- Table -->
          <div class="table-responsive datatable-custom">
            <table id="datatable" class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table" data-hs-datatables-options='{
                         "columnDefs": [{
                            "targets": [0, 5],
                            "orderable": false
                          }],
                         "order": [],
                         "info": {
                           "totalQty": "#datatableWithPaginationInfoTotalQty"
                         },
                         "search": "#datatableSearch",
                         "entries": "#datatableEntries",
                         "pageLength": 12,
                         "isResponsive": false,
                         "isShowPaging": false,
                         "pagination": "datatablePagination"
                       }'>
              <thead class="thead-light">
              <tr>
                <th scope="col" class="table-column-pr-0">
                  <div class="custom-control custom-checkbox">
                    <input id="datatableCheckAll" type="checkbox" class="custom-control-input">
                    <label class="custom-control-label" for="datatableCheckAll"></label>
                  </div>
                </th>
                <th class="table-column-pl-0">Order</th>
                <th>Date</th>
                <th>Payment status</th>
                <th>Total</th>
<%--                <th>Invoice</th>--%>
              </tr>
              </thead>

              <tbody>
              <c:forEach items="${orders}" var="ord">
                <tr>
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="ordersCheck${ord.id}">
                      <label class="custom-control-label" for="ordersCheck${ord.id}"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a href="adminOrder?action=viewOrderDetail&&Oid=${ord.id}&&Cid=${ord.getCustomer().getId()}">AE${ord.id}</a>
                  </td>
                  <td>${ord.getOrderDate()}</td>
                  <td>
                    <c:set var="PAYPAL" value="PAYPAL"/>
                    <c:set var="VNPAY" value="VNPAY"/>
                    <c:if test="${ord.getPaymentMethod() == PAYPAL || ord.getPaymentMethod() == VNPAY}">
                      ${ord.setStatusPaid("Paid")}
                    </c:if>
                    <c:set var="Paid" value="Paid"/>
                    <c:set var="Pending" value="Pending"/>
                    <c:set var="Cancel" value="Cancel"/>
                    <c:set var="Shipping" value="Shipping"/>
                    <c:set var="Fulfilled" value="Fulfilled"/>
                    <c:if test="${ord.getStatusPaid() == Paid}">
                      <c:set var="badgep" value="badge-soft-success"/>
                      <c:set var="bgp" value="bg-success"/>
                    </c:if>
                    <c:if test="${ord.getStatus() == Pending}">
                      <c:set var="badge" value="badge-soft-warning"/>
                      <c:set var="bg" value="bg-warning"/>
                    </c:if>
                    <c:if test="${ord.getStatus() == Cancel}">
                      <c:set var="badge" value="badge-soft-danger"/>
                      <c:set var="bg" value="bg-danger"/>
                    </c:if>
                    <c:if test="${ord.getStatus() == Shipping}">
                      <c:set var="badge" value="badge-soft-primary"/>
                      <c:set var="bg" value="bg-primary"/>
                    </c:if>
                    <c:if test="${ord.getStatus() == Fulfilled}">
                      <c:set var="badge" value="badge-soft-info"/>
                      <c:set var="bg" value="bg-info"/>
                      <c:set var="Fulfillment" value="Fulfilled"/>
                    </c:if>

                    <c:if test="${ord.getStatus() != Fulfilled}">
                      <c:set var="Fulfillment" value="Unfulfilled"/>
                    </c:if>

                    <c:choose>
                      <c:when test="${ord.getStatusPaid() != null && ord.getStatus() != Fulfilled}">
                      <span class="badge ${badgep}">
                        <span class="legend-indicator ${bgp} "></span>
                          ${ord.getStatusPaid()}
                      </span>
                      </c:when>
                      <c:otherwise>
                      <span class="badge ${badge}">
                        <span class="legend-indicator ${bg} "></span>
                          ${ord.getStatus()}
                      </span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <c:set var="totalPrice" value="0" />
                  <c:forEach items="${ord.getOrderDetail()}" var="orderDetail" >
                    <c:set  var="totalPrice"
                            value="${totalPrice + (orderDetail.getPrice() * orderDetail.getQuantityOrdered()) }"/>
                  </c:forEach>
                  <td>$${totalPrice}</td>
<%--                  <td>--%>
<%--                    <a class="btn btn-sm btn-white" href="javascript:;" data-toggle="modal" data-target="#invoiceReceiptModal">--%>
<%--                      <i class="tio-receipt-outlined mr-1"></i> Invoice--%>
<%--                    </a>--%>
<%--                  </td>--%>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- End Table -->

          <!-- Footer -->
          <div class="card-footer">
            <!-- Pagination -->
            <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
              <div class="col-sm mb-2 mb-sm-0">
                <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                  <span class="mr-2">Showing:</span>

                  <!-- Select -->
                  <select id="datatableEntries" class="js-select2-custom" data-hs-select2-options='{
                                "minimumResultsForSearch": "Infinity",
                                "customClass": "custom-select custom-select-sm custom-select-borderless",
                                "dropdownAutoWidth": true,
                                "width": true
                              }'>
                    <option value="12" selected="">12</option>
                    <option value="14">14</option>
                    <option value="16">16</option>
                    <option value="18">18</option>
                  </select>
                  <!-- End Select -->

                  <span class="text-secondary mr-2">of</span>

                  <!-- Pagination Quantity -->
                  <span id="datatableWithPaginationInfoTotalQty"></span>
                </div>
              </div>

              <div class="col-sm-auto">
                <div class="d-flex justify-content-center justify-content-sm-end">
                  <!-- Pagination -->
                  <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                </div>
              </div>
            </div>
            <!-- End Pagination -->
          </div>
          <!-- End Footer -->
        </div>
        <!-- End Card -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
          <!-- Header -->
          <div class="card-header">
            <h4 class="card-header-title">Timeline</h4>

            <!-- Checkbox -->
            <div class="custom-control custom-checkbox font-size-sm">
              <input id="showCommentsCheckbox" type="checkbox" class="custom-control-input" checked="">
              <label class="custom-control-label" for="showCommentsCheckbox">Show comments</label>
            </div>
            <!-- End Checkbox -->
          </div>
          <!-- End Header -->

          <!-- Body -->
          <div class="card-body">
            <!-- Step -->
            <ul class="step step-icon-sm">
              <!-- Step Item -->
              <li class="step-item">
                <div class="step-content-wrapper">
                  <span class="step-icon step-icon-soft-primary">A</span>

                  <!-- Quill -->
                  <div class="quill-custom">
                    <div id="step-toolbar-container">
                      <ul class="list-inline ql-toolbar-list">
                        <li class="list-inline-item">
                          <button class="ql-bold"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-italic"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-underline"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-strike"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-link"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-image"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-blockquote"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-code"></button>
                        </li>
                        <li class="list-inline-item">
                          <button class="ql-list" value="bullet"></button>
                        </li>
                      </ul>
                    </div>

                    <div class="js-quill-step" data-hs-quill-options='{
                                "placeholder": "Leave a comment...",
                                "toolbarBottom": true,
                                "modules": {
                                  "toolbar": "#step-toolbar-container"
                                }
                               }'>
                    </div>
                  </div>
                  <!-- End Quill -->
                </div>
              </li>
              <!-- End Step Item -->

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
                    <h5 class="mb-0">You submitted a customer data request.</h5>
                    <p class="font-size-sm mb-0">10:19 AM</p>
                  </div>
                </div>
              </li>
              <!-- End Step Item -->

              <!-- Step Item -->
              <li class="step-item">
                <div class="step-content-wrapper">
                  <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                  <div class="step-content">
                    <h5 class="mb-0">You added the email anne@gmail.com to this customer.</h5>
                    <p class="font-size-sm mb-0">10:18 AM</p>
                  </div>
                </div>
              </li>
              <!-- End Step Item -->

              <!-- Step Item -->
              <li class="step-item">
                <div class="step-content-wrapper">
                  <span class="step-icon step-icon-soft-dark step-icon-pseudo"></span>

                  <div class="step-content">
                    <h5 class="mb-0">You created this customer.</h5>
                    <p class="font-size-sm mb-0">10:18 AM</p>
                  </div>
                </div>
              </li>
              <!-- End Step Item -->
            </ul>
            <!-- End Step -->
          </div>
          <!-- End Body -->
        </div>
        <!-- End Card -->
        <form action="adminCustomer?action=deleteCustomer&&Cid=${customer.getId()}" method="post">
          <div class="d-none d-lg-block">
            <button type="submit" class="btn btn-danger">Delete customer</button>
          </div>
        </form>

      </div>

      <div class="col-lg-4">
        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
          <!-- Body -->
          <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
              <h5>Contact info</h5>
<%--              <a class="link" href="javascript:;">Edit</a>--%>
            </div>

            <ul class="list-unstyled list-unstyled-py-2">
              <li>
                <i class="tio-online mr-2"></i>
                ${customer.getEmail()}
              </li>
              <li>
                <i class="tio-android-phone-vs mr-2"></i>
                ${customer.getPhone()}
              </li>
            </ul>

            <hr>

            <div class="d-flex justify-content-between align-items-center">
              <h5>Shipping address</h5>
<%--              <a class="link" href="javascript:;">Edit</a>--%>
            </div>

            <!-- Leaflet (Map) -->
            <div id="map" class="leaflet-custom rounded mt-1 mb-3" style="min-height: 10rem;" data-hs-leaflet-options='{
                       "map": {
                         "scrollWheelZoom": false,
                         "coords": [37.4040344, -122.0289704]
                       },
                       "marker": [
                         {
                           "coords": [37.4040344, -122.0289704],
                           "icon": {
                             "iconUrl": "./assets/svg/components/map-pin.svg",
                             "iconSize": [50, 45]
                           },
                           "popup": {
                             "text": "153 Williamson Plaza, Maggieberg"
                           }
                         }
                       ]
                      }'></div>
            <!-- End Leaflet (Map) -->

            <span class="d-block">
              ${customer.getAddress()}
            </span>

            <hr>

<%--            <div class="d-flex justify-content-between align-items-center">--%>
<%--              <h5>Billing address</h5>--%>
<%--              <a class="link" href="javascript:;">Edit</a>--%>
<%--            </div>--%>

<%--            <span class="d-block">--%>
<%--                  45 Roker Terrace<br>--%>
<%--                  Latheronwheel<br>--%>
<%--                  KW5 8NW, London<br>--%>
<%--                  UK <img class="avatar avatar-xss avatar-circle ml-1" src="assets\vendor\flag-icon-css\flags\1x1\gb.svg" alt="Great Britain Flag">--%>
<%--                </span>--%>

<%--            <div class="mt-3">--%>
<%--              <h5 class="mb-0">Mastercard</h5>--%>
<%--              <span class="d-block">Card Number: ************4291</span>--%>
<%--            </div>--%>
          </div>
          <!-- End Body -->
        </div>
        <!-- End Card -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
          <!-- Header -->
          <div class="card-header">
            <h5>Email marketing</h5>
            <a class="link" href="javascript:;">Edit status</a>
          </div>
          <!-- End Header -->

          <!-- Body -->
          <div class="card-body">
                <span class="h3">
                  <span class="badge badge-soft-dark badge-pill">Subscribed</span>
                </span>
          </div>
          <!-- Body -->
        </div>
        <!-- End Card -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
          <!-- Header -->
          <div class="card-header">
            <h4 class="card-header-title">Website activity</h4>
          </div>
          <!-- End Header -->

          <!-- Body -->
          <div class="card-body">
            <p>Website activity shows you how many times a contact has visited your site and viewed your pages.</p>

            <!-- Bar Chart -->
            <div class="chartjs-custom my-5" style="height: 12rem;">
              <canvas class="js-chart" data-hs-chartjs-options='{
                            "type": "line",
                            "data": {
                               "labels": ["Aug 1", "Aug 2", "Aug 3", "Aug 4", "Aug 5"],
                               "datasets": [{
                                "data": [10, 9, 14, 5, 10],
                                "backgroundColor": "transparent",
                                "borderColor": "#377dff",
                                "borderWidth": 3,
                                "pointRadius": 0,
                                "hoverBorderColor": "#377dff",
                                "pointBackgroundColor": "#377dff",
                                "pointBorderColor": "#fff",
                                "pointHoverRadius": 0
                              },
                              {
                                "data": [15, 13, 18, 7, 26],
                                "backgroundColor": "transparent",
                                "borderColor": "#e7eaf3",
                                "borderWidth": 3,
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
                                      "stepSize": 10,
                                      "fontSize": 12,
                                      "fontColor": "#97a4af",
                                      "fontFamily": "Open Sans, sans-serif",
                                      "padding": 10
                                    }
                                  }],
                                  "xAxes": [{
                                    "display": false
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
          <!-- Body -->
        </div>
        <!-- End Card -->
      </div>
    </div>
    <!-- End Row -->

    <form action="adminCustomer?action=deleteCustomer&&Cid=${customer.getId()}" method="post">
      <div class="d-lg-none">
        <button type="submit" class="btn btn-danger">Delete customer</button>
      </div>
    </form>
  </div>
  <!-- End Content -->

  <!-- Footer -->

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
                                <img class="avatar avatar-xs" src="assets\svg\brands\excel.svg" alt="Image Description">
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
                                <img class="avatar avatar-xs" src="assets\svg\brands\word.svg" alt="Image Description">
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
                      <img class="img-fluid rounded ie-sidebar-activity-img" src="assets\svg\illustrations\card-1.svg" alt="Image Description">
                    </div>
                    <div class="col">
                      <img class="img-fluid rounded ie-sidebar-activity-img" src="assets\svg\illustrations\card-2.svg" alt="Image Description">
                    </div>
                    <div class="col">
                      <img class="img-fluid rounded ie-sidebar-activity-img" src="assets\svg\illustrations\card-3.svg" alt="Image Description">
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
            <img class="img-fluid" src="assets\svg\illustrations\graphs.svg" alt="Image Description">
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
              <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\gitlab-gray.svg" alt="Image Description">
            </div>
            <div class="col">
              <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\fitbit-gray.svg" alt="Image Description">
            </div>
            <div class="col">
              <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\flow-xo-gray.svg" alt="Image Description">
            </div>
            <div class="col">
              <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\layar-gray.svg" alt="Image Description">
            </div>
          </div>
        </div>
      </div>
      <!-- End Footer -->
    </div>
  </div>
</div>
<!-- End Welcome Message Modal -->

<!-- Invoice Modal -->
<div class="modal fade" id="invoiceReceiptModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <!-- Header -->
      <div class="modal-top-cover bg-dark text-center">
        <figure class="position-absolute right-0 bottom-0 left-0 ie-modal-curved-shape">
          <svg preserveaspectratio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewbox="0 0 1920 100.1" style="margin-bottom: -2px;">
            <path fill="#fff" d="M0,0c0,0,934.4,93.4,1920,0v100.1H0L0,0z"></path>
          </svg>
        </figure>

        <div class="modal-close">
          <button type="button" class="btn btn-icon btn-sm btn-ghost-light" data-dismiss="modal" aria-label="Close">
            <i class="tio-clear tio-lg"></i>
          </button>
        </div>
      </div>
      <!-- End Header -->

      <div class="modal-top-cover-icon">
            <span class="icon icon-lg icon-light icon-circle icon-centered shadow-soft">
              <i class="tio-receipt-outlined"></i>
            </span>
      </div>

      <!-- Body -->
      <div class="modal-body pt-3 pb-sm-5 px-sm-5">
        <div class="text-center mb-5">
          <h2 class="mb-1">Invoice from Front</h2>
          <span class="d-block">Invoice #3682303</span>
        </div>

        <div class="row mb-6">
          <div class="col-md-4 mb-3">
            <small class="text-cap">Amount paid:</small>
            <span class="text-dark">$316.8</span>
          </div>

          <div class="col-md-4 mb-3">
            <small class="text-cap">Date paid:</small>
            <span class="text-dark">April 22, 2020</span>
          </div>

          <div class="col-md-4 mb-3">
            <small class="text-cap">Payment method:</small>
            <div class="d-flex align-items-center">
              <img class="avatar avatar-xss avatar-4by3 mr-2" src="assets\svg\brands\mastercard.svg" alt="Image Description">
              <span class="text-dark">&bull;&bull;&bull;&bull; 4242</span>
            </div>
          </div>
        </div>

        <small class="text-cap mb-2">Summary</small>

        <ul class="list-group mb-4">
          <li class="list-group-item text-dark">
            <div class="d-flex justify-content-between align-items-center">
              <span>Payment to Front</span>
              <span>$264.00</span>
            </div>
          </li>

          <li class="list-group-item text-dark">
            <div class="d-flex justify-content-between align-items-center">
              <span>Tax fee</span>
              <span>$52.8</span>
            </div>
          </li>

          <li class="list-group-item list-group-item-light text-dark">
            <div class="d-flex justify-content-between align-items-center">
              <span class="font-weight-bold">Amount paid</span>
              <span class="font-weight-bold">$316.8</span>
            </div>
          </li>
        </ul>

        <div class="d-flex justify-content-end">
          <a class="btn btn-sm btn-white mr-2" href="#"><i class="tio-download-to mr-1"></i> PDF</a>
          <a class="btn btn-sm btn-white" href="#"><i class="tio-print mr-1"></i> Print Details</a>
        </div>

        <hr class="my-5">

        <p class="modal-footer-text">If you have any questions, contact us at <a href="mailto:example@gmail.com">example@gmail.com</a> or call at <a href="#">+1 898 34-5492</a></p>
      </div>
      <!-- End Body -->
    </div>
  </div>
</div>
<!-- End Invoice Modal -->
<!-- ========== END SECONDARY CONTENTS ========== -->


<!-- JS Implementing Plugins -->
<script src="assets\js\vendor.min.js"></script>
<script src="assets\vendor\chart.js\dist\Chart.min.js"></script>
<script src="assets\vendor\chartjs-chart-matrix\dist\chartjs-chart-matrix.min.js"></script>



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
    var sidebar = $('.js-navbar-vertical-aside').hsSideNav();


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


    // INITIALIZATION OF TABS
    // =======================================================
    $('.js-tabs-to-dropdown').each(function () {
      var transformTabsToBtn = new HSTransformTabsToBtn($(this)).init();
    });


    // INITIALIZATION OF SELECT2
    // =======================================================
    $('.js-select2-custom').each(function () {
      var select2 = $.HSCore.components.HSSelect2.init($(this));
    });


    // INITIALIZATION OF QUILLJS EDITOR
    // =======================================================
    var quill = $.HSCore.components.HSQuill.init('.js-quill');
    var quill = $.HSCore.components.HSQuill.init('.js-quill-step');


    // INITIALIZATION OF DATATABLES
    // =======================================================
    var datatable = $.HSCore.components.HSDatatables.init($('#datatable'), {
      select: {
        style: 'multi',
        selector: 'td:first-child input[type="checkbox"]',
        classMap: {
          checkAll: '#datatableCheckAll',
          counter: '#datatableCounter',
          counterInfo: '#datatableCounterInfo'
        }
      },
      language: {
        zeroRecords: '<div class="text-center p-4">' +
                '<img class="mb-3" src="./assets/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">' +
                '<p class="mb-0">No data to show</p>' +
                '</div>'
      }
    });

    $('.js-datatable-filter').on('change', function() {
      var $this = $(this),
              elVal = $this.val(),
              targetColumnIndex = $this.data('target-column-index');

      datatable.column(targetColumnIndex).search(elVal).draw();
    });

    $('#datatableSearch').on('mouseup', function (e) {
      var $input = $(this),
              oldValue = $input.val();

      if (oldValue == "") return;

      setTimeout(function(){
        var newValue = $input.val();

        if (newValue == ""){
          // Gotcha
          datatable.search('').draw();
        }
      }, 1);
    });


    // INITIALIZATION OF CHARTJS
    // =======================================================
    $('.js-chart').each(function () {
      $.HSCore.components.HSChartJS.init($(this));
    });


    // INITIALIZATION OF LEAFLET
    // =======================================================
    $('#map').each(function () {
      var leaflet = $.HSCore.components.HSLeaflet.init($(this)[0]);

      L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        id: 'mapbox/light-v9'
      }).addTo(leaflet);
    });
  });
</script>

<!-- IE Support -->
<script>
  if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>

