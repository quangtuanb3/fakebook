<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="./assets/images/favicon.svg" type="image/x-icon"/>
    <title>PlainAdmin Demo | Bootstrap 5 Admin Template</title>

    <!-- ========== All CSS files linkup ========= -->
    <link href="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https:/cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https:/cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./assets/css/lineicons.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="./assets/css/materialdesignicons.min.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" href="./assets/css/fullcalendar.css"/>
    <link rel="stylesheet" href="./assets/css/fullcalendar.css"/>
    <link rel="stylesheet" href="./assets/css/main.css"/>
</head>

<body>
<!-- ======== Preloader =========== -->
<%--<div id="preloader">--%>
<%--    <div class="spinner"></div>--%>
<%--</div>--%>
<!-- ======== Preloader =========== -->

<!-- ======== sidebar-nav start =========== -->
<aside class="sidebar-nav-wrapper">
    <div class="navbar-logo">
        <a href="index.jsp">
            <img src="./assets/images/logo/logo.svg" alt="logo"/>
        </a>
    </div>

    <nav class="sidebar-nav">

        <ul>
            <li class="nav-item nav-item-has-children">
                <div style="text-align: left; margin-left: 10px;">
            <span class="icon" style="padding: 10px; font-size: 17px;">
              <i class="fa fa-palette"></i>
            </span>
                    <span class="text" style="line-height: 10px;">DASHBOARD</span>
                </div>
            </li>

            <li class="nav-item nav-item-has-children slidebar-active">
                <div style="text-align: left; margin-left: 10px;">
            <span class="icon" style="padding: 10px; font-size: 17px;">
              <i class="fa fa-user"></i>
            </span>
                    <span class="text" style="line-height: 10px;">USER</span>
                </div>
            </li>

            <li class="nav-item nav-item-has-children">
                <div style="text-align: left; margin-left: 10px;">
            <span class="icon" style="padding: 10px; font-size: 17px;">
              <i class="fa fa-paste"></i>
            </span>
                    <span class="text" style="line-height: 10px;">POST</span>
                </div>
            </li>

            <li class="nav-item nav-item-has-children">
                <div style="text-align: left; margin-left: 10px;">
            <span class="icon" style="padding: 10px; font-size: 17px;">
              <i class="fa fa-pager"></i>
            </span>
                    <span class="text" style="line-height: 10px;">PAGE</span>
                </div>
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
                                <i class="fa fa-bars"></i>  Menu
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7 col-6">
                    <div class="header-right">
                        <!-- notification start -->
                        <div class="notification-box ml-15 d-none d-md-flex">
                            <button class="dropdown-toggle" type="button" id="notification" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                     xmlns="http:/www.w3.org/2000/svg">
                                    <path
                                            d="M11 20.1667C9.88317 20.1667 8.88718 19.63 8.23901 18.7917H13.761C13.113 19.63 12.1169 20.1667 11 20.1667Z"
                                            fill=""/>
                                    <path
                                            d="M10.1157 2.74999C10.1157 2.24374 10.5117 1.83333 11 1.83333C11.4883 1.83333 11.8842 2.24374 11.8842 2.74999V2.82604C14.3932 3.26245 16.3051 5.52474 16.3051 8.24999V14.287C16.3051 14.5301 16.3982 14.7633 16.564 14.9352L18.2029 16.6342C18.4814 16.9229 18.2842 17.4167 17.8903 17.4167H4.10961C3.71574 17.4167 3.5185 16.9229 3.797 16.6342L5.43589 14.9352C5.6017 14.7633 5.69485 14.5301 5.69485 14.287V8.24999C5.69485 5.52474 7.60672 3.26245 10.1157 2.82604V2.74999Z"
                                            fill=""/>
                                </svg>
                                <span></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notification">
                                <li>
                                    <a href="#0">
                                        <div class="image">
                                            <img src="./assets/images/lead/lead-6.png" alt=""/>
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
                                            <img src="./assets/images/lead/lead-1.png" alt=""/>
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
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                     xmlns="http:/www.w3.org/2000/svg">
                                    <path
                                            d="M7.74866 5.97421C7.91444 5.96367 8.08162 5.95833 8.25005 5.95833C12.5532 5.95833 16.0417 9.4468 16.0417 13.75C16.0417 13.9184 16.0364 14.0856 16.0259 14.2514C16.3246 14.138 16.6127 14.003 16.8883 13.8482L19.2306 14.629C19.7858 14.8141 20.3141 14.2858 20.129 13.7306L19.3482 11.3882C19.8694 10.4604 20.1667 9.38996 20.1667 8.25C20.1667 4.70617 17.2939 1.83333 13.75 1.83333C11.0077 1.83333 8.66702 3.55376 7.74866 5.97421Z"
                                            fill=""/>
                                    <path
                                            d="M14.6667 13.75C14.6667 17.2938 11.7939 20.1667 8.25004 20.1667C7.11011 20.1667 6.03962 19.8694 5.11182 19.3482L2.76946 20.129C2.21421 20.3141 1.68597 19.7858 1.87105 19.2306L2.65184 16.8882C2.13062 15.9604 1.83338 14.89 1.83338 13.75C1.83338 10.2062 4.70622 7.33333 8.25004 7.33333C11.7939 7.33333 14.6667 10.2062 14.6667 13.75ZM5.95838 13.75C5.95838 13.2437 5.54797 12.8333 5.04171 12.8333C4.53545 12.8333 4.12504 13.2437 4.12504 13.75C4.12504 14.2563 4.53545 14.6667 5.04171 14.6667C5.54797 14.6667 5.95838 14.2563 5.95838 13.75ZM9.16671 13.75C9.16671 13.2437 8.7563 12.8333 8.25004 12.8333C7.74379 12.8333 7.33338 13.2437 7.33338 13.75C7.33338 14.2563 7.74379 14.6667 8.25004 14.6667C8.7563 14.6667 9.16671 14.2563 9.16671 13.75ZM11.4584 14.6667C11.9647 14.6667 12.375 14.2563 12.375 13.75C12.375 13.2437 11.9647 12.8333 11.4584 12.8333C10.9521 12.8333 10.5417 13.2437 10.5417 13.75C10.5417 14.2563 10.9521 14.6667 11.4584 14.6667Z"
                                            fill=""/>
                                </svg>
                                <span></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="message">
                                <li>
                                    <a href="#0">
                                        <div class="image">
                                            <img src="./assets/images/lead/lead-5.png" alt=""/>
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
                                            <img src="./assets/images/lead/lead-3.png" alt=""/>
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
                                            <img src="./assets/images/lead/lead-2.png" alt=""/>
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
                                            <img src="./assets/images/profile/profile-image.png" alt=""/>
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
                                            <img src="./assets/images/profile/profile-image.png"
                                                 alt="image">
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
                                        <i class="lni lni-user"></i> View Profile
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
    <!-- ========== FROM INPUT ========== -->
    <form method="post" id="form" accept-charset="UTF-8">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="formBody" class="row">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- ========== section start ========== -->
    <h1>Teacher</h1>
    <div class="row">
        <div class="col-2">
            <button onclick="onShowPopup()" type="button" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">
                Create
            </button>
            <%--        <a class="btn btn-primary" href="${pageContext.request.contextPath}/users?action=create"> Create</a>--%>
        </div>
        <div class="col-4">

        </div>
        <div class="col-6" style="display: flex">
            <form action="/admins/users-management" class="row" id="search-input">
                <div class="col-8">
                    <input type="search" name="search" value="${pageable.search}" class="form-control">
                </div>
                <div class="col-2">
                    <select id="limit" name="limit" class="form-control" onchange="changeLimit(this.value)">
                        <c:if test="${pageable.limit == 5 }">
                            <option value="5" selected>5</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                        </c:if>
                        <c:if test="${pageable.limit == 10 }">
                            <option value="5">5</option>
                            <option value="10" selected>10</option>
                            <option value="20">20</option>
                        </c:if>
                        <c:if test="${pageable.limit == 20 }">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="20" selected>20</option>
                        </c:if>


                    </select>
                </div>

                <div class="col-2">
                    <button class="btn btn-primary">
                        Search
                    </button>
                </div>
            </form>

        </div>
    </div>

    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>
                <a
                        <c:if test="${pageable.sortField == 'id' && pageable.sortType == 'DESC'}">
                            href="/admins/users-management?search=${pageable.search}&sortType=ASC&sortField=id&page=${pageable.page}"
                        </c:if>

                        <c:if test="${!(pageable.sortField == 'id' && pageable.sortType == 'DESC')}">
                            href="/admins/users-management?search=${pageable.search}&sortType=DESC&sortField=id&page=${pageable.page}"
                        </c:if>
                >
                    No.
                </a>
            </th>
            <th>
                <a
                        <c:if test="${pageable.sortField == 'name' && pageable.sortType == 'DESC'}">
                            href="/admins/users-management?search=${pageable.search}&sortType=ASC&sortField=name&page=${pageable.page}"
                        </c:if>

                        <c:if test="${!(pageable.sortField == 'name' && pageable.sortType == 'DESC')}">
                            href="/admins/users-management?search=${pageable.search}&sortType=DESC&sortField=name&page=${pageable.page}"
                        </c:if>
                >Name
                </a>
            </th>
            <th>
                Avatar
            </th>
            <th>
                Email
            </th>
            <th>
                Date of Birth
            </th>
            <th>
                Gender
            </th>
            <th>
                Phone
            </th>

            <th>
                Option
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${profiles}" var="profile" varStatus="loop">
            <tr>
                <td>
                        ${profile.id}
                </td>
                <td>
                        ${profile.name}
                </td>
                <td>
                        ${profile.avatar}
                </td>
                <td>
                        ${profile.user.email}
                </td>
                <td>
                        ${profile.dob}
                </td>
                <td>
                        ${profile.gender}
                </td>
                <td>
                        ${profile.phone}
                </td>
                <td>
                    <button onclick="onShowPopup(${profile.id})" type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#exampleModal"> Edit
                    </button>
                    <a class="btn btn-danger" href="/admins/users-management?action=delete&id=${profile.id}"
                       onclick="return confirm('Do you wanna delete this ${profile.name}')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <div class="d-flex justify-content-end">

        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item <c:if test="${pageable.page == 1}">disabled</c:if>">
                    <c:if test="${pageable.page > 1}">
                        <a class="page-link"
                           href="/admins/users-management?page=${pageable.page - 1}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}&limit=${pageable.limit}">Previous</a>
                    </c:if>
                </li>

                <c:choose>
                    <c:when test="${pageable.totalPage <= 5}">
                        <!-- Trang có ít hơn hoặc bằng 5 trang -->
                        <c:forEach begin="1" end="${pageable.totalPage}" var="num">
                            <li class="page-item <c:if test="${pageable.page == num}">active</c:if>">
                                <a class="page-link"
                                   href="/admins/users-management?page=${num}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}&limit=${pageable.limit}">${num}</a>
                            </li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- Trang có nhiều hơn 5 trang -->
                        <c:set var="startPage" value="${pageable.page - 2}"/>
                        <c:set var="endPage" value="${pageable.page + 2}"/>

                        <c:if test="${startPage lt 1}">
                            <c:set var="startPage" value="1"/>
                            <c:set var="endPage" value="5"/>
                        </c:if>

                        <c:if test="${endPage gt pageable.totalPage}">
                            <c:set var="endPage" value="${pageable.totalPage}"/>
                            <c:set var="startPage" value="${endPage - 4}"/>
                        </c:if>

                        <!-- Lấy điều kiện -->
                        <c:if test="${pageable.page gt pageable.totalPage - 2}">
                            <c:set var="startPage" value="${pageable.totalPage - 4}"/>
                            <c:set var="endPage" value="${pageable.totalPage}"/>
                        </c:if>
                        <c:if test="${pageable.page lt 3}">
                            <c:set var="startPage" value="1"/>
                            <c:set var="endPage" value="5"/>
                        </c:if>

                        <c:forEach begin="${startPage}" end="${endPage}" var="num">
                            <li class="page-item <c:if test="${pageable.page == num}">active</c:if>">
                                <a class="page-link"
                                   href="/admins/users-management?page=${num}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}&limit=${pageable.limit}">${num}</a>
                            </li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                <li class="page-item <c:if test="${pageable.page == pageable.totalPage}">disabled</c:if>">
                    <c:if test="${pageable.page < pageable.totalPage}">
                        <a class="page-link"
                           href="/admins/users-management?page=${pageable.page + 1}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}&limit=${pageable.limit}">Next</a>
                    </c:if>
                </li>
            </ul>
        </nav>
    </div>
    <!-- ========== section end ========== -->

    <!-- ========== footer start =========== -->

    <!-- ========== footer end =========== -->
</main>
<!-- ======== main-wrapper end =========== -->

<!-- ========= All Javascript files linkup ======== -->
<script src="../baseForm.js"></script>


<script src="https:/cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https:/cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https:/cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="./assets/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/Chart.min.js"></script>
<script src="./assets/js/dynamic-pie-chart.js"></script>
<script src="./assets/js/moment.min.js"></script>
<script src="./assets/js/fullcalendar.js"></script>
<script src="./assets/js/jvectormap.min.js"></script>
<script src="./assets/js/world-merc.js"></script>
<script src="./assets/js/polyfill.js"></script>
<script src="./assets/js/main.js"></script>

<script src="https:/cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="../base.js"></script>

<script src="https:/cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<script>
    const profiles = ${profilesJSON};
    const genders = ${gendersJSON};
    const users = ${usersJSON};
    let profile = {};

    let inputs = [];
    const message = document.getElementById('message');
    const btnToast = document.getElementById('liveToastBtn');
    const form = document.getElementById('form');
    const tileModal = document.getElementById("exampleModalLabel");
    window.onload = () => {
        if (message.innerHTML.trim() == 'Something was wrong') {
            toastr.error(message.innerHTML);
        }else if (message.innerHTML.trim() == 'Id not found') {
            toastr.error(message.innerHTML);
        }
        else if (message.innerHTML.trim() !== '') {
            toastr.success(message.innerHTML);
        }
    }

    function changeLimit(limit) {
        pageable.limit = parseInt(limit);
        document.getElementById('searchForm').submit();
    }

    function onShowPopup(id) {
        let action = "create";
        let title = "Create";
        if (id) {
            action = "edit";
            title = "Edit";
        }
        tileModal.innerHTML = title + " Profile";
        form.setAttribute('action', '/admins/users-management?action=' + action);
        profile = profiles.find(profile => profile.id === id) || {};
        resetData();
    }

    function resetData() {
        inputs = [
            {
                label: "Name",
                name: "name",
                pattern: "^[A-Za-z ]{6,20}",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: profile.name || ''
            },
            {
                label: "Phone",
                name: "phone",
                pattern: "^[0-9]{6,20}",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: profile.phone || ''
            },
            {
                label: "Avatar",
                name: "avatar",
                pattern: "^[A-Za-z ]{6,20}",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: profile.avatar || ''
            },
            {
                name: 'id',
                value: profile.id,
                type: 'hidden',
                classDiv: 'd-none'
            },
            {
                label: "DOB",
                name: "dob",
                type: "date",
                message: "Date from 1950-01-01 to 2000-01-01",
                require: true,
                min: '1950-01-01',
                max: '2000-01-01',
                value: profile.dob || '',
                classDiv: 'col-6'
            },
            {
                label: "Gender",
                name: "gender",
                type: "select",
                message: "Please choose gender",
                options: genders?.map(e => {
                    return {
                        name: e,
                        value: e
                    }
                }),
                require: true,
                value: profile.gender || '',
                classDiv: 'col-6'
            },
            {
                label: "Cover",
                name: "cover",
                pattern: "^[A-Za-z ]{6,20}",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: profile.cover || ''
            },
            {
                label: "Email",
                name: "email",
                message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
                require: true,
                classDiv: 'col-6',
                value: profile.user? || ''
            },
        ];
        const formBody = document.getElementById('formBody'); // DOM formBody theo id
        formBody.innerHTML = '';
        // loop qua inputs
        inputs.forEach((input, index) => {
            if (input.type === 'select') {
                formBody.innerHTML += formSelect(input, index);
            } else {
                // For avatar input, set the default value to the image path (props.value) if available
                const avatarValue = input.type === 'file' ? '' : input.value;
                formBody.innerHTML += formInput({ ...input, value: avatarValue }, index);
            }
        });

    }
</script>
<script>
    const onFocusImg = (index) => {
        const inputsForm = document.querySelectorAll('#formBody .input-custom');
        inputsForm[index].setAttribute('focused', 'true');
    };

    function onFileChange(event, index) {
        const fileInput = event.target;
        const previewImage = document.getElementById(`previewImage` + index);
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function () {
                previewImage.src = reader.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewImage.src = '';
        }
    }
</script>
<%--<script>--%>
<%--    /fetch data--%>
<%--    / Function to fetch user data using Axios--%>
<%--    function fetchUserData(userId) {--%>
<%--        console.log(userId)--%>
<%--        if (userId == null) {--%>
<%--            return;--%>
<%--        }--%>
<%--        / Make an AJAX request using Axios to fetch user data from the server--%>
<%--        axios.get('/users?action=get&id=' + userId)--%>
<%--            .then(response => {--%>
<%--                const userData = response.data;--%>
<%--                console.log(userData);--%>
<%--                populateForm(userData); / Call a function to populate the form with the fetched user data--%>
<%--            })--%>
<%--            .catch(error => {--%>
<%--                / console.error('Error fetching user data:', error);--%>
<%--                / Handle error--%>
<%--            });--%>
<%--    }--%>

<%--    / Function to populate the form with user data--%>
<%--    function populateForm(userData) {--%>
<%--        const formInputs = document.querySelectorAll('#userManagerForm input, #userManagerForm select');--%>
<%--        formInputs.forEach(input => {--%>
<%--            const fieldName = input.name;--%>

<%--            if (fieldName in userData) {--%>
<%--                input.value = userData[fieldName];--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    / Function to show the popup with user data when the Edit button is clicked--%>
<%--    function showPopupWithUserData(userId) {--%>
<%--        fetchUserData(userId); / Fetch user data--%>
<%--        document.getElementById('popupOverlay').style.display = 'block'; / Show the popup--%>
<%--    }--%>


<%--</script>--%>

<%--<script>--%>
<%--    / ======== jvectormap activation--%>
<%--    var markers = [--%>
<%--        {name: "Egypt", coords: [26.8206, 30.8025]},--%>
<%--        {name: "Russia", coords: [61.524, 105.3188]},--%>
<%--        {name: "Canada", coords: [56.1304, -106.3468]},--%>
<%--        {name: "Greenland", coords: [71.7069, -42.6043]},--%>
<%--        {name: "Brazil", coords: [-14.235, -51.9253]},--%>
<%--    ];--%>

<%--    var jvm = new jsVectorMap({--%>
<%--        map: "world_merc",--%>
<%--        selector: "#map",--%>
<%--        zoomButtons: true,--%>

<%--        regionStyle: {--%>
<%--            initial: {--%>
<%--                fill: "#d1d5db",--%>
<%--            },--%>
<%--        },--%>

<%--        labels: {--%>
<%--            markers: {--%>
<%--                render: (marker) => marker.name,--%>
<%--            },--%>
<%--        },--%>

<%--        markersSelectable: true,--%>
<%--        selectedMarkers: markers.map((marker, index) => {--%>
<%--            var name = marker.name;--%>

<%--            if (name === "Russia" || name === "Brazil") {--%>
<%--                return index;--%>
<%--            }--%>
<%--        }),--%>
<%--        markers: markers,--%>
<%--        markerStyle: {--%>
<%--            initial: {fill: "#4A6CF7"},--%>
<%--            selected: {fill: "#ff5050"},--%>
<%--        },--%>
<%--        markerLabelStyle: {--%>
<%--            initial: {--%>
<%--                fontWeight: 400,--%>
<%--                fontSize: 14,--%>
<%--            },--%>
<%--        },--%>
<%--    });--%>
<%--    / ====== calendar activation--%>
<%--    document.addEventListener("DOMContent" +--%>
<%--        "ed", function () {--%>
<%--        var calendarMiniEl = document.getElementById("calendar-mini");--%>
<%--        var calendarMini = new FullCalendar.Calendar(calendarMiniEl, {--%>
<%--            initialView: "dayGridMonth",--%>
<%--            headerToolbar: {--%>
<%--                end: "today prev,next",--%>
<%--            },--%>
<%--        });--%>
<%--        calendarMini.render();--%>
<%--    });--%>

<%--    / =========== chart one start--%>
<%--    /**--%>
<%--    const ctx1 = document.getElementById("Chart1").getContext("2d");--%>
<%--    const chart1 = new Chart(ctx1, {--%>
<%--        type: "line",--%>
<%--        data: {--%>
<%--            labels: [--%>
<%--                "Jan",--%>
<%--                "Fab",--%>
<%--                "Mar",--%>
<%--                "Apr",--%>
<%--                "May",--%>
<%--                "Jun",--%>
<%--                "Jul",--%>
<%--                "Aug",--%>
<%--                "Sep",--%>
<%--                "Oct",--%>
<%--                "Nov",--%>
<%--                "Dec",--%>
<%--            ],--%>
<%--            datasets: [--%>
<%--                {--%>
<%--                    label: "",--%>
<%--                    backgroundColor: "transparent",--%>
<%--                    borderColor: "#365CF5",--%>
<%--                    data: [--%>
<%--                        600, 800, 750, 880, 940, 880, 900, 770, 920, 890, 976, 1100,--%>
<%--                    ],--%>
<%--                    pointBackgroundColor: "transparent",--%>
<%--                    pointHoverBackgroundColor: "#365CF5",--%>
<%--                    pointBorderColor: "transparent",--%>
<%--                    pointHoverBorderColor: "#fff",--%>
<%--                    pointHoverBorderWidth: 5,--%>
<%--                    borderWidth: 5,--%>
<%--                    pointRadius: 8,--%>
<%--                    pointHoverRadius: 8,--%>
<%--                    cubicInterpolationMode: "monotone", / Add this line for curved line--%>
<%--                },--%>
<%--            ],--%>
<%--        },--%>
<%--        options: {--%>
<%--            plugins: {--%>
<%--                tooltip: {--%>
<%--                    callbacks: {--%>
<%--                        labelColor: function (context) {--%>
<%--                            return {--%>
<%--                                backgroundColor: "#ffffff",--%>
<%--                                color: "#171717"--%>
<%--                            };--%>
<%--                        },--%>
<%--                    },--%>
<%--                    intersect: false,--%>
<%--                    backgroundColor: "#f9f9f9",--%>
<%--                    title: {--%>
<%--                        fontFamily: "Plus Jakarta Sans",--%>
<%--                        color: "#8F92A1",--%>
<%--                        fontSize: 12,--%>
<%--                    },--%>
<%--                    body: {--%>
<%--                        fontFamily: "Plus Jakarta Sans",--%>
<%--                        color: "#171717",--%>
<%--                        fontStyle: "bold",--%>
<%--                        fontSize: 16,--%>
<%--                    },--%>
<%--                    multiKeyBackground: "transparent",--%>
<%--                    displayColors: false,--%>
<%--                    padding: {--%>
<%--                        x: 30,--%>
<%--                        y: 10,--%>
<%--                    },--%>
<%--                    bodyAlign: "center",--%>
<%--                    titleAlign: "center",--%>
<%--                    titleColor: "#8F92A1",--%>
<%--                    bodyColor: "#171717",--%>
<%--                    bodyFont: {--%>
<%--                        family: "Plus Jakarta Sans",--%>
<%--                        size: "16",--%>
<%--                        weight: "bold",--%>
<%--                    },--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    display: false,--%>
<%--                },--%>
<%--            },--%>
<%--            responsive: true,--%>
<%--            maintainAspectRatio: false,--%>
<%--            title: {--%>
<%--                display: false,--%>
<%--            },--%>
<%--            scales: {--%>
<%--                y: {--%>
<%--                    grid: {--%>
<%--                        display: false,--%>
<%--                        drawTicks: false,--%>
<%--                        drawBorder: false,--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 35,--%>
<%--                        max: 1200,--%>
<%--                        min: 500,--%>
<%--                    },--%>
<%--                },--%>
<%--                x: {--%>
<%--                    grid: {--%>
<%--                        drawBorder: false,--%>
<%--                        color: "rgba(143, 146, 161, .1)",--%>
<%--                        zeroLineColor: "rgba(143, 146, 161, .1)",--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 20,--%>
<%--                    },--%>
<%--                },--%>
<%--            },--%>
<%--        },--%>
<%--    });--%>
<%--    / =========== chart one end--%>

<%--     **/--%>
<%--    / =========== chart two start--%>
<%--    const ctx2 = document.getElementById("Chart2").getContext("2d");--%>
<%--    const chart2 = new Chart(ctx2, {--%>
<%--        type: "bar",--%>
<%--        data: {--%>
<%--            labels: [--%>
<%--                "Jan",--%>
<%--                "Fab",--%>
<%--                "Mar",--%>
<%--                "Apr",--%>
<%--                "May",--%>
<%--                "Jun",--%>
<%--                "Jul",--%>
<%--                "Aug",--%>
<%--                "Sep",--%>
<%--                "Oct",--%>
<%--                "Nov",--%>
<%--                "Dec",--%>
<%--            ],--%>
<%--            datasets: [--%>
<%--                {--%>
<%--                    label: "",--%>
<%--                    backgroundColor: "#365CF5",--%>
<%--                    borderRadius: 30,--%>
<%--                    barThickness: 6,--%>
<%--                    maxBarThickness: 8,--%>
<%--                    data: [--%>
<%--                        600, 700, 1000, 700, 650, 800, 690, 740, 720, 1120, 876, 900,--%>
<%--                    ],--%>
<%--                },--%>
<%--            ],--%>
<%--        },--%>
<%--        options: {--%>
<%--            plugins: {--%>
<%--                tooltip: {--%>
<%--                    callbacks: {--%>
<%--                        titleColor: function (context) {--%>
<%--                            return "#8F92A1";--%>
<%--                        },--%>
<%--                        label: function (context) {--%>
<%--                            let label = context.dataset.label || "";--%>

<%--                            if (label) {--%>
<%--                                label += ": ";--%>
<%--                            }--%>
<%--                            label += context.parsed.y;--%>
<%--                            return label;--%>
<%--                        },--%>
<%--                    },--%>
<%--                    backgroundColor: "#F3F6F8",--%>
<%--                    titleAlign: "center",--%>
<%--                    bodyAlign: "center",--%>
<%--                    titleFont: {--%>
<%--                        size: 12,--%>
<%--                        weight: "bold",--%>
<%--                        color: "#8F92A1",--%>
<%--                    },--%>
<%--                    bodyFont: {--%>
<%--                        size: 16,--%>
<%--                        weight: "bold",--%>
<%--                        color: "#171717",--%>
<%--                    },--%>
<%--                    displayColors: false,--%>
<%--                    padding: {--%>
<%--                        x: 30,--%>
<%--                        y: 10,--%>
<%--                    },--%>
<%--                },--%>
<%--            },--%>
<%--            legend: {--%>
<%--                display: false,--%>
<%--            },--%>
<%--            legend: {--%>
<%--                display: false,--%>
<%--            },--%>
<%--            layout: {--%>
<%--                padding: {--%>
<%--                    top: 15,--%>
<%--                    right: 15,--%>
<%--                    bottom: 15,--%>
<%--                    left: 15,--%>
<%--                },--%>
<%--            },--%>
<%--            responsive: true,--%>
<%--            maintainAspectRatio: false,--%>
<%--            scales: {--%>
<%--                y: {--%>
<%--                    grid: {--%>
<%--                        display: false,--%>
<%--                        drawTicks: false,--%>
<%--                        drawBorder: false,--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 35,--%>
<%--                        max: 1200,--%>
<%--                        min: 0,--%>
<%--                    },--%>
<%--                },--%>
<%--                x: {--%>
<%--                    grid: {--%>
<%--                        display: false,--%>
<%--                        drawBorder: false,--%>
<%--                        color: "rgba(143, 146, 161, .1)",--%>
<%--                        drawTicks: false,--%>
<%--                        zeroLineColor: "rgba(143, 146, 161, .1)",--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 20,--%>
<%--                    },--%>
<%--                },--%>
<%--            },--%>
<%--            plugins: {--%>
<%--                legend: {--%>
<%--                    display: false,--%>
<%--                },--%>
<%--                title: {--%>
<%--                    display: false,--%>
<%--                },--%>
<%--            },--%>
<%--        },--%>
<%--    });--%>
<%--    / =========== chart two end--%>

<%--    / =========== chart three start--%>
<%--    const ctx3 = document.getElementById("Chart3").getContext("2d");--%>
<%--    const chart3 = new Chart(ctx3, {--%>
<%--        type: "line",--%>
<%--        data: {--%>
<%--            labels: [--%>
<%--                "Jan",--%>
<%--                "Feb",--%>
<%--                "Mar",--%>
<%--                "Apr",--%>
<%--                "May",--%>
<%--                "Jun",--%>
<%--                "Jul",--%>
<%--                "Aug",--%>
<%--                "Sep",--%>
<%--                "Oct",--%>
<%--                "Nov",--%>
<%--                "Dec",--%>
<%--            ],--%>
<%--            datasets: [--%>
<%--                {--%>
<%--                    label: "Revenue",--%>
<%--                    backgroundColor: "transparent",--%>
<%--                    borderColor: "#365CF5",--%>
<%--                    data: [80, 120, 110, 100, 130, 150, 115, 145, 140, 130, 160, 210],--%>
<%--                    pointBackgroundColor: "transparent",--%>
<%--                    pointHoverBackgroundColor: "#365CF5",--%>
<%--                    pointBorderColor: "transparent",--%>
<%--                    pointHoverBorderColor: "#365CF5",--%>
<%--                    pointHoverBorderWidth: 3,--%>
<%--                    pointBorderWidth: 5,--%>
<%--                    pointRadius: 5,--%>
<%--                    pointHoverRadius: 8,--%>
<%--                    fill: false,--%>
<%--                    tension: 0.4,--%>
<%--                },--%>
<%--                {--%>
<%--                    label: "Profit",--%>
<%--                    backgroundColor: "transparent",--%>
<%--                    borderColor: "#9b51e0",--%>
<%--                    data: [--%>
<%--                        120, 160, 150, 140, 165, 210, 135, 155, 170, 140, 130, 200,--%>
<%--                    ],--%>
<%--                    pointBackgroundColor: "transparent",--%>
<%--                    pointHoverBackgroundColor: "#9b51e0",--%>
<%--                    pointBorderColor: "transparent",--%>
<%--                    pointHoverBorderColor: "#9b51e0",--%>
<%--                    pointHoverBorderWidth: 3,--%>
<%--                    pointBorderWidth: 5,--%>
<%--                    pointRadius: 5,--%>
<%--                    pointHoverRadius: 8,--%>
<%--                    fill: false,--%>
<%--                    tension: 0.4,--%>
<%--                },--%>
<%--                {--%>
<%--                    label: "Order",--%>
<%--                    backgroundColor: "transparent",--%>
<%--                    borderColor: "#f2994a",--%>
<%--                    data: [180, 110, 140, 135, 100, 90, 145, 115, 100, 110, 115, 150],--%>
<%--                    pointBackgroundColor: "transparent",--%>
<%--                    pointHoverBackgroundColor: "#f2994a",--%>
<%--                    pointBorderColor: "transparent",--%>
<%--                    pointHoverBorderColor: "#f2994a",--%>
<%--                    pointHoverBorderWidth: 3,--%>
<%--                    pointBorderWidth: 5,--%>
<%--                    pointRadius: 5,--%>
<%--                    pointHoverRadius: 8,--%>
<%--                    fill: false,--%>
<%--                    tension: 0.4,--%>
<%--                },--%>
<%--            ],--%>
<%--        },--%>
<%--        options: {--%>
<%--            plugins: {--%>
<%--                tooltip: {--%>
<%--                    intersect: false,--%>
<%--                    backgroundColor: "#fbfbfb",--%>
<%--                    titleColor: "#8F92A1",--%>
<%--                    bodyColor: "#272727",--%>
<%--                    titleFont: {--%>
<%--                        size: 16,--%>
<%--                        family: "Plus Jakarta Sans",--%>
<%--                        weight: "400",--%>
<%--                    },--%>
<%--                    bodyFont: {--%>
<%--                        family: "Plus Jakarta Sans",--%>
<%--                        size: 16,--%>
<%--                    },--%>
<%--                    multiKeyBackground: "transparent",--%>
<%--                    displayColors: false,--%>
<%--                    padding: {--%>
<%--                        x: 30,--%>
<%--                        y: 15,--%>
<%--                    },--%>
<%--                    borderColor: "rgba(143, 146, 161, .1)",--%>
<%--                    borderWidth: 1,--%>
<%--                    enabled: true,--%>
<%--                },--%>
<%--                title: {--%>
<%--                    display: false,--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    display: false,--%>
<%--                },--%>
<%--            },--%>
<%--            layout: {--%>
<%--                padding: {--%>
<%--                    top: 0,--%>
<%--                },--%>
<%--            },--%>
<%--            responsive: true,--%>
<%--            / maintainAspectRatio: false,--%>
<%--            legend: {--%>
<%--                display: false,--%>
<%--            },--%>
<%--            scales: {--%>
<%--                y: {--%>
<%--                    grid: {--%>
<%--                        display: false,--%>
<%--                        drawTicks: false,--%>
<%--                        drawBorder: false,--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 35,--%>
<%--                    },--%>
<%--                    max: 350,--%>
<%--                    min: 50,--%>
<%--                },--%>
<%--                x: {--%>
<%--                    grid: {--%>
<%--                        drawBorder: false,--%>
<%--                        color: "rgba(143, 146, 161, .1)",--%>
<%--                        drawTicks: false,--%>
<%--                        zeroLineColor: "rgba(143, 146, 161, .1)",--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 20,--%>
<%--                    },--%>
<%--                },--%>
<%--            },--%>
<%--        },--%>
<%--    });--%>
<%--    / =========== chart three end--%>

<%--    / ================== chart four start--%>
<%--    const ctx4 = document.getElementById("Chart4").getContext("2d");--%>
<%--    const chart4 = new Chart(ctx4, {--%>
<%--        type: "bar",--%>
<%--        data: {--%>
<%--            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],--%>
<%--            datasets: [--%>
<%--                {--%>
<%--                    label: "",--%>
<%--                    backgroundColor: "#365CF5",--%>
<%--                    borderColor: "transparent",--%>
<%--                    borderRadius: 20,--%>
<%--                    borderWidth: 5,--%>
<%--                    barThickness: 20,--%>
<%--                    maxBarThickness: 20,--%>
<%--                    data: [600, 700, 1000, 700, 650, 800],--%>
<%--                },--%>
<%--                {--%>
<%--                    label: "",--%>
<%--                    backgroundColor: "#d50100",--%>
<%--                    borderColor: "transparent",--%>
<%--                    borderRadius: 20,--%>
<%--                    borderWidth: 5,--%>
<%--                    barThickness: 20,--%>
<%--                    maxBarThickness: 20,--%>
<%--                    data: [690, 740, 720, 1120, 876, 900],--%>
<%--                },--%>
<%--            ],--%>
<%--        },--%>
<%--        options: {--%>
<%--            plugins: {--%>
<%--                tooltip: {--%>
<%--                    backgroundColor: "#F3F6F8",--%>
<%--                    titleColor: "#8F92A1",--%>
<%--                    titleFontSize: 12,--%>
<%--                    bodyColor: "#171717",--%>
<%--                    bodyFont: {--%>
<%--                        weight: "bold",--%>
<%--                        size: 16,--%>
<%--                    },--%>
<%--                    multiKeyBackground: "transparent",--%>
<%--                    displayColors: false,--%>
<%--                    padding: {--%>
<%--                        x: 30,--%>
<%--                        y: 10,--%>
<%--                    },--%>
<%--                    bodyAlign: "center",--%>
<%--                    titleAlign: "center",--%>
<%--                    enabled: true,--%>
<%--                },--%>
<%--                legend: {--%>
<%--                    display: false,--%>
<%--                },--%>
<%--            },--%>
<%--            layout: {--%>
<%--                padding: {--%>
<%--                    top: 0,--%>
<%--                },--%>
<%--            },--%>
<%--            responsive: true,--%>
<%--            / maintainAspectRatio: false,--%>
<%--            title: {--%>
<%--                display: false,--%>
<%--            },--%>
<%--            scales: {--%>
<%--                y: {--%>
<%--                    grid: {--%>
<%--                        display: false,--%>
<%--                        drawTicks: false,--%>
<%--                        drawBorder: false,--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 35,--%>
<%--                        max: 1200,--%>
<%--                        min: 0,--%>
<%--                    },--%>
<%--                },--%>
<%--                x: {--%>
<%--                    grid: {--%>
<%--                        display: false,--%>
<%--                        drawBorder: false,--%>
<%--                        color: "rgba(143, 146, 161, .1)",--%>
<%--                        zeroLineColor: "rgba(143, 146, 161, .1)",--%>
<%--                    },--%>
<%--                    ticks: {--%>
<%--                        padding: 20,--%>
<%--                    },--%>
<%--                },--%>
<%--            },--%>
<%--        },--%>
<%--    });--%>
<%--    / =========== chart four end--%>
<%--</script>--%>
</body>

</html>