<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Diamond Resort 後台管理</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/loading.png" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index-back.css" />
        <script src="https://kit.fontawesome.com/dc3c868026.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <div class="sidebar-brand">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="" />
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
                    <div class="sidebar-header">
                        <div class="user-pic">
                            <img class="img-responsive img-rounded emp-pic" src="${pageContext.request.contextPath}/images/avatar-2.jpg" alt="User picture" />
                        </div>
                        <div class="user-info">
                            <span class="emp-name">Wayne</span>
                            <span class="emp-title">董事長</span>
                            <span class="user-status">
                                <i class="fa fa-circle"></i>
                                <span>Online</span>
                            </span>
                        </div>
                    </div>
                    <!-- sidebar-header  -->
                    <div class="sidebar-search">
                        <div>
                            <div class="input-group">
                                <input type="text" class="form-control search-menu" placeholder="Search..." />
                                <div class="input-group-append">
                                    <span class="input-group-search">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- sidebar-search  -->
                    <div class="sidebar-menu">
                        <ul>
                            <li class="header-menu">
                                <span>員工功能</span>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-book"></i>
                                    <span>個人資料修改</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-calendar"></i>
                                    <span>工作排程</span>
                                    <span class="badge badge-pill badge-danger">3</span>
                                </a>
                            </li>
                            <li class="header-menu">
                                <span>戴蒙度假村系統</span>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-tachometer-alt"></i>
                                    <span>員工管理系統</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">權限管理</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 2</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 3</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-calendar"></i>
                                    <span>前台房務系統</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">功能 1</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 2</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 3</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>會員管理系統</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">帳號管理</a>
                                        </li>
                                        <li>
                                            <a href="#">訂單管理</a>
                                        </li>
                                        <li>
                                            <a href="#">即時通管理</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="far fa-gem"></i>
                                    <span>餐飲管理系統</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">功能 1</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 2</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 3</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-chart-line"></i>
                                    <span>服務管理系統</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">功能 1</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 2</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 3</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-globe"></i>
                                    <span>活動管理系統</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">功能 1</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 2</a>
                                        </li>
                                        <li>
                                            <a href="#">功能 3</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- sidebar-menu--end  -->
                </div>
            </nav>
            <!-- 頁面內容開始-->

            <!-- 在這區塊內建立Form表單等等 -->
            <!-- 頁面內容結束 -->
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
        <script>
        $(".sidebar-dropdown > a").click(function () {
            $(".sidebar-submenu").slideUp(200);
            if ($(this).parent().hasClass("active")) {
                $(".sidebar-dropdown").removeClass("active");
                $(this).parent().removeClass("active");
            } else {
                $(".sidebar-dropdown").removeClass("active");
                $(this).next(".sidebar-submenu").slideDown(200);
                $(this).parent().addClass("active");
            }
        });

        $("#close-sidebar").click(function () {
            $(".page-wrapper").removeClass("toggled");
        });
        $("#show-sidebar").click(function () {
            $(".page-wrapper").addClass("toggled");
        });
        </script>
    </body>
</html>
