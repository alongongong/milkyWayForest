<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./assets/css/adminIndexTemplate.css">
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Paper Dashboard 2 by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />
</head>
<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          Your Logo
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="menu">회원 혜택 관리</li>
          <li class="active ">
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>회원리스트</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>등급별 혜택</p>
            </a>
          </li>
          <li class="menu">상품 관리</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>상품 조회, 수정, 삭제</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>상품 등록</p>
            </a>
          </li>
          <li class="menu">상담 관리</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>상담 관리</p>
            </a>
          </li>
          <li class="menu">판매 관리</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-diamond"></i>
              <p>일자별 주문 내역 확인</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>주문 확인 / 발송 관리</p>
            </a>
          </li>
           <li>
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>취소, 교환, 반품 관리</p>
            </a>
          </li>
          <li class="menu">게시글 관리</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>문의 관리 게시판</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>상품 리뷰 관리</p>
            </a>
          </li>
          <li class="menu">물류 관리</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>물류 관리</p>
            </a>
          </li>
          <li class="menu">통계</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>접속자수 통계</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>판매 통계</p>
            </a>
          </li>
          <li class="menu">메뉴 관리</li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>메뉴 관리</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;">Title</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <h3 class="description">Your content here</h3>
          </div>
        </div>
      </div>
      <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © 2020, made with <i class="fa fa-heart heart"></i> by Creative Tim
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="./assets/js/core/jquery.min.js"></script>
  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="./assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="./assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>

</body>
</html>