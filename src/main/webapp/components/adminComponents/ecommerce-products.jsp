<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Products - E-commerce | Front - Admin &amp; Dashboard Template</title>

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
<%@include file="../../components/commons/adminCommons/header.jsp" %>

<script src="assets\js\demo.js"></script>

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
            <div class="row align-items-center mb-3">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">Products <span class="badge badge-soft-dark ml-2">72,031</span></h1>

                    <div class="mt-2">
                        <a class="text-body mr-3" href="javascript:;" data-toggle="modal"
                           data-target="#exportProductsModal">
                            <i class="tio-download-to mr-1"></i> Export
                        </a>
                        <a class="text-body" href="javascript:;" data-toggle="modal" data-target="#importProductsModal">
                            <i class="tio-publish mr-1"></i> Import
                        </a>
                    </div>
                </div>

                <div class="col-sm-auto">
                    <a class="btn btn-primary" href="?action=add-product">Add product</a>
                </div>
            </div>
            <!-- End Row -->

            <!-- Nav Scroller -->
            <div class="js-nav-scroller hs-nav-scroller-horizontal">
          <span class="hs-nav-scroller-arrow-prev" style="display: none;">
            <a class="hs-nav-scroller-arrow-link" href="javascript:;">
              <i class="tio-chevron-left"></i>
            </a>
          </span>

                <span class="hs-nav-scroller-arrow-next" style="display: none;">
            <a class="hs-nav-scroller-arrow-link" href="javascript:;">
              <i class="tio-chevron-right"></i>
            </a>
          </span>

                <!-- Nav -->
                <ul class="nav nav-tabs page-header-tabs" id="pageHeaderTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">All products</a>
                    </li>
                    <%-- <li class="nav-item">
                         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Archived</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Publish</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unpublish</a>
                     </li>--%>
                </ul>
                <!-- End Nav -->
            </div>
            <!-- End Nav Scroller -->
        </div>
        <!-- End Page Header -->

        <div class="row justify-content-end mb-3">
            <div class="col-lg">
                <!-- Datatable Info -->
                <div id="datatableCounterInfo" style="display: none;">
                    <div class="d-sm-flex justify-content-lg-end align-items-sm-center">
              <span class="d-block d-sm-inline-block font-size-sm mr-3 mb-2 mb-sm-0">
                <span id="datatableCounter">0</span>
                Selected
              </span>
                        <a class="btn btn-sm btn-outline-danger mb-2 mb-sm-0 mr-2" href="">
                            <i class="tio-delete-outlined"></i> Delete
                        </a>
                        <a class="btn btn-sm btn-white mb-2 mb-sm-0 mr-2" href="javascript:;">
                            <i class="tio-archive"></i> Archive
                        </a>
                        <a class="btn btn-sm btn-white mb-2 mb-sm-0 mr-2" href="javascript:;">
                            <i class="tio-publish"></i> Publish
                        </a>
                        <a class="btn btn-sm btn-white mb-2 mb-sm-0" href="javascript:;">
                            <i class="tio-clear"></i> Unpublish
                        </a>
                    </div>
                </div>
                <!-- End Datatable Info -->
            </div>
        </div>
        <!-- End Row -->

        <!-- Card -->
        <div class="card">
            <!-- Header -->
            <div class="card-header">
                <div class="row justify-content-between align-items-center flex-grow-1">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <form>
                            <!-- Search -->
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch" type="search" class="form-control"
                                       placeholder="Search users"
                                       aria-label="Search users">
                            </div>
                            <!-- End Search -->
                        </form>
                    </div>

                    <div class="col-auto">
                        <!-- Unfold -->
                        <%--<div class="hs-unfold mr-2">
                            <a class="js-hs-unfold-invoker btn btn-white" href="javascript:;" data-hs-unfold-options='{
                                  "target": "#datatableFilterSidebar",
                                  "type": "css-animation",
                                  "animationIn": "fadeInRight",
                                  "animationOut": "fadeOutRight",
                                  "hasOverlay": true,
                                  "smartPositionOff": true
                                 }'>
                                <i class="tio-filter-list mr-1"></i> Filters
                            </a>
                        </div>--%>
                        <!-- End Unfold -->

                        <!-- Unfold -->
                        <div class="hs-unfold">
                            <a class="js-hs-unfold-invoker btn btn-white" href="javascript:;"
                               data-hs-unfold-options='{
                                       "target": "#showHideDropdown",
                                       "type": "css-animation"  }'>
                                <i class="tio-table mr-1"></i> Options
                                <span class="badge badge-soft-dark rounded-circle ml-1">6</span>
                            </a>

                            <div id="showHideDropdown"
                                 class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right dropdown-card"
                                 style="width: 15rem;">

                                <div class="card card-sm">
                                    <div class="card-body">

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="mr-2">Product</span>

                                            <!-- Checkbox Switch -->
                                            <label class="toggle-switch toggle-switch-sm" for="toggleColumn_product">
                                                <input type="checkbox" class="toggle-switch-input"
                                                       id="toggleColumn_product" checked="">
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                  </span>
                                            </label>
                                            <!-- End Checkbox Switch -->
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="mr-2">Category</span>

                                            <!-- Checkbox Switch -->
                                            <label class="toggle-switch toggle-switch-sm" for="toggleColumn_type">
                                                <input type="checkbox" class="toggle-switch-input"
                                                       id="toggleColumn_type" checked="">
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                  </span>
                                            </label>
                                            <!-- End Checkbox Switch -->
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="mr-2">Vendor</span>

                                            <!-- Checkbox Switch -->
                                            <label class="toggle-switch toggle-switch-sm" for="toggleColumn_vendor">
                                                <input type="checkbox" class="toggle-switch-input"
                                                       id="toggleColumn_vendor" checked="">
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                  </span>
                                            </label>
                                            <!-- End Checkbox Switch -->
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-3"
                                             style="display: none">
                                            <span class="mr-2">Stocks</span>

                                            <!-- Checkbox Switch -->
                                            <label class="toggle-switch toggle-switch-sm" for="toggleColumn_stocks">
                                                <input type="checkbox" class="toggle-switch-input"
                                                       id="toggleColumn_stocks" checked="">
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                  </span>
                                            </label>
                                            <!-- End Checkbox Switch -->
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="mr-2">Price</span>

                                            <!-- Checkbox Switch -->
                                            <label class="toggle-switch toggle-switch-sm" for="toggleColumn_price">
                                                <input type="checkbox" class="toggle-switch-input"
                                                       id="toggleColumn_price" checked="">
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                  </span>
                                            </label>
                                            <!-- End Checkbox Switch -->
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="mr-2">Quantity</span>

                                            <!-- Checkbox Switch -->
                                            <label class="toggle-switch toggle-switch-sm" for="toggleColumn_quantity">
                                                <input type="checkbox" class="toggle-switch-input"
                                                       id="toggleColumn_quantity" checked="">
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                  </span>
                                            </label>
                                            <!-- End Checkbox Switch -->
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Unfold -->
                    </div>
                </div>
                <!-- End Row -->
            </div>
            <!-- End Header -->

            <!-- Table -->
            <div class="table-responsive datatable-custom">
                <table id="datatable"
                       class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0, 4, 9],
                        "width": "5%",
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "pageLength": 7,
                     "isResponsive": true,
                     "isShowPaging": true,
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
                        <th class="table-column-pl-0">Product</th>
                        <th>Category</th>
                        <th>Vendor</th>
                        <th>Stocks</th>
                        <th style="display: none;">SKU</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th style="display: none">Variants</th>
                        <th>Actions</th>
                    </tr>
                    </thead>

                    <tbody>


                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td class="table-column-pr-0">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input"
                                           id="productsCheck${product.getProduct().getId()}">
                                    <label class="custom-control-label"
                                           for="productsCheck${product.getProduct().getId()}"></label>
                                </div>
                            </td>
                            <td class="table-column-pl-0">
                                <a class="media align-items-center"
                                   href="?action=product-details&id=${product.getProduct().getId()}">
                                    <img class="avatar avatar-lg mr-3" src="imgs/productImg/${product.getImg2()}"
                                         alt="Image Description">
                                    <div class="media-body">
                                        <h5 class="text-hover-primary mb-0">${product.getProduct().getName()}</h5>
                                    </div>
                                </a>
                            </td>
                            <td class="">${product.getProduct().getCategory()}</td>
                            <td class="">Razer Company</td>
                            <td>
                                <label class="toggle-switch toggle-switch-sm"
                                       for="stocksCheckbox${product.getProduct().getId()}">
                                    <input type="checkbox" class="toggle-switch-input"
                                           id="stocksCheckbox${product.getProduct().getId()}" checked="">
                                    <span class="toggle-switch-label">
                                       <span class="toggle-switch-indicator"></span>
                                     </span>
                                </label>
                            </td>
                            <td style="display: none; ">2384741241</td>
                            <td>$${product.getPrice()}</td>
                            <td>${product.getProduct().getAmount_remaining()}</td>
                            <td style="display: none">2</td>
                            <td>
                                <div class="btn-group" role="group">
                                    <a class="btn btn-sm btn-white"
                                       href="?action=update-product&id=${product.getProduct().getId()}">
                                        <i class="tio-edit"></i> Edit
                                    </a>

                                    <!-- Unfold -->
                                    <div class="hs-unfold btn-group">
                                        <a class="js-hs-unfold-invoker btn btn-icon btn-sm btn-white dropdown-toggle dropdown-toggle-empty"
                                           href="javascript:;" data-hs-unfold-options='{
                                              "target": "#productsEditDropdown${product.getProduct().getId()}",
                                              "type": "css-animation",
                                              "smartPositionOffEl": "#datatable"}'></a>


                                        <div id="productsEditDropdown${product.getProduct().getId()}"
                                             class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right mt-1">
                                            <a class="dropdown-item"
                                               href="?action=delete-product&pid=${product.getProduct().getId()}">
                                                <i class="tio-delete-outlined dropdown-item-icon"></i> Delete
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="tio-archive dropdown-item-icon"></i> Archive
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="tio-publish dropdown-item-icon"></i> Publish
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="tio-clear dropdown-item-icon"></i> Unpublish
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Unfold -->
                                </div>
                            </td>
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
                                <option value="10" selected="">10</option>
                                <option value="13">13</option>
                                <option value="16">16</option>
                                <option value="19">19</option>
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
    </div>
    <!-- End Content -->

    <!-- Footer -->

    <div class="footer">
        <div class="row justify-content-between align-items-center">
            <div class="col">
                <p class="font-size-sm mb-0">&copy; Front. <span
                        class="d-none d-sm-inline-block">2020 Htmlstream.</span></p>
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
                                <a class="js-hs-unfold-invoker btn btn-icon btn-ghost-secondary rounded-circle"
                                   href="javascript:;"
                                   data-hs-unfold-options='{
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


<!-- Welcome Message Modal -->
<div class="modal fade" id="welcomeMessageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-close">
                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal"
                        aria-label="Close">
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
                            <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\gitlab-gray.svg"
                                 alt="Image Description">
                        </div>
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\fitbit-gray.svg"
                                 alt="Image Description">
                        </div>
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\flow-xo-gray.svg"
                                 alt="Image Description">
                        </div>
                        <div class="col">
                            <img class="img-fluid ie-welcome-brands" src="assets\svg\brands\layar-gray.svg"
                                 alt="Image Description">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Welcome Message Modal -->

<!-- Export Products Modal -->
<div class="modal fade" id="exportProductsModal" tabindex="-1" role="dialog"
     aria-labelledby="exportProductsModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h4 id="exportProductsModalTitle" class="modal-title">Export products</h4>

                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal"
                        aria-label="Close">
                    <i class="tio-clear tio-lg"></i>
                </button>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="modal-body">
                <p>This CSV file can update all product information. To update just inventory quantites use the <a
                        href="#">CSV file for inventory.</a></p>

                <!-- Form Group -->
                <div class="form-group">
                    <label class="input-label">Export</label>

                    <!-- Custom Checkbox -->
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="exportProductsRadio1" name="exportProductsRadio"
                               class="custom-control-input"
                               checked="">
                        <label class="custom-control-label" for="exportProductsRadio1">Current page</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="exportProductsRadio2" name="exportProductsRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="exportProductsRadio2">All products</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="exportProductsRadio3" name="exportProductsRadio"
                               class="custom-control-input"
                               disabled="">
                        <label class="custom-control-label" for="exportProductsRadio3">Selected: 20 products</label>
                    </div>
                    <!-- End Custom Checkbox -->
                </div>
                <!-- End Form Group -->

                <label class="input-label">Export as</label>

                <!-- Custom Checkbox -->
                <div class="custom-control custom-radio mb-2">
                    <input type="radio" id="exportProductsAsRadio1" name="exportProductsAsRadio"
                           class="custom-control-input"
                           checked="">
                    <label class="custom-control-label" for="exportProductsAsRadio1">CSV for Excel, Numbers, or other
                        spreadsheet programs</label>
                </div>
                <div class="custom-control custom-radio">
                    <input type="radio" id="exportProductsAsRadio2" name="exportProductsAsRadio"
                           class="custom-control-input">
                    <label class="custom-control-label" for="exportProductsAsRadio2">Plain CSV file</label>
                </div>
                <!-- End Custom Checkbox -->
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-white mr-2" data-dismiss="modal" aria-label="Close">Cancel</button>
                <button type="button" class="btn btn-primary">Export products</button>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Export Products Modal -->

<!-- Import Products Modal -->
<div class="modal fade" id="importProductsModal" tabindex="-1" role="dialog"
     aria-labelledby="importProductsModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h4 id="importProductsModalTitle" class="modal-title">Import products by CSV</h4>

                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal"
                        aria-label="Close">
                    <i class="tio-clear tio-lg"></i>
                </button>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="modal-body">
                <p><a href="#">Download a sample CSV template</a> to see an example of the format required.</p>

                <!-- Form Group -->
                <div class="form-group">
                    <!-- Dropzone -->
                    <div id="attachFilesNewProjectLabel" class="js-dropzone dropzone-custom custom-file-boxed">
                        <div class="dz-message custom-file-boxed-label">
                            <img class="avatar avatar-xl avatar-4by3 mb-3" src="assets\svg\illustrations\browse.svg"
                                 alt="Image Description">
                            <h5 class="mb-1">Choose files to upload</h5>
                            <p class="mb-2">or</p>
                            <span class="btn btn-sm btn-primary">Browse files</span>
                        </div>
                    </div>
                    <!-- End Dropzone -->
                </div>
                <!-- End Form Group -->

                <!-- Custom Checkbox -->
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="overwriteCurrentProductsCheckbox">
                    <label class="custom-control-label" for="overwriteCurrentProductsCheckbox">Overwrite any current
                        products
                        that have the same handle. Existing values will be used for any missing columns.<a href="#">Learn
                            more</a></label>
                </div>
                <!-- End Custom Checkbox -->
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-white mr-2" data-dismiss="modal" aria-label="Close">Cancel</button>
                <button type="button" class="btn btn-primary">Upload and continue</button>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Import Products Modal -->

<!-- Product Filter Modal -->
<%--<div id="datatableFilterSidebar" class="hs-unfold-content sidebar sidebar-bordered sidebar-box-shadow">
    <div class="card card-lg sidebar-card sidebar-footer-fixed">
        <div class="card-header">
            <h4 class="card-header-title">Filters</h4>

            <!-- Toggle Button -->
            <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;"
               data-hs-unfold-options='{
                "target": "#datatableFilterSidebar",
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
            <small class="text-cap mb-3">Product vendor</small>

            <div class="row">
                <div class="col-6">
                    <!-- Custom Checkbox -->
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio1" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio1">Google</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio2" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio2">Topman</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio3" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio3">RayBan</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio4" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio4">Mango</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio5" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio5">Calvin Klein</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio6" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio6">Givenchy</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio7" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio7">Asos</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio8" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio8">Apple</label>
                    </div>
                    <!-- End Custom Checkbox -->
                </div>

                <div class="col-6">
                    <!-- Custom Checkbox -->
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio9" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio9">Times</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio10" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio10">Asos</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio11" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio11">Nike Jordan</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio12" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio12">VA RVCA</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio13" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio13">Levis</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio14" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio14">Beats</label>
                    </div>
                    <div class="custom-control custom-radio mb-2">
                        <input type="radio" id="productVendorFilterRadio15" name="productVendorFilterRadio"
                               class="custom-control-input">
                        <label class="custom-control-label" for="productVendorFilterRadio15">Clarks</label>
                    </div>
                    <!-- End Custom Checkbox -->
                </div>
            </div>
            <!-- End Row -->

            <a class="link mt-2" href="javascript:;">
                <i class="tio-clear"></i> Clear
            </a>

            <hr class="my-4">

            <small class="text-cap mb-3">Availability</small>

            <!-- Custom Checkbox -->
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productAvailabilityFilterRadio1" name="productAvailabilityFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productAvailabilityFilterRadio1">Available on Online
                    Store</label>
            </div>
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productAvailabilityFilterRadio2" name="productAvailabilityFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productAvailabilityFilterRadio2">Unavailable on Online
                    Store</label>
            </div>
            <!-- End Custom Checkbox -->

            <a class="link mt-2" href="javascript:;">
                <i class="tio-clear"></i> Clear
            </a>

            <hr class="my-4">

            <small class="text-cap mb-3">Tagged with</small>

            <div class="mb-2">
                <input type="text" class="js-tagify tagify-form-control form-control" name="tagsName" id="tagsLabel"
                       placeholder="Enter tags here" aria-label="Enter tags here">
            </div>

            <a class="link mt-2" href="javascript:;">
                <i class="tio-clear"></i> Clear
            </a>

            <hr class="my-4">

            <small class="text-cap mb-3">Product type</small>

            <!-- Custom Checkbox -->
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productTypeFilterRadio1" name="productTypeFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productTypeFilterRadio1">Shoes</label>
            </div>
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productTypeFilterRadio2" name="productTypeFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productTypeFilterRadio2">Accessories</label>
            </div>
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productTypeFilterRadio3" name="productTypeFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productTypeFilterRadio3">Clothing</label>
            </div>
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productTypeFilterRadio4" name="productTypeFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productTypeFilterRadio4">Electronics</label>
            </div>
            <!-- End Custom Checkbox -->

            <a class="link mt-2" href="javascript:;">
                <i class="tio-clear"></i> Clear
            </a>

            <hr class="my-4">

            <small class="text-cap mb-3">Collection</small>

            <!-- Input Group -->
            <div class="input-group input-group-merge mb-2">
                <div class="input-group-prepend">
            <span class="input-group-text">
              <i class="tio-search"></i>
            </span>
                </div>

                <input type="search" class="form-control" placeholder="Search for collections"
                       aria-label="Search for collections">
            </div>
            <!-- End Input Group -->

            <!-- Custom Checkbox -->
            <div class="custom-control custom-radio mb-2">
                <input type="radio" id="productCollectionFilterRadio1" name="productCollectionFilterRadio"
                       class="custom-control-input">
                <label class="custom-control-label" for="productCollectionFilterRadio1">Home page</label>
            </div>
            <!-- End Custom Checkbox -->

            <a class="link mt-2" href="javascript:;">
                <i class="tio-clear"></i> Clear
            </a>
        </div>
        <!-- End Body -->

        <!-- Footer -->
        <div class="card-footer sidebar-footer">
            <div class="row gx-2">
                <div class="col">
                    <button type="button" class="btn btn-block btn-white">Clear all filters</button>
                </div>
                <div class="col">
                    <button type="button" class="btn btn-block btn-primary">Save</button>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Footer -->
    </div>
</div>--%>
<!-- End Product Filter Modal -->
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

            $(document).on('click', '#closeBuilderPopover', function () {
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


        // INITIALIZATION OF NAV SCROLLER
        // =======================================================
        $('.js-nav-scroller').each(function () {
            new HsNavScroller($(this)).init()
        });


        // INITIALIZATION OF SELECT2
        // =======================================================
        $('.js-select2-custom').each(function () {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });


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

        $('.js-datatable-filter').on('change', function () {
            var $this = $(this),
                elVal = $this.val(),
                targetColumnIndex = $this.data('target-column-index');

            datatable.column(targetColumnIndex).search(elVal).draw();
        });

        $('#datatableSearch').on('mouseup', function (e) {
            var $input = $(this),
                oldValue = $input.val();

            if (oldValue == "") return;

            setTimeout(function () {
                var newValue = $input.val();

                if (newValue == "") {
                    // Gotcha
                    datatable.search('').draw();
                }
            }, 1);
        });

        $('#toggleColumn_product').change(function (e) {
            datatable.columns(1).visible(e.target.checked)
        })

        $('#toggleColumn_type').change(function (e) {
            datatable.columns(2).visible(e.target.checked)
        })


        $('#toggleColumn_vendor').change(function (e) {
            datatable.columns(3).visible(e.target.checked)
        })

        $('#toggleColumn_stocks').change(function (e) {
            datatable.columns(4).visible(e.target.checked)
        })

        $('#toggleColumn_sku').change(function (e) {
            datatable.columns(5).visible(e.target.checked)
        })

        $('#toggleColumn_price').change(function (e) {
            datatable.columns(6).visible(e.target.checked)
        })


        $('#toggleColumn_quantity').change(function (e) {
            datatable.columns(7).visible(e.target.checked)
        })

        $('#toggleColumn_variants').change(function (e) {
            datatable.columns(8).visible(e.target.checked)
        })


        // INITIALIZATION OF TAGIFY
        // =======================================================
        $('.js-tagify').each(function () {
            var tagify = $.HSCore.components.HSTagify.init($(this));
        });
    });
</script>

<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>

</html>