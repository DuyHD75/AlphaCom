<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Title -->
  <title>Add User | Admin &amp; Dashboard Admin</title>

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
<%@ include file="header.jsp"%>


<!-- ONLY DEV -->

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
    <!-- Step Form -->
    <form class="js-step-form py-md-5" data-hs-step-form-options='{
                "progressSelector": "#addUserStepFormProgress",
                "stepsSelector": "#addUserStepFormContent",
                "endSelector": "#addUserFinishBtn",
                "isValidate": false
              }'>
      <div class="row justify-content-lg-center">
        <div class="col-lg-8">
          <!-- Step -->
          <ul id="addUserStepFormProgress" class="js-step-progress step step-sm step-icon-sm step step-inline step-item-between mb-3 mb-md-5">
            <li class="step-item">
              <a class="step-content-wrapper" href="javascript:;" data-hs-step-form-next-options='{
                      "targetSelector": "#addUserStepProfile"
                    }'>
                <span class="step-icon step-icon-soft-dark">1</span>
                <div class="step-content">
                  <span class="step-title">Profile</span>
                </div>
              </a>
            </li>

            <li class="step-item d-none">
              <a class="step-content-wrapper" href="javascript:;" data-hs-step-form-next-options='{
                      "targetSelector": "#addUserStepBillingAddress"
                    }'>
                <span class="step-icon step-icon-soft-dark">2</span>
                <div class="step-content">
                  <span class="step-title">Billing address</span>
                </div>
              </a>
            </li>

            <li class="step-item ">
              <a class="step-content-wrapper" href="javascript:;" data-hs-step-form-next-options='{
                      "targetSelector": "#addUserStepConfirmation"
                    }'>
                <span class="step-icon step-icon-soft-dark">2</span>
                <div class="step-content">
                  <span class="step-title">Confirmation</span>
                </div>
              </a>
            </li>
          </ul>
          <!-- End Step -->
        <form method="post" action="" id="form-add">
          <input type="hidden" name="formType" value="form4">
          <!-- Content Step Form -->
          <div id="addUserStepFormContent">
            <!-- Card -->
            <div id="addUserStepProfile" class="card card-lg active">
              <!-- Body -->
              <div class="card-body">
                <!-- Form Group -->
                  <div class="row form-group">
                    <label class="col-sm-3 col-form-label input-label">Avatar</label>

                    <div class="col-sm-9">
                      <div class="d-flex align-items-center">
                        <!-- Avatar -->
                        <label class="avatar avatar-xl avatar-circle avatar-uploader mr-5" for="avatarUploader">
                          <img id="avatarImg" class="avatar-img" src="assets\img\160x160\img1.jpg" alt="Image Description">

                          <input type="file" class="js-file-attach avatar-uploader-input" id="avatarUploader" data-hs-file-attach-options='{
                                      "textTarget": "#avatarImg",
                                      "mode": "image",
                                      "targetAttr": "src",
                                      "resetTarget": ".js-file-attach-reset-img",
                                      "resetImg": "./assets/img/160x160/img1.jpg",
                                      "allowTypes": [".png", ".jpeg", ".jpg"]
                                   }'>

                          <span class="avatar-uploader-trigger">
                              <i class="tio-edit avatar-uploader-icon shadow-soft"></i>
                            </span>
                        </label>
                        <!-- End Avatar -->

                        <button type="button" class="js-file-attach-reset-img btn btn-white">Delete</button>
                      </div>
                    </div>
                  </div>
                  <!-- End Form Group -->

                  <!-- Form Group -->
                  <div class="row form-group">
                    <label for="firstNameLabel" class="col-sm-3 col-form-label input-label">Full name <i class="tio-help-outlined text-body ml-1" data-toggle="tooltip" data-placement="top" title="Displayed on public forums, such as Front."></i></label>

                    <div class="col-sm-9">
                      <div class="input-group input-group-sm-down-break">
                        <input type="text" class="form-control" name="name" id="firstNameLabel" placeholder="Clarice" aria-label="Clarice">
                      </div>
                      <span class="form__msg"></span>
                    </div>
                  </div>
                  <!-- End Form Group -->

                  <!-- Form Group -->
                  <div class="row form-group">
                    <label for="emailLabel" class="col-sm-3 col-form-label input-label">Email</label>

                    <div class="col-sm-9">
                      <input type="email" class="form-control" name="email" id="emailLabel" placeholder="clarice@example.com" aria-label="clarice@example.com">
                    </div>
                    <span class="form__msg"></span>
                  </div>
                  <!-- End Form Group -->

                  <!-- Form Group -->
                  <div class="js-add-field row form-group" data-hs-add-field-options='{
                            "template": "#addPhoneFieldTemplate",
                            "container": "#addPhoneFieldContainer",
                            "defaultCreated": 0
                          }'>
                    <label for="phoneLabel" class="col-sm-3 col-form-label input-label">Phone <span class="input-label-secondary">(Optional)</span></label>

                    <div class="col-sm-9">
                      <div class="input-group input-group-sm-down-break align-items-center">
                        <input type="text" class="js-masked-input form-control" name="phone" id="phoneLabel" placeholder="" aria-label="" >
                        <span class="form__msg"></span>
                        <div class="input-group-append d-none">
                          <!-- Select -->
                          <div class="select2-custom">
                            <select class="js-select2-custom custom-select" size="1" style="opacity: 0;" name="phoneSelect" data-hs-select2-options='{
                                      "minimumResultsForSearch": "Infinity",
                                      "dropdownAutoWidth": true,
                                      "width": "6rem"
                                    }'>
                              <option value="Mobile" selected="">Mobile</option>
                              <option value="Home">Home</option>
                              <option value="Work">Work</option>
                              <option value="Fax">Fax</option>
                              <option value="Direct">Direct</option>
                            </select>
                            <!-- End Select -->
                          </div>
                        </div>
                      </div>

                      <!-- Container For Input Field -->
                      <div id="addPhoneFieldContainer"></div>

                      <a class="js-create-field form-link btn btn-sm btn-no-focus btn-ghost-primary d-none" href="javascript:;">
                        <i class="tio-add"></i> Add phone
                      </a>
                    </div>
                  </div>
                  <!-- End Form Group -->

                  <!-- Add Phone Input Field -->
                <div class="row form-group">
                  <label for="addressLineLabel" class="col-sm-3 col-form-label input-label">Address line </label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="addressLine" id="addressLineLabel" placeholder="Your address" aria-label="Your address">
                  </div>
                  <span class="form__msg"></span>
                </div>
                  <!-- End Add Phone Input Field -->
                <div class="row form-group">
                  <label for="roleLabel" class="col-sm-3 col-form-label input-label">Role</label>

                  <div class="input-group " id="roleLabel">
                    <!-- Select -->
                    <div class="select2-custom auto-apply">
                      <select class="js-select2-custom custom-select" size="1" style="opacity: 0;" name="roleSelect" data-hs-select2-options='{
                                      "minimumResultsForSearch": "Infinity",
                                      "dropdownAutoWidth": true,
                                      "width": "6rem"
                                    }'>
                        <option value="Sale" selected="">Sales</option>
                        <option value="Marketing">Marketing</option>
                        <option value="Financial Manager">Financial Manager</option>
                        <option value="Customer Support">Customer Support</option>
                        <option value="Product Manager">Product Manager</option>
                      </select>
                      <!-- End Select -->
                    </div>
                  </div>
                </div>
                  <!-- Add Phone Input Field -->
                  <div id="addPhoneFieldTemplate" class="input-group-add-field" style="display: none;">
                    <div class="input-group input-group-sm-down-break align-items-center">
                      <input type="text" class="js-masked-input form-control" data-name="additionlPhone" placeholder="+x(xxx)xxx-xx-xx" aria-label="+x(xxx)xxx-xx-xx" data-hs-mask-options='{
                                 "template": "+0(000)000-00-00"
                               }'>

                      <div class="input-group-append">
                        <!-- Select -->
                        <div class="select2-custom">
                          <select class="js-select2-custom-dynamic custom-select" size="1" style="opacity: 0;" data-name="additionlPhoneSelect" data-hs-select2-options='{
                                    "minimumResultsForSearch": "Infinity",
                                    "dropdownAutoWidth": true,
                                    "width": "6rem"
                                  }'>
                            <option value="Mobile" selected="">Mobile</option>
                            <option value="Home">Home</option>
                            <option value="Work">Work</option>
                            <option value="Fax">Fax</option>
                            <option value="Direct">Direct</option>
                          </select>
                        </div>
                        <!-- End Select -->
                      </div>
                    </div>

                    <a class="js-delete-field input-group-add-field-delete" href="javascript:;">
                      <i class="tio-clear"></i>
                    </a>
                  </div>
                  <!-- End Add Phone Input Field -->

                  <!-- Form Group -->
                  <div class="row form-group d-none">
                    <label for="organizationLabel" class="col-sm-3 col-form-label input-label">Organization</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" name="organization" id="organizationLabel" placeholder="Htmlstream" aria-label="Htmlstream">
                    </div>
                  </div>
                  <!-- End Form Group -->

                  <!-- Form Group -->
                  <div class="row form-group d-none">
                    <label for="departmentLabel" class="col-sm-3 col-form-label input-label">Department</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" name="department" id="departmentLabel" placeholder="Human resources" aria-label="Human resources">
                    </div>
                  </div>
                  <!-- End Form Group -->

                  <!-- Form Group -->
                  <div class="row d-none">
                    <label class="col-sm-3 col-form-label input-label">Account type</label>

                    <div class="col-sm-9">
                      <div class="input-group input-group-sm-down-break">
                        <!-- Custom Radio -->
                        <div class="form-control">
                          <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="userAccountTypeRadio" id="userAccountTypeRadio1">
                            <label class="custom-control-label" for="userAccountTypeRadio1">Individual</label>
                          </div>
                        </div>
                        <!-- End Custom Radio -->

                        <!-- Custom Radio -->
                        <div class="form-control">
                          <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="userAccountTypeRadio" id="userAccountTypeRadio2">
                            <label class="custom-control-label" for="userAccountTypeRadio2">Company</label>
                          </div>
                        </div>
                        <!-- End Custom Radio -->
                      </div>
                    </div>
                  </div>
                  <!-- End Form Group -->
                  <div class="card-footer d-flex justify-content-end align-items-center">
                    <button type="button" class="btn btn-primary" data-hs-step-form-next-options='{
                              "targetSelector": "#addUserStepConfirmation"
                            }'>
                      Next <i class="tio-chevron-right"></i>
                    </button>
                  </div>


              </div>
              <!-- End Body -->

              <!-- Footer -->

              <!-- End Footer -->
            </div>
            <!-- End Card -->

<%--            <div id="addUserStepBillingAddress" class="card card-lg d-none" style="display: none;">--%>
<%--              <!-- Body -->--%>
<%--              <div class="card-body">--%>
<%--                <!-- Form Group -->--%>
<%--                <div class="row form-group">--%>
<%--                  <label for="locationLabel" class="col-sm-3 col-form-label input-label">Location</label>--%>

<%--                  <div class="col-sm-9">--%>
<%--                    <!-- Select -->--%>
<%--                    <div class="mb-3">--%>
<%--                      <select class="js-select2-custom custom-select" size="1" style="opacity: 0;" id="locationLabel" data-hs-select2-options='{--%>
<%--                                    "placeholder": "Select country",--%>
<%--                                    "searchInputPlaceholder": "Search a country"--%>
<%--                                  }'>--%>
<%--                        <option label="empty"></option>--%>
<%--                        <option value="AF" data-option-template='<span class="d-flex align-items-center"><img class="avatar avatar-xss avatar-circle mr-2" src="./assets/vendor/flag-icon-css/flags/1x1/af.svg" alt="Afghanistan Flag" /><span class="text-truncate">Afghanistan</span></span>'>Afghanistan</option>--%>
<%--                            </select>--%>
<%--                    </div>--%>
<%--                    <!-- End Select -->--%>

<%--                    <div class="mb-3">--%>
<%--                      <input type="text" class="form-control" name="city" id="cityLabel" placeholder="City" aria-label="City">--%>
<%--                    </div>--%>

<%--                    <input type="text" class="form-control" name="state" id="stateLabel" placeholder="State" aria-label="State">--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--                <!-- End Form Group -->--%>

<%--                <!-- Form Group -->--%>
<%--                <div class="row form-group">--%>
<%--                  <label for="addressLine1Label" class="col-sm-3 col-form-label input-label">Address line 1</label>--%>

<%--                  <div class="col-sm-9">--%>
<%--                    <input type="text" class="form-control" name="addressLine1" id="addressLine1Label" placeholder="Your address" aria-label="Your address">--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--                <!-- End Form Group -->--%>

<%--                <!-- Form Group -->--%>
<%--                <div class="js-add-field row form-group" data-hs-add-field-options='{--%>
<%--                            "template": "#addAddressFieldTemplate",--%>
<%--                            "container": "#addAddressFieldContainer",--%>
<%--                            "defaultCreated": 0--%>
<%--                          }'>--%>
<%--                  <label for="addressLine2Label" class="col-sm-3 col-form-label input-label">Address line 2 <span class="input-label-secondary">(Optional)</span></label>--%>

<%--                  <div class="col-sm-9">--%>
<%--                    <input type="text" class="form-control" name="addressLine2" id="addressLine2Label" placeholder="Your address" aria-label="Your address">--%>

<%--                    <!-- Container For Input Field -->--%>
<%--                    <div id="addAddressFieldContainer"></div>--%>

<%--                    <a href="javascript:;" class="js-create-field form-link btn btn-sm btn-no-focus btn-ghost-primary">--%>
<%--                      <i class="tio-add"></i> Add address--%>
<%--                    </a>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--                <!-- End Form Group -->--%>

<%--                <!-- Form Group -->--%>
<%--                <div class="row ">--%>
<%--                  <label for="zipCodeLabel" class="col-sm-3 col-form-label input-label">Zip code <i class="tio-help-outlined text-body ml-1" data-toggle="tooltip" data-placement="top" title="You can find your code in a postal address."></i></label>--%>

<%--                  <div class="col-sm-9">--%>
<%--                    <input type="text" class="js-masked-input form-control" name="zipCode" id="zipCodeLabel" placeholder="Your zip code" aria-label="Your zip code" data-hs-mask-options='{--%>
<%--                                 "template": "AA0 0AA"--%>
<%--                               }'>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--                <!-- End Form Group -->--%>
<%--              </div>--%>
<%--              <!-- End Body -->--%>

<%--              <!-- Footer -->--%>
<%--              <div class="card-footer d-flex align-items-center">--%>
<%--                <button type="button" class="btn btn-ghost-secondary" data-hs-step-form-prev-options='{--%>
<%--                         "targetSelector": "#addUserStepProfile"--%>
<%--                       }'>--%>
<%--                  <i class="tio-chevron-left"></i> Previous step--%>
<%--                </button>--%>

<%--                <div class="ml-auto">--%>
<%--                  <button type="button" class="btn btn-primary" data-hs-step-form-next-options='{--%>
<%--                                "targetSelector": "#addUserStepConfirmation"--%>
<%--                              }'>--%>
<%--                    Next <i class="tio-chevron-right"></i>--%>
<%--                  </button>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <!-- End Footer -->--%>
<%--            </div>--%>

            <div id="addUserStepConfirmation" class="card card-lg" style="display: none;">
              <!-- Profile Cover -->
              <div class="profile-cover">
                <div class="profile-cover-img-wrapper">
                  <img class="profile-cover-img" src="assets\img\1920x400\img1.jpg" alt="Image Description">
                </div>
              </div>
              <!-- End Profile Cover -->

              <!-- Avatar -->
              <div class="avatar avatar-xxl avatar-circle avatar-border-lg profile-cover-avatar">
                <img class="avatar-img" src="assets\img\160x160\img9.jpg" alt="Image Description">
              </div>
              <!-- End Avatar -->


              <!-- Body -->
              <%-- m sẽ tạo ra các input hidden chua dât của các trường vd--%>


              <div class="card-body">
                <dl class="row">
                  <dt class="col-sm-6 text-sm-right">Full name:</dt>
                  <dd class="col-sm-6">-</dd>

                  <dt class="col-sm-6 text-sm-right">Email:</dt>
                  <dd class="col-sm-6">-</dd>

                  <dt class="col-sm-6 text-sm-right">Phone:</dt>
                  <dd class="col-sm-6">-</dd>

                  <dt class="col-sm-6 text-sm-right">Address line :</dt>
                  <dd class="col-sm-6">-</dd>

                  <dt class="col-sm-6 text-sm-right">Role:</dt>
                  <dd class="col-sm-6">-</dd>


                </dl>
                <!-- End Row -->
              </div>
              <!-- End Body -->

              <!-- Footer -->
              <div class="card-footer d-sm-flex align-items-sm-center">
                <button type="button" class="btn btn-ghost-secondary mb-2 mb-sm-0" data-hs-step-form-prev-options='{
                         "targetSelector": "#addUserStepBillingAddress"
                       }'>
                  <i class="tio-chevron-left"></i> Previous step
                </button>

                <div class="ml-auto">
                  <button type="button" class="btn btn-white mr-2">Save in drafts</button>

                  <button id="addUserFinishBtn" type="submit" class="btn btn-primary">Add user</button>
                </div>
              </div>
              <!-- End Footer -->
            </div>
          </div>
          <!-- End Content Step Form -->


          <!-- End Message Body -->
        </form>


      </div>
      <!-- End Row -->

    <!-- End Step Form -->
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
<!-- ========== END SECONDARY CONTENTS ========== -->


<!-- JS Implementing Plugins -->
<script src="assets\js\vendor.min.js"></script>



<!-- JS Front -->
<script src="assets\js\theme.min.js"></script>
<script src="js/validator.js" type="text/javascript"></script>
<script>
  Validator({
    form: '#form-add',
    formGroupSelector: '.form-group',
    erorrSelector: '.form__msg',
        rules: [
      Validator.isRequired('#firstNameLabel', 'Please enter your full name'),
      Validator.isRequired('#emailLabel', 'Please enter your email address'),
      Validator.isEmail('#emailLabel'),
      Validator.isRequired('#phoneLabel', 'Please enter your phone number'),
      Validator.isPhoneNumber('#phoneLabel'),
      Validator.isRequired('#addressLineLabel','Please enter your address')  ],});
</script>
<!-- JS Plugins Init. -->
<script>
  $(document).on('ready', function () {
    // ONLY DEV
    // =======================================================
    // chỗ ni là add dât qua bên kia h bấm add user đay lên thì làm ren
    const nextBtn = document.querySelector('#addUserStepProfile .card-footer button');
    nextBtn.addEventListener('click', function() {
      // Lấy giá trị của các trường input trong addUserStepProfile
      const name = document.querySelector('#firstNameLabel').value;
      const email = document.querySelector('#emailLabel').value;
      const phone = document.querySelector('#phoneLabel').value;
      const role = document.querySelector('[name="roleSelect"]').value;
      const address = document.querySelector('#addressLineLabel').value;

      // Gán giá trị vào các thẻ dd tương ứng trong addUserStepConfirmation
      document.querySelector('#addUserStepConfirmation dd:nth-child(2)').textContent = name;
      document.querySelector('#addUserStepConfirmation dd:nth-child(4)').textContent = email;
      document.querySelector('#addUserStepConfirmation dd:nth-child(6)').textContent = phone;
      document.querySelector('#addUserStepConfirmation dd:nth-child(10)').textContent = role;
      document.querySelector('#addUserStepConfirmation dd:nth-child(8)').textContent = address;
    });
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


    // INITIALIZATION OF FILE ATTACH
    // =======================================================
    $('.js-file-attach').each(function () {
      var customFile = new HSFileAttach($(this)).init();
    });


    // INITIALIZATION OF STEP FORM
    // =======================================================
    $('.js-step-form').each(function () {
      var stepForm = new HSStepForm($(this), {
        finish: function() {
          $("#addUserStepFormProgress").hide();
          $("#addUserStepFormContent").hide();
          $("#successMessageContent").show();
        }
      }).init();
    });


    // INITIALIZATION OF MASKED INPUT
    // =======================================================
    $('.js-masked-input').each(function () {
      var mask = $.HSCore.components.HSMask.init($(this));
    });


    // INITIALIZATION OF SELECT2
    // =======================================================
    $('.js-select2-custom').each(function () {
      var select2 = $.HSCore.components.HSSelect2.init($(this));
    });


    // INITIALIZATION OF ADD INPUT FILED
    // =======================================================
    $('.js-add-field').each(function () {
      new HSAddField($(this), {
        addedField: function() {
          $('.js-add-field .js-select2-custom-dynamic').each(function () {
            var select2dynamic = $.HSCore.components.HSSelect2.init($(this));
          });
        }
      }).init();
    });
  });
</script>

<!-- IE Support -->
<script>
  if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>
