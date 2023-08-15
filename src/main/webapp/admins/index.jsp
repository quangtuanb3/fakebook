<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" href="../images/fb_icon.png" type="image/x-icon" />
  <title>Facebook Management</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lineicons@2.0.0/dist/css/LineIcons.min.css">
</head>
  <!-- ========== All CSS files linkup ========= -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
  <link rel="stylesheet" href="../assets/css/lineicons.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="../assets/css/fullcalendar.css" />
  <link rel="stylesheet" href="../assets/css/fullcalendar.css" />
  <link rel="stylesheet" href="../assets/css/main.css" />
</head>

<body>
  <!-- ======== Preloader =========== -->
  <div id="preloader">
    <div class="spinner"></div>
  </div>
  <!-- ======== Preloader =========== -->

  <!-- ======== sidebar-nav start =========== -->
  <aside class="sidebar-nav-wrapper">
    <div class="navbar-logo">
      <a href="index.jsp">
        <img src="../assets/images/logo/logo.svg" alt="logo" />
      </a>
    </div>

    <nav class="sidebar-nav">
 
      <ul>
        <li class="nav-item nav-item-has-children slidebar-active" >
        </li>

        <li class="nav-item nav-item-has-children" >
          <div style="text-align: left; margin-left: 10px;" >
            <a href="/admins/users-management">
            <span class="icon" style="padding: 10px; font-size: 17px;">
              <i class="fa fa-profile"></i>
            </span>
           <span class="text" style="line-height: 10px;">USER</span>
            </a>

          </div>
        </li>

        <li class="nav-item nav-item-has-children" >
          <div style="text-align: left; margin-left: 10px;" >
            <a href="/admins/posts-management">
                <span class="icon" style="padding: 10px; font-size: 17px;">
              <i class="fa fa-paste"></i>
            </span>
              <span class="text" style="line-height: 10px;">POST</span>
            </a>

          </div>
        </li>

        <li class="nav-item nav-item-has-children" >

        </li>
       

      </ul>
    </nav>
  </aside>
  <div class="overlay"></div>
  <!-- ======== sidebar-nav end =========== -->

  <!-- ======== main-wrapper start =========== -->
  <main class="main-wrapper">
    <!-- ========== header start ========== -->
    <header class="header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-5 col-md-5 col-6">
            <div class="header-left d-flex align-items-center">
              <div class="menu-toggle-btn mr-15">
                <button id="menu-toggle" class="main-btn primary-btn btn-hover">
                  <i class="lni lni-chevron-left me-2"></i> Menu
                </button>
              </div>
              <div class="header-search d-none d-md-flex">
                <form action="#">
                  <input type="text" placeholder="Search..." />
                  <button><i class="lni lni-search-alt"></i></button>
                </form>
              </div>
            </div>
          </div>
          <div class="col-lg-7 col-md-7 col-6">
            <div class="header-right">
              <!-- notification start -->
              <div class="notification-box ml-15 d-none d-md-flex">
                <button class="dropdown-toggle" type="button" id="notification" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M11 20.1667C9.88317 20.1667 8.88718 19.63 8.23901 18.7917H13.761C13.113 19.63 12.1169 20.1667 11 20.1667Z"
                      fill="" />
                    <path
                      d="M10.1157 2.74999C10.1157 2.24374 10.5117 1.83333 11 1.83333C11.4883 1.83333 11.8842 2.24374 11.8842 2.74999V2.82604C14.3932 3.26245 16.3051 5.52474 16.3051 8.24999V14.287C16.3051 14.5301 16.3982 14.7633 16.564 14.9352L18.2029 16.6342C18.4814 16.9229 18.2842 17.4167 17.8903 17.4167H4.10961C3.71574 17.4167 3.5185 16.9229 3.797 16.6342L5.43589 14.9352C5.6017 14.7633 5.69485 14.5301 5.69485 14.287V8.24999C5.69485 5.52474 7.60672 3.26245 10.1157 2.82604V2.74999Z"
                      fill="" />
                  </svg>
                  <span></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notification">
                  <li>
                    <a href="#0">
                      <div class="image">
                        <img src="../assets/images/lead/lead-6.png" alt="" />
                      </div>
                      <div class="content">
                        <h6>
                          John Doe
                          <span class="text-regular">
                            comment on a product.
                          </span>
                        </h6>
                        <p>
                          Lorem ipsum dolor sit amet, consect etur adipiscing
                          elit Vivamus tortor.
                        </p>
                        <span>10 mins ago</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#0">
                      <div class="image">
                        <img src="../assets/images/lead/lead-1.png" alt="" />
                      </div>
                      <div class="content">
                        <h6>
                          Jonathon
                          <span class="text-regular">
                            like on a product.
                          </span>
                        </h6>
                        <p>
                          Lorem ipsum dolor sit amet, consect etur adipiscing
                          elit Vivamus tortor.
                        </p>
                        <span>10 mins ago</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
              <!-- notification end -->
              <!-- message start -->
              <div class="header-message-box ml-15 d-none d-md-flex">
                <button class="dropdown-toggle" type="button" id="message" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M7.74866 5.97421C7.91444 5.96367 8.08162 5.95833 8.25005 5.95833C12.5532 5.95833 16.0417 9.4468 16.0417 13.75C16.0417 13.9184 16.0364 14.0856 16.0259 14.2514C16.3246 14.138 16.6127 14.003 16.8883 13.8482L19.2306 14.629C19.7858 14.8141 20.3141 14.2858 20.129 13.7306L19.3482 11.3882C19.8694 10.4604 20.1667 9.38996 20.1667 8.25C20.1667 4.70617 17.2939 1.83333 13.75 1.83333C11.0077 1.83333 8.66702 3.55376 7.74866 5.97421Z"
                      fill="" />
                    <path
                      d="M14.6667 13.75C14.6667 17.2938 11.7939 20.1667 8.25004 20.1667C7.11011 20.1667 6.03962 19.8694 5.11182 19.3482L2.76946 20.129C2.21421 20.3141 1.68597 19.7858 1.87105 19.2306L2.65184 16.8882C2.13062 15.9604 1.83338 14.89 1.83338 13.75C1.83338 10.2062 4.70622 7.33333 8.25004 7.33333C11.7939 7.33333 14.6667 10.2062 14.6667 13.75ZM5.95838 13.75C5.95838 13.2437 5.54797 12.8333 5.04171 12.8333C4.53545 12.8333 4.12504 13.2437 4.12504 13.75C4.12504 14.2563 4.53545 14.6667 5.04171 14.6667C5.54797 14.6667 5.95838 14.2563 5.95838 13.75ZM9.16671 13.75C9.16671 13.2437 8.7563 12.8333 8.25004 12.8333C7.74379 12.8333 7.33338 13.2437 7.33338 13.75C7.33338 14.2563 7.74379 14.6667 8.25004 14.6667C8.7563 14.6667 9.16671 14.2563 9.16671 13.75ZM11.4584 14.6667C11.9647 14.6667 12.375 14.2563 12.375 13.75C12.375 13.2437 11.9647 12.8333 11.4584 12.8333C10.9521 12.8333 10.5417 13.2437 10.5417 13.75C10.5417 14.2563 10.9521 14.6667 11.4584 14.6667Z"
                      fill="" />
                  </svg>
                  <span></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="message">
                  <li>
                    <a href="#0">
                      <div class="image">
                        <img src="../assets/images/lead/lead-5.png" alt="" />
                      </div>
                      <div class="content">
                        <h6>Jacob Jones</h6>
                        <p>Hey!I can across your profile and ...</p>
                        <span>10 mins ago</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#0">
                      <div class="image">
                        <img src="../assets/images/lead/lead-3.png" alt="" />
                      </div>
                      <div class="content">
                        <h6>John Doe</h6>
                        <p>Would you mind please checking out</p>
                        <span>12 mins ago</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#0">
                      <div class="image">
                        <img src="../assets/images/lead/lead-2.png" alt="" />
                      </div>
                      <div class="content">
                        <h6>Anee Lee</h6>
                        <p>Hey! are you available for freelance?</p>
                        <span>1h ago</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
              <!-- message end -->
              <!-- profile start -->
              <div class="profile-box ml-15">
                <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <div class="profile-info">
                    <div class="info">
                      <div class="image">
                        <img src="../assets/images/profile/profile-image.png" alt="" />
                      </div>
                      <div>
                        <h6 class="fw-500">Adam Joe</h6>
                        <p>Admin</p>
                      </div>
                    </div>
                  </div>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                  <li>
                    <div class="author-info flex items-center !p-1">
                      <div class="image">
                        <img src="../assets/images/profile/profile-image.png" alt="image">
                      </div>
                      <div class="content">
                        <h4 class="text-sm">Stevens</h4>
                        <a class="text-black/40 dark:text-white/40 hover:text-black dark:hover:text-white text-xs"
                          href="#">Email@gmail.com</a>
                      </div>
                    </div>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#0">
                      <i class="lni lni-profile"></i> View Profile
                    </a>
                  </li>
                  <li>
                    <a href="#0">
                      <i class="lni lni-alarm"></i> Notifications
                    </a>
                  </li>
                  <li>
                    <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
                  </li>
                  <li>
                    <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#0"> <i class="lni lni-exit"></i> Sign Out </a>
                  </li>
                </ul>
              </div>
              <!-- profile end -->
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- ========== header end ========== -->

    <!-- ========== section start ========== -->
    <section class="section">
      <div class="container-fluid">
        <!-- ========== title-wrapper start ========== -->
        <div class="title-wrapper pt-30">
          <div class="row align-items-center">
            <div class="col-md-6">
              <div class="title">
                <h2>Dashboard Overview</h2>
              </div>
            </div>
            <!-- end col -->
            <div class="col-md-6">
            </div>
            <!-- end col -->
          </div>
          <!-- end row -->
        </div>
        <!-- ========== title-wrapper end ========== -->
        <div class="row">
          <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="icon-card mb-30">
              <div class="icon purple">
                <i class="lni lni-cart-full"></i>
              </div>
              <div class="content">
                <h6 class="mb-10">New Orders</h6>
                <h3 class="text-bold mb-10">34567</h3>
                <p class="text-sm text-success">
                  <i class="lni lni-arrow-up"></i> +2.00%
                  <span class="text-gray">(30 days)</span>
                </p>
              </div>
            </div>
            <!-- End Icon Cart -->
          </div>
          <!-- End Col -->
          <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="icon-card mb-30">
              <div class="icon success">
                <i class="lni lni-dollar"></i>
              </div>
              <div class="content">
                <h6 class="mb-10">Total Income</h6>
                <h3 class="text-bold mb-10">$74,567</h3>
                <p class="text-sm text-success">
                  <i class="lni lni-arrow-up"></i> +5.45%
                  <span class="text-gray">Increased</span>
                </p>
              </div>
            </div>
            <!-- End Icon Cart -->
          </div>
          <!-- End Col -->
          <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="icon-card mb-30">
              <div class="icon primary">
                <i class="lni lni-credit-cards"></i>
              </div>
              <div class="content">
                <h6 class="mb-10">Total Expense</h6>
                <h3 class="text-bold mb-10">$24,567</h3>
                <p class="text-sm text-danger">
                  <i class="lni lni-arrow-down"></i> -2.00%
                  <span class="text-gray">Expense</span>
                </p>
              </div>
            </div>
            <!-- End Icon Cart -->
          </div>
          <!-- End Col -->
          <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="icon-card mb-30">
              <div class="icon orange">
                <i class="lni lni-profile"></i>
              </div>
              <div class="content">
                <h6 class="mb-10">New User</h6>
                <h3 class="text-bold mb-10">34567</h3>
                <p class="text-sm text-danger">
                  <i class="lni lni-arrow-down"></i> -25.00%
                  <span class="text-gray"> Earning</span>
                </p>
              </div>
            </div>
            <!-- End Icon Cart -->
          </div>
          <!-- End Col -->
        </div>
        <!-- End Row -->
        <div class="row">
          <div class="col-lg-7">
            <div class="card-style mb-30">
              <div class="title d-flex flex-wrap justify-content-between">
                <div class="left">
                  <h6 class="text-medium mb-10">Yearly Stats</h6>
                  <h3 class="text-bold">$245,479</h3>
                </div>
                <div class="right">
                  <div class="select-style-1">
                    <div class="select-position select-sm">
                      <select class="light-bg">
                        <option value="">Yearly</option>
                        <option value="">Monthly</option>
                        <option value="">Weekly</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
              </div>
              <!-- End Title -->
              <div class="chart">
                <canvas id="Chart1" style="width: 100%; height: 400px; margin-left: -35px;"></canvas>
              </div>
              <!-- End Chart -->
            </div>
          </div>
          <!-- End Col -->
          <div class="col-lg-5">
            <div class="card-style mb-30">
              <div class="title d-flex flex-wrap align-items-center justify-content-between">
                <div class="left">
                  <h6 class="text-medium mb-30">Sales/Revenue</h6>
                </div>
                <div class="right">
                  <div class="select-style-1">
                    <div class="select-position select-sm">
                      <select class="light-bg">
                        <option value="">Yearly</option>
                        <option value="">Monthly</option>
                        <option value="">Weekly</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
              </div>
              <!-- End Title -->
              <div class="chart">
                <canvas id="Chart2" style="width: 100%; height: 400px; margin-left: -45px;"></canvas>
              </div>
              <!-- End Chart -->
            </div>
          </div>
          <!-- End Col -->
        </div>
        <!-- End Row -->
        <div class="row">
          <div class="col-lg-5">
            <div class="card-style mb-30">
              <div class="title d-flex justify-content-between align-items-center">
                <div class="left">
                  <h6 class="text-medium mb-30">Sells by State</h6>
                </div>
              </div>
              <!-- End Title -->
              <div id="map" style="width: 100%; height: 400px; overflow: hidden;"></div>
              <p>Last updated: 7 days ago</p>
            </div>
          </div>
          <!-- End Col -->
          <div class="col-lg-7">
            <div class="card-style mb-30">
              <div class="title d-flex flex-wrap justify-content-between align-items-center">
                <div class="left">
                  <h6 class="text-medium mb-30">Top Selling Products</h6>
                </div>
                <div class="right">
                  <div class="select-style-1">
                    <div class="select-position select-sm">
                      <select class="light-bg">
                        <option value="">Yearly</option>
                        <option value="">Monthly</option>
                        <option value="">Weekly</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
              </div>
              <!-- End Title -->
              <div class="table-responsive">
                <table class="table top-selling-table">
                  <thead>
                    <tr>
                      <th></th>
                      <th>
                        <h6 class="text-sm text-medium">Products</h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">Category</h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">Price</h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">Sold</h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">Profit</h6>
                      </th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="check-input-primary">
                          <input class="form-check-input" type="checkbox" id="checkbox-1" />
                        </div>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-1.jpg" alt="" />
                          </div>
                          <p class="text-sm">Arm Chair</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
                      </td>
                      <td>
                        <p class="text-sm">43</p>
                      </td>
                      <td>
                        <p class="text-sm">$45</p>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="check-input-primary">
                          <input class="form-check-input" type="checkbox" id="checkbox-1" />
                        </div>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-2.jpg" alt="" />
                          </div>
                          <p class="text-sm">SOfa</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$145</p>
                      </td>
                      <td>
                        <p class="text-sm">13</p>
                      </td>
                      <td>
                        <p class="text-sm">$15</p>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="check-input-primary">
                          <input class="form-check-input" type="checkbox" id="checkbox-1" />
                        </div>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-3.jpg" alt="" />
                          </div>
                          <p class="text-sm">Dining Table</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$95</p>
                      </td>
                      <td>
                        <p class="text-sm">32</p>
                      </td>
                      <td>
                        <p class="text-sm">$215</p>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="check-input-primary">
                          <input class="form-check-input" type="checkbox" id="checkbox-1" />
                        </div>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-4.jpg" alt="" />
                          </div>
                          <p class="text-sm">Office Chair</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$105</p>
                      </td>
                      <td>
                        <p class="text-sm">23</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <!-- End Table -->
              </div>
            </div>
          </div>
          <!-- End Col -->
        </div>
        <!-- End Row -->
        <div class="row">
          <div class="col-lg-7">
            <div class="card-style mb-30">
              <div class="title d-flex flex-wrap align-items-center justify-content-between">
                <div class="left">
                  <h6 class="text-medium mb-2">Sales Forecast</h6>
                </div>
                <div class="right">
                  <div class="select-style-1 mb-2">
                    <div class="select-position select-sm">
                      <select class="light-bg">
                        <option value="">Last Month</option>
                        <option value="">Last 3 Months</option>
                        <option value="">Last Year</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
              </div>
              <!-- End Title -->
              <div class="chart">
                <div id="legend3">
                  <ul class="legend3 d-flex flex-wrap align-items-center mb-30">
                    <li>
                      <div class="d-flex">
                        <span class="bg-color primary-bg"> </span>
                        <div class="text">
                          <p class="text-sm text-success">
                            <span class="text-dark">Revenue</span> +25.55%
                            <i class="lni lni-arrow-up"></i>
                          </p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="d-flex">
                        <span class="bg-color purple-bg"></span>
                        <div class="text">
                          <p class="text-sm text-success">
                            <span class="text-dark">Net Profit</span> +45.55%
                            <i class="lni lni-arrow-up"></i>
                          </p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="d-flex">
                        <span class="bg-color orange-bg"></span>
                        <div class="text">
                          <p class="text-sm text-danger">
                            <span class="text-dark">Order</span> -4.2%
                            <i class="lni lni-arrow-down"></i>
                          </p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
                <canvas id="Chart3" style="width: 100%; height: 450px; margin-left: -35px;"></canvas>
              </div>
            </div>
          </div>
          <!-- End Col -->
          <div class="col-lg-5">
            <div class="card-style mb-30">
              <div class="title d-flex flex-wrap align-items-center justify-content-between">
                <div class="left">
                  <h6 class="text-medium mb-2">Traffic</h6>
                </div>
                <div class="right">
                  <div class="select-style-1 mb-2">
                    <div class="select-position select-sm">
                      <select class="bg-ligh">
                        <option value="">Last 6 Months</option>
                        <option value="">Last 3 Months</option>
                        <option value="">Last Year</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
              </div>
              <!-- End Title -->
              <div class="chart">
                <div id="legend4">
                  <ul class="legend3 d-flex flex-wrap gap-3 gap-sm-0 align-items-center mb-30">
                    <li>
                      <div class="d-flex">
                        <span class="bg-color primary-bg"> </span>
                        <div class="text">
                          <p class="text-sm text-success">
                            <span class="text-dark">Store Visits</span>
                            +25.55%
                            <i class="lni lni-arrow-up"></i>
                          </p>
                          <h2>3456</h2>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="d-flex">
                        <span class="bg-color danger-bg"></span>
                        <div class="text">
                          <p class="text-sm text-danger">
                            <span class="text-dark">Visitors</span> -2.05%
                            <i class="lni lni-arrow-down"></i>
                          </p>
                          <h2>3456</h2>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
                <canvas id="Chart4" style="width: 100%; height: 420px; margin-left: -35px;"></canvas>
              </div>
              <!-- End Chart -->
            </div>
          </div>
          <!-- End Col -->
        </div>
        <!-- End Row -->
        <div class="row">
          <div class="col-lg-5">
            <div class="card-style calendar-card mb-30">
              <div id="calendar-mini"></div>
            </div>
          </div>
          <!-- End Col -->
          <div class="col-lg-7">
            <div class="card-style mb-30">
              <div class="title d-flex flex-wrap align-items-center justify-content-between">
                <div class="left">
                  <h6 class="text-medium mb-30">Sales History</h6>
                </div>
                <div class="right">
                  <div class="select-style-1">
                    <div class="select-position select-sm">
                      <select class="light-bg">
                        <option value="">Today</option>
                        <option value="">Yesterday</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
              </div>
              <!-- End Title -->
              <div class="table-responsive">
                <table class="table top-selling-table">
                  <thead>
                    <tr>
                      <th>
                        <h6 class="text-sm text-medium">Products</h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">
                          Category <i class="lni lni-arrows-vertical"></i>
                        </h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">
                          Revenue <i class="lni lni-arrows-vertical"></i>
                        </h6>
                      </th>
                      <th class="min-width">
                        <h6 class="text-sm text-medium">
                          Status <i class="lni lni-arrows-vertical"></i>
                        </h6>
                      </th>
                      <th>
                        <h6 class="text-sm text-medium text-end">
                          Actions <i class="lni lni-arrows-vertical"></i>
                        </h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-1.jpg" alt="" />
                          </div>
                          <p class="text-sm">Bedroom</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
                      </td>
                      <td>
                        <span class="status-btn close-btn">Pending</span>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="edit">
                            <i class="lni lni-pencil"></i>
                          </button>
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-2.jpg" alt="" />
                          </div>
                          <p class="text-sm">Arm Chair</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
                      </td>
                      <td>
                        <span class="status-btn warning-btn">Refund</span>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="edit">
                            <i class="lni lni-pencil"></i>
                          </button>
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-3.jpg" alt="" />
                          </div>
                          <p class="text-sm">Sofa</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
                      </td>
                      <td>
                        <span class="status-btn success-btn">Completed</span>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="edit">
                            <i class="lni lni-pencil"></i>
                          </button>
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="../assets/images/products/product-mini-4.jpg" alt="" />
                          </div>
                          <p class="text-sm">Kitchen</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
                      </td>
                      <td>
                        <div class="action justify-content-end">
                          <button class="edit">
                            <i class="lni lni-pencil"></i>
                          </button>
                          <button class="more-btn ml-10 dropdown-toggle" id="moreAction1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="lni lni-more-alt"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction1">
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Remove</a>
                            </li>
                            <li class="dropdown-item">
                              <a href="#0" class="text-gray">Edit</a>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <!-- End Table -->
              </div>
            </div>
          </div>
          <!-- End Col -->
        </div>
        <!-- End Row -->
      </div>
      <!-- end container -->
    </section>
    <!-- ========== section end ========== -->

    <!-- ========== footer start =========== -->
    <footer class="footer">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6 order-last order-md-first">
            <div class="copyright text-center text-md-start">
              <p class="text-sm">
                Designed and Developed by
                <a href="https://plainadmin.com" rel="nofollow" target="_blank">
                  PlainAdmin
                </a>
              </p>
            </div>
          </div>
          <!-- end col-->
          <div class="col-md-6">
            <div class="terms d-flex justify-content-center justify-content-md-end">
              <a href="#0" class="text-sm">Term & Conditions</a>
              <a href="#0" class="text-sm ml-15">Privacy & Policy</a>
            </div>
          </div>
        </div>
        <!-- end row -->
      </div>
      <!-- end container -->
    </footer>
    <!-- ========== footer end =========== -->
  </main>
  <!-- ======== main-wrapper end =========== -->

  <!-- ========= All Javascript files linkup ======== -->
  <script src="../assets/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/js/Chart.min.js"></script>
  <script src="../assets/js/dynamic-pie-chart.js"></script>
  <script src="../assets/js/moment.min.js"></script>
  <script src="../assets/js/fullcalendar.js"></script>
  <script src="../assets/js/jvectormap.min.js"></script>
  <script src="../assets/js/world-merc.js"></script>
  <script src="../assets/js/polyfill.js"></script>
  <script src="../assets/js/main.js"></script>

  <script>
    // ======== jvectormap activation
    var markers = [
      { name: "Egypt", coords: [26.8206, 30.8025] },
      { name: "Russia", coords: [61.524, 105.3188] },
      { name: "Canada", coords: [56.1304, -106.3468] },
      { name: "Greenland", coords: [71.7069, -42.6043] },
      { name: "Brazil", coords: [-14.235, -51.9253] },
    ];

    var jvm = new jsVectorMap({
      map: "world_merc",
      selector: "#map",
      zoomButtons: true,

      regionStyle: {
        initial: {
          fill: "#d1d5db",
        },
      },

      labels: {
        markers: {
          render: (marker) => marker.name,
        },
      },

      markersSelectable: true,
      selectedMarkers: markers.map((marker, index) => {
        var name = marker.name;

        if (name === "Russia" || name === "Brazil") {
          return index;
        }
      }),
      markers: markers,
      markerStyle: {
        initial: { fill: "#4A6CF7" },
        selected: { fill: "#ff5050" },
      },
      markerLabelStyle: {
        initial: {
          fontWeight: 400,
          fontSize: 14,
        },
      },
    });
    // ====== calendar activation
    document.addEventListener("DOMContentLoaded", function () {
      var calendarMiniEl = document.getElementById("calendar-mini");
      var calendarMini = new FullCalendar.Calendar(calendarMiniEl, {
        initialView: "dayGridMonth",
        headerToolbar: {
          end: "today prev,next",
        },
      });
      calendarMini.render();
    });

    // =========== chart one start
    const ctx1 = document.getElementById("Chart1").getContext("2d");
    const chart1 = new Chart(ctx1, {
      type: "line",
      data: {
        labels: [
          "Jan",
          "Fab",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec",
        ],
        datasets: [
          {
            label: "",
            backgroundColor: "transparent",
            borderColor: "#365CF5",
            data: [
              600, 800, 750, 880, 940, 880, 900, 770, 920, 890, 976, 1100,
            ],
            pointBackgroundColor: "transparent",
            pointHoverBackgroundColor: "#365CF5",
            pointBorderColor: "transparent",
            pointHoverBorderColor: "#fff",
            pointHoverBorderWidth: 5,
            borderWidth: 5,
            pointRadius: 8,
            pointHoverRadius: 8,
            cubicInterpolationMode: "monotone", // Add this line for curved line
          },
        ],
      },
      options: {
        plugins: {
          tooltip: {
            callbacks: {
              labelColor: function (context) {
                return {
                  backgroundColor: "#ffffff",
                  color: "#171717"
                };
              },
            },
            intersect: false,
            backgroundColor: "#f9f9f9",
            title: {
              fontFamily: "Plus Jakarta Sans",
              color: "#8F92A1",
              fontSize: 12,
            },
            body: {
              fontFamily: "Plus Jakarta Sans",
              color: "#171717",
              fontStyle: "bold",
              fontSize: 16,
            },
            multiKeyBackground: "transparent",
            displayColors: false,
            padding: {
              x: 30,
              y: 10,
            },
            bodyAlign: "center",
            titleAlign: "center",
            titleColor: "#8F92A1",
            bodyColor: "#171717",
            bodyFont: {
              family: "Plus Jakarta Sans",
              size: "16",
              weight: "bold",
            },
          },
          legend: {
            display: false,
          },
        },
        responsive: true,
        maintainAspectRatio: false,
        title: {
          display: false,
        },
        scales: {
          y: {
            grid: {
              display: false,
              drawTicks: false,
              drawBorder: false,
            },
            ticks: {
              padding: 35,
              max: 1200,
              min: 500,
            },
          },
          x: {
            grid: {
              drawBorder: false,
              color: "rgba(143, 146, 161, .1)",
              zeroLineColor: "rgba(143, 146, 161, .1)",
            },
            ticks: {
              padding: 20,
            },
          },
        },
      },
    });
    // =========== chart one end

    // =========== chart two start
    const ctx2 = document.getElementById("Chart2").getContext("2d");
    const chart2 = new Chart(ctx2, {
      type: "bar",
      data: {
        labels: [
          "Jan",
          "Fab",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec",
        ],
        datasets: [
          {
            label: "",
            backgroundColor: "#365CF5",
            borderRadius: 30,
            barThickness: 6,
            maxBarThickness: 8,
            data: [
              600, 700, 1000, 700, 650, 800, 690, 740, 720, 1120, 876, 900,
            ],
          },
        ],
      },
      options: {
        plugins: {
          tooltip: {
            callbacks: {
              titleColor: function (context) {
                return "#8F92A1";
              },
              label: function (context) {
                let label = context.dataset.label || "";

                if (label) {
                  label += ": ";
                }
                label += context.parsed.y;
                return label;
              },
            },
            backgroundColor: "#F3F6F8",
            titleAlign: "center",
            bodyAlign: "center",
            titleFont: {
              size: 12,
              weight: "bold",
              color: "#8F92A1",
            },
            bodyFont: {
              size: 16,
              weight: "bold",
              color: "#171717",
            },
            displayColors: false,
            padding: {
              x: 30,
              y: 10,
            },
          },
        },
        legend: {
          display: false,
        },
        legend: {
          display: false,
        },
        layout: {
          padding: {
            top: 15,
            right: 15,
            bottom: 15,
            left: 15,
          },
        },
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            grid: {
              display: false,
              drawTicks: false,
              drawBorder: false,
            },
            ticks: {
              padding: 35,
              max: 1200,
              min: 0,
            },
          },
          x: {
            grid: {
              display: false,
              drawBorder: false,
              color: "rgba(143, 146, 161, .1)",
              drawTicks: false,
              zeroLineColor: "rgba(143, 146, 161, .1)",
            },
            ticks: {
              padding: 20,
            },
          },
        },
        plugins: {
          legend: {
            display: false,
          },
          title: {
            display: false,
          },
        },
      },
    });
    // =========== chart two end

    // =========== chart three start
    const ctx3 = document.getElementById("Chart3").getContext("2d");
    const chart3 = new Chart(ctx3, {
      type: "line",
      data: {
        labels: [
          "Jan",
          "Feb",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec",
        ],
        datasets: [
          {
            label: "Revenue",
            backgroundColor: "transparent",
            borderColor: "#365CF5",
            data: [80, 120, 110, 100, 130, 150, 115, 145, 140, 130, 160, 210],
            pointBackgroundColor: "transparent",
            pointHoverBackgroundColor: "#365CF5",
            pointBorderColor: "transparent",
            pointHoverBorderColor: "#365CF5",
            pointHoverBorderWidth: 3,
            pointBorderWidth: 5,
            pointRadius: 5,
            pointHoverRadius: 8,
            fill: false,
            tension: 0.4,
          },
          {
            label: "Profit",
            backgroundColor: "transparent",
            borderColor: "#9b51e0",
            data: [
              120, 160, 150, 140, 165, 210, 135, 155, 170, 140, 130, 200,
            ],
            pointBackgroundColor: "transparent",
            pointHoverBackgroundColor: "#9b51e0",
            pointBorderColor: "transparent",
            pointHoverBorderColor: "#9b51e0",
            pointHoverBorderWidth: 3,
            pointBorderWidth: 5,
            pointRadius: 5,
            pointHoverRadius: 8,
            fill: false,
            tension: 0.4,
          },
          {
            label: "Order",
            backgroundColor: "transparent",
            borderColor: "#f2994a",
            data: [180, 110, 140, 135, 100, 90, 145, 115, 100, 110, 115, 150],
            pointBackgroundColor: "transparent",
            pointHoverBackgroundColor: "#f2994a",
            pointBorderColor: "transparent",
            pointHoverBorderColor: "#f2994a",
            pointHoverBorderWidth: 3,
            pointBorderWidth: 5,
            pointRadius: 5,
            pointHoverRadius: 8,
            fill: false,
            tension: 0.4,
          },
        ],
      },
      options: {
        plugins: {
          tooltip: {
            intersect: false,
            backgroundColor: "#fbfbfb",
            titleColor: "#8F92A1",
            bodyColor: "#272727",
            titleFont: {
              size: 16,
              family: "Plus Jakarta Sans",
              weight: "400",
            },
            bodyFont: {
              family: "Plus Jakarta Sans",
              size: 16,
            },
            multiKeyBackground: "transparent",
            displayColors: false,
            padding: {
              x: 30,
              y: 15,
            },
            borderColor: "rgba(143, 146, 161, .1)",
            borderWidth: 1,
            enabled: true,
          },
          title: {
            display: false,
          },
          legend: {
            display: false,
          },
        },
        layout: {
          padding: {
            top: 0,
          },
        },
        responsive: true,
        // maintainAspectRatio: false,
        legend: {
          display: false,
        },
        scales: {
          y: {
            grid: {
              display: false,
              drawTicks: false,
              drawBorder: false,
            },
            ticks: {
              padding: 35,
            },
            max: 350,
            min: 50,
          },
          x: {
            grid: {
              drawBorder: false,
              color: "rgba(143, 146, 161, .1)",
              drawTicks: false,
              zeroLineColor: "rgba(143, 146, 161, .1)",
            },
            ticks: {
              padding: 20,
            },
          },
        },
      },
    });
    // =========== chart three end

    // ================== chart four start
    const ctx4 = document.getElementById("Chart4").getContext("2d");
    const chart4 = new Chart(ctx4, {
      type: "bar",
      data: {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
        datasets: [
          {
            label: "",
            backgroundColor: "#365CF5",
            borderColor: "transparent",
            borderRadius: 20,
            borderWidth: 5,
            barThickness: 20,
            maxBarThickness: 20,
            data: [600, 700, 1000, 700, 650, 800],
          },
          {
            label: "",
            backgroundColor: "#d50100",
            borderColor: "transparent",
            borderRadius: 20,
            borderWidth: 5,
            barThickness: 20,
            maxBarThickness: 20,
            data: [690, 740, 720, 1120, 876, 900],
          },
        ],
      },
      options: {
        plugins: {
          tooltip: {
            backgroundColor: "#F3F6F8",
            titleColor: "#8F92A1",
            titleFontSize: 12,
            bodyColor: "#171717",
            bodyFont: {
              weight: "bold",
              size: 16,
            },
            multiKeyBackground: "transparent",
            displayColors: false,
            padding: {
              x: 30,
              y: 10,
            },
            bodyAlign: "center",
            titleAlign: "center",
            enabled: true,
          },
          legend: {
            display: false,
          },
        },
        layout: {
          padding: {
            top: 0,
          },
        },
        responsive: true,
        // maintainAspectRatio: false,
        title: {
          display: false,
        },
        scales: {
          y: {
            grid: {
              display: false,
              drawTicks: false,
              drawBorder: false,
            },
            ticks: {
              padding: 35,
              max: 1200,
              min: 0,
            },
          },
          x: {
            grid: {
              display: false,
              drawBorder: false,
              color: "rgba(143, 146, 161, .1)",
              zeroLineColor: "rgba(143, 146, 161, .1)",
            },
            ticks: {
              padding: 20,
            },
          },
        },
      },
    });
        // =========== chart four end
  </script>
</body>

</html>