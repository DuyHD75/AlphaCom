<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Title -->
    <title>Add Product - E-commerce </title>

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
<%--  HEADER --%>
<%@include file="../../components/commons/adminCommons/header.jsp" %>
<%--  END HEADER --%>

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

<form id="content" role="main" class="main" action="" method="post">
    <!-- Content -->
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-no-gutter">
                            <li class="breadcrumb-item"><a class="breadcrumb-link" href="ecommerce-products.html">Products</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Add product</li>
                        </ol>
                    </nav>

                    <h1 class="page-header-title">Add product</h1>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->

        <div class="row">
            <div class="col-lg-7">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Product information</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <!-- Form Group -->
                        <div class="form-group">
                            <label for="productNameLabel" class="input-label">Name <i
                                    class="tio-help-outlined text-body ml-1"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Products are the goods or services you sell."></i></label>

                            <input type="text" class="form-control" name="productName"
                                   id="productNameLabel" required
                                   placeholder="Type product name ..."
                                   aria-label="">

                        </div>
                        <!-- End Form Group -->

                        <!-- End Row -->

                        <label class="input-label">Description <span
                                class="input-label-secondary">(Optional)</span></label>

                        <!-- Quill -->
                        <div class="quill-custom">
                            <div class="js-quill " style="min-height: 15rem;" data-hs-quill-options='{
                              "placeholder": "Type your description..."
                             }'>
                            </div>

                            <div class="text-center mt-4">
                                <p class="desc-status text-success m-3"></p>
                                <button id="saveDesc" class="btn btn-primary pr-2 pl-2">
                                    Add Description
                                </button>
                            </div>

                            <input type="hidden" id="description" value="" name="description">
                        </div>
                        <!-- End Quill -->
                    </div>
                    <!-- Body -->
                </div>
                <!-- End Card -->

                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Media</h4>

                        <!-- Unfold -->
                        <%--   <div class="hs-unfold">
                               <a class="js-hs-unfold-invoker btn btn-sm btn-ghost-secondary" href="javascript:;"
                                  data-hs-unfold-options='{
                                              "target": "#mediaDropdown",
                                              "type": "css-animation"
                                            }'>
                                   Add media from URL <i class="tio-chevron-down"></i>
                               </a>

                               <div id="mediaDropdown"
                                    class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right mt-1">
                                   <a class="dropdown-item" href="javascript:;" data-toggle="modal"
                                      data-target="#addImageFromURLModal">
                                       <i class="tio-link dropdown-item-icon"></i> Add image from URL
                                   </a>
                                   <a class="dropdown-item" href="javascript:;" data-toggle="modal"
                                      data-target="#embedVideoModal">
                                       <i class="tio-youtube-outlined dropdown-item-icon"></i> Embed video
                                   </a>
                               </div>
                           </div>--%>
                        <!-- End Unfold -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <!-- Dropzone -->
                        <div id="attachFilesNewProjectLabel" class="js-dropzone dropzone-custom custom-file-boxed">
                            <div class="dz-message custom-file-boxed-label">
                                <img class="avatar avatar-xl avatar-4by3 mb-3" src="assets\svg\illustrations\browse.svg"
                                     alt="Image Description">
                                <h5 class="mb-1">Choose files to upload</h5>
                                <p class="mb-2">or</p>
                                <span class="btn btn-sm btn-primary">Browse files</span>
                            </div>

                            <input type="hidden" name="fileNames" value="" id="fileNames">
                        </div>
                        <!-- End Dropzone -->
                    </div>
                    <!-- Body -->
                </div>
                <!-- End Card -->

            </div>

            <div class="col-lg-5">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Pricing</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <!-- Form Group -->
                        <div class="form-group" id="price-form">
                            <label for="priceNameLabel" class="input-label">Price</label>

                            <div class="input-group">
                                <input type="text" class="form-control" name="product-price" id="priceNameLabel"
                                       placeholder="0.00"
                                       aria-label="0.00" required>

                                <div class="input-group-append">
                                    <!-- Select -->
                                    <div id="priceSelect" class="select2-custom select2-custom-right">
                                        <select class="js-select2-custom custom-select" size="1" style="opacity: 0;"
                                                data-hs-select2-options='{
                                    "dropdownParent": "#priceSelect",
                                    "dropdownAutoWidth": true,
                                    "width": true
                                  }' required>
                                            <option value="USD" selected="">USD</option>
                                        </select>
                                    </div>
                                    <!-- End Select -->
                                </div>
                            </div>

                            <label for="quantityNameLable" class="input-label mt-3">Quantity</label>

                            <div class="input-group">
                                <input type="number" class="form-control"
                                       placeholder="Type quantities of this product ..."
                                       aria-label="" value=""
                                       name="quantity" id="quantityNameLable" required>
                            </div>




                            <!-- End Form Group -->
                        </div>

                        <hr class="my-4">

                        <!-- Toggle Switch -->
                        <label class="row toggle-switch mb-3" for="availabilitySwitch1">
                                    <span class="col-8 col-sm-9 toggle-switch-content">
                                <span class="text-dark ">Availability Discount <i class="tio-help-outlined text-body"
                                                                                  data-toggle="tooltip"
                                                                                  data-placement="top"
                                                                                  title="Product availability switch toggler."></i></span>
                                </span>

                            <span class="col-4 col-sm-3">
                              <input type="checkbox" class="toggle-switch-input"
                                     id="availabilitySwitch1">

                              <span class="toggle-switch-label ml-auto">
                                <span class="toggle-switch-indicator"></span>
                              </span>
                            </span>
                        </label>
                        <!-- End Toggle Switch -->

                        <div class="form-group" id="discount-form" style="display: none">

                            <div class="input-group">
                                <input type="number" class="form-control" name="product-discount"
                                       placeholder="Type discount: 15 -> 15%"
                                       aria-label=""
                                       value="0"
                                       min="0"
                                       id="discountInput">

                                <input type="text" class="form-control" name="discount-name"
                                       placeholder="Type discount code ..."
                                       aria-label=""
                                       value="">
                            </div>
                            <label for="priceNameLabel" class="input-label mt-3">Effective date</label>

                            <div class="input-group">
                                <input type="date" class="form-control" name="start-date"
                                       aria-label=""
                                       value="">

                                <input type="date" class="form-control" name="end-date"
                                       aria-label=""
                                       value="">
                            </div>

                        </div>
                        <!-- Body -->
                    </div>
                    <!-- End Card -->
                </div>

                    <!-- Card -->
                    <div class="card">
                        <!-- Header -->
                        <div class="card-header">
                            <h4 class="card-header-title">Organization</h4>
                        </div>
                        <!-- End Header -->

                        <!-- Body -->
                        <div class="card-body">
                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="vendorLabel" class="input-label">Vendor</label>

                                <select class="js-select2-custom custom-select" size="1" style="opacity: 0;"
                                        id="vendorLabel"
                                        name="vendor"
                                        data-hs-select2-options='{
                            "minimumResultsForSearch": "Infinity",
                            "placeholder": "Select supplier"
                          }'>
                                    <option value="1">Razer Group</option>
                                    <option value="2">FPT Company</option>
                                    <option value="3">ASUSTeK Incorporated</option>
                                    <option value="4">Lenovo Group Ltd</option>
                                    <option value="5">Sony Company</option>
                                </select>
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="categoryLabel" class="input-label">Category</label>

                                <!-- Select -->
                                <select class="js-select2-custom custom-select" size="1" style="opacity: 0;"
                                        id="categoryLabel"
                                        name="category"
                                        data-hs-select2-options='{
                            "minimumResultsForSearch": "Infinity",
                            "placeholder": "Select category"
                          }'>
                                    <option label="empty"></option>
                                    <option value="1">Laptop</option>
                                    <option value="2">Mouse</option>
                                    <option value="3">Keyboard</option>
                                    <option value="4">Monitor</option>
                                    <option value="5">PC</option>
                                    <option value="6">Headphone</option>
                                </select>
                                <!-- End Select -->
                            </div>
                            <!-- Form Group -->

                            <label for="tagsLabel" class="input-label">Tags</label>

                            <input type="text" class="js-tagify tagify-form-control form-control" name="tagsName"
                                   id="tagsLabel"
                                   placeholder="Enter tags here" aria-label="Enter tags here">
                        </div>
                        <!-- End Body -->
                    </div>
                    <!-- End Card -->
                </div>
            </div>
            <!-- End Row -->

            <div class="position-fixed bottom-0 content-centered-x w-10 z-index-99 mb-3" style="max-width: 40rem;">
                <!-- Card -->
                <div class="card card-sm bg-dark border-dark ">
                    <div class="card-body">
                        <div class="row justify-content-center justify-content-sm-between">
                            <div class="col">
                                <button type="button" class="btn btn-ghost-light bg-danger">
                                    <Delete>Delete</Delete>
                                </button>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-ghost-light mr-2">Discard</button>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                </div>
                <!-- End Card -->
            </div>
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
</form>
<!-- ========== END MAIN CONTENT ========== -->

<!-- ========== SECONDARY CONTENTS ========== -->
<!-- Keyboard Shortcuts -->
<div id="keyboardShortcutsSidebar" class="hs-unfold-content sidebar sidebar-bordered sidebar-box-shadow">
    <div class="card card-lg sidebar-card">
        <div class="card-header">
            <h4 class="card-header-title">Keyboard shortcuts</h4>

            <!-- Toggle Button -->
            <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;"
               data-hs-unfold-options='{
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
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">b</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <em>italic</em>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">i</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <u>Underline</u>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">u</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <s>Strikethrough</s>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">s</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span class="small">Small text</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">s</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <mark>Highlight</mark>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">e</kbd>
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
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">r</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find next</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">n</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find previous</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">p</kbd>
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
                            <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Tab</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Move line up</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1"><i class="tio-arrow-large-upward-outlined"></i></kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Move line down</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1"><i
                                class="tio-arrow-large-downward-outlined font-size-sm"></i></kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Add a comment</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">m</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Undo</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">z</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Redo</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">y</kbd>
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
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">n</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Present</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">p</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Share</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">s</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Search docs</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">o</kbd>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Keyboard shortcuts</span>
                        </div>
                        <div class="col-7 text-right">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd
                                class="d-inline-block mb-1">/</kbd>
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
            <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;"
               data-hs-unfold-options='{
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

                            <p class="font-size-sm mb-1">Added 2 files to task <a class="text-uppercase" href="#"><i
                                    class="tio-folder-bookmarked"></i> Fd-7</a></p>

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
                            <span class="d-block font-size-sm text-dark text-truncate"
                                  title="weekly-reports.xls">weekly-reports.xls</span>
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
                            <span class="d-block font-size-sm text-dark text-truncate"
                                  title="weekly-reports.xls">weekly-reports.xls</span>
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

                            <p class="font-size-sm mb-1">Marked <a class="text-uppercase" href="#"><i
                                    class="tio-folder-bookmarked"></i> Fr-6</a> as <span
                                    class="badge badge-soft-success badge-pill"><span
                                    class="legend-indicator bg-success"></span>"Completed"</span></p>

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
                                            <img class="img-fluid rounded ie-sidebar-activity-img"
                                                 src="assets\svg\illustrations\card-1.svg"
                                                 alt="Image Description">
                                        </div>
                                        <div class="col">
                                            <img class="img-fluid rounded ie-sidebar-activity-img"
                                                 src="assets\svg\illustrations\card-2.svg"
                                                 alt="Image Description">
                                        </div>
                                        <div class="col">
                                            <img class="img-fluid rounded ie-sidebar-activity-img"
                                                 src="assets\svg\illustrations\card-3.svg"
                                                 alt="Image Description">
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

                            <p class="font-size-sm mb-1">Marked <a class="text-uppercase" href="#"><i
                                    class="tio-folder-bookmarked"></i> Fr-3</a> as <span
                                    class="badge badge-soft-success badge-pill"><span
                                    class="legend-indicator bg-success"></span>"Completed"</span></p>

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

                            <p class="font-size-sm mb-1">Earned a "Top endorsed" <i
                                    class="tio-verified text-primary"></i> badge</p>

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

                            <p class="font-size-sm mb-1">Marked <a class="text-uppercase" href="#"><i
                                    class="tio-folder-bookmarked"></i> Fr-3</a> as <span
                                    class="badge badge-soft-primary badge-pill"><span
                                    class="legend-indicator bg-primary"></span>"In
                    progress"</span></p>

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

<!-- Add Image from URL Modal -->
<div class="modal fade" id="addImageFromURLModal" tabindex="-1" role="dialog"
     aria-labelledby="addImageFromURLModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h4 id="addImageFromURLModalTitle" class="modal-title">Add image from URL</h4>

                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal"
                        aria-label="Close">
                    <i class="tio-clear tio-lg"></i>
                </button>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="modal-body">
                <label for="pasteImageURLNameLabel" class="input-label">Paste image URL</label>
                <input type="text" class="form-control" name="projectName" id="pasteImageURLNameLabel"
                       placeholder="https://"
                       aria-label="https://">
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-white mr-2" data-dismiss="modal" aria-label="Close">Cancel</button>
                <button type="button" class="btn btn-primary">Add media</button>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Add Image from URL Modal -->

<!-- Embed Video Modal -->
<div class="modal fade" id="embedVideoModal" tabindex="-1" role="dialog" aria-labelledby="embedVideoModalTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h4 id="embedVideoModalTitle" class="modal-title">Embed video</h4>

                <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary" data-dismiss="modal"
                        aria-label="Close">
                    <i class="tio-clear tio-lg"></i>
                </button>
            </div>
            <!-- End Header -->

            <!-- Body -->
            <div class="modal-body">
                <label for="pasteVideoURLNameLabel" class="input-label">Paste video URL</label>
                <input type="text" class="form-control" name="projectName" id="pasteVideoURLNameLabel"
                       placeholder="https://"
                       aria-label="https://">
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-white mr-2" data-dismiss="modal" aria-label="Close">Cancel</button>
                <button type="button" class="btn btn-primary">Add media</button>
            </div>
            <!-- End Footer -->
        </div>
    </div>
    -
</div>
<!-- End Embed Video Modal -->

<!-- Products Advanced Features Modal -->
<div class="modal fade" id="productsAdvancedFeaturesModal" tabindex="-1" role="dialog" aria-hidden="true">
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
            <div class="modal-body">
                <div class="text-center mb-7">
                    <h4 class="h1">Advanced features</h4>
                    <p>"Compare to" Price, Bulk Discount Pricing, Inventory Tracking</p>

                    <a class="btn btn-primary" href="#">
                        <i class="tio-star mr-1"></i> Upgrade to get these features
                    </a>
                </div>

                <!-- Media -->
                <div class="d-sm-flex">
                    <img class="avatar avatar-xl avatar-4by3 mb-3 mb-sm-0 mr-4"
                         src="assets\svg\illustrations\choice.svg"
                         alt="Image Description">

                    <div class="media-body">
                        <h4>"Compare to" price</h4>
                        <p>Use this feature when you want to put a product on sale or show savings off suggested retail
                            pricing.
                        </p>
                    </div>
                </div>
                <!-- End Media -->

                <hr class="my-4">

                <!-- Media -->
                <div class="d-sm-flex">
                    <img class="avatar avatar-xl avatar-4by3 mb-3 mb-sm-0 mr-4"
                         src="assets\svg\illustrations\presenting.svg"
                         alt="Image Description">

                    <div class="media-body">
                        <h4>Bulk discount pricing</h4>
                        <p>Encourage higher purchase quantities with volume discounts.</p>
                    </div>
                </div>
                <!-- End Media -->

                <hr class="my-4">

                <!-- Media -->
                <div class="d-sm-flex">
                    <img class="avatar avatar-xl avatar-4by3 mb-3 mb-sm-0 mr-4" src="assets\svg\illustrations\book.svg"
                         alt="Image Description">

                    <div class="media-body">
                        <h4>Inventory tracking</h4>
                        <p>Automatically keep track of product availability and receive notifications when inventory
                            levels get
                            low.</p>
                    </div>
                </div>
                <!-- End Media -->
            </div>
            <!-- End Body -->

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-white mr-2" data-dismiss="modal" aria-label="Close">Close</button>
                <button type="button" class="btn btn-primary">Upgrade now</button>
            </div>
            <!-- End Footer -->
        </div>
    </div>
</div>
<!-- End Products Advanced Features Modal -->
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

        // ============================ SET THE CURR DATE ==========
        var today = new Date().toISOString().split('T')[0];
        document.getElementsByName("start-date")[0].setAttribute('min', today);
        document.getElementsByName("end-date")[0].setAttribute('min', today);

        // HANDLE TOGGLE SWITCH
        // =======================================================

        if ($("#availabilitySwitch1").is(":checked")) {
            $("#discount-form").show();
        }

        $("#availabilitySwitch1").change(function () {
            var discountForm = $('#discount-form')
            if ($(this).is(":checked")) {
                discountForm.show();
            } else {
                discountForm.hide();
                discountForm.find('input[name="product-discount"]').val(0)
            }
        });

        //=============================================================

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


        // INITIALIZATION OF SELECT2
        // =======================================================
        $('.js-select2-custom').each(function () {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });


        // INITIALIZATION OF QUILLJS EDITOR
        // =======================================================
        var quill = $.HSCore.components.HSQuill.init('.js-quill');

        $('#saveDesc').on('click', function () {
            event.preventDefault();

            var data = quill.getText();
            var desc = $('#description').val(quill.getText());

            $('.desc-status').text("Description was added !");
        });


        // INITIALIZATION OF ADD INPUT FILED
        // =======================================================
        $('.js-add-field').each(function () {
            new HSAddField($(this), {
                addedField: function () {
                    $('.js-add-field .js-select2-custom-dynamic').each(function () {
                        var select2dynamic = $.HSCore.components.HSSelect2.init($(this));
                    });
                }
            }).init();
        });


        // INITIALIZATION OF TAGIFY
        // =======================================================
        $('.js-tagify').each(function () {
            var tagify = $.HSCore.components.HSTagify.init($(this));
        });


        // INITIALIZATION OF DROPZONE FILE ATTACH MODULE
        // =======================================================


        var fileNamesArr = [];
        $('.js-dropzone').each(function () {
            var dropzone = $.HSCore.components.HSDropzone.init('#' + $(this).attr('id'));
            console.log(dropzone)
            dropzone.on('addedfile', function (file) {
                console.log(file.name);
                fileNamesArr.push(file.name)
                var files = $('#fileNames').val(fileNamesArr.join(" ; "));
                console.log(files)
                console.log($('.ql-editor').val())
            });
        });

    });
</script>

<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>

</html>