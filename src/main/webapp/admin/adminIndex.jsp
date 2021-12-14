<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/assets/css/adminIndex.css">
<link rel="apple-touch-icon" sizes="76x76" href="/milkyWayForest/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/milkyWayForest/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    은하숲 MilkyWayForest 관리자 페이지
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--  Fonts and icons  -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/milkyWayForest/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/milkyWayForest/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/milkyWayForest/assets/demo/demo.css" rel="stylesheet" />
</head>
<body class="">
  <div class="wrapper ">
 
   <jsp:include page="adminNav.jsp" />
    
    <div class="main-panel">
     
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
		      <a class="navbar-brand" href="javascript:;">
		      	<c:if test="${empty subject }">
		    		메뉴 관리
		  		</c:if>
		   		<c:if test="${not empty subject }">
					${subject }
		    	</c:if>
		      </a>
		    </div>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-bar navbar-kebab"></span>
		      <span class="navbar-toggler-bar navbar-kebab"></span>
		      <span class="navbar-toggler-bar navbar-kebab"></span>
		    </button>
		    <div class="collapse navbar-collapse justify-content-end" id="navigation">
		      <form>
		        <div class="input-group no-border">
		          <input type="button" id="logoutBtn" class="btn" value="로그아웃">
		          <!-- <input type="text" value="" class="form-control" placeholder="Search...">
		          <div class="input-group-append">
		            <div class="input-group-text">
		              <i class="nc-icon nc-zoom-split"></i>
		            </div>
		          </div>-->
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
			<!-- 메인 Nav -->
	    	<c:if test="${empty display }">
	    		<jsp:include page="pAllMenu.jsp" />
	    	</c:if>
	    	<c:if test="${not empty display }">
	    		<jsp:include page="${display }" />
	    	</c:if>
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
                © 2021, made with <i class="fa fa-heart heart"></i> by Creative 은하숲 
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="/milkyWayForest/assets/js/core/jquery.min.js"></script>
  <script src="/milkyWayForest/assets/js/core/popper.min.js"></script>
  <script src="/milkyWayForest/assets/js/core/bootstrap.min.js"></script>
  <script src="/milkyWayForest/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="/milkyWayForest/assets/js/adminIndex.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="/milkyWayForest/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/milkyWayForest/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/milkyWayForest/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>

</body>
</html>