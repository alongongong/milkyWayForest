<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>은하숲</title>
 <link rel="shortcut icon" href="/milkyWayForest/image/SoopIcon2.png">
</head>
<body>
<header>
	<jsp:include page="main/header.jsp"/>
</header>
	<div id="bodySection">
		<c:if test="${empty display }">
			<jsp:include page="main/body.jsp"/>
		</c:if>
	    <c:if test="${not empty display }">
	        <jsp:include page="${display }"/>
	    </c:if>
	</div>
	
	<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "b0807d39-1992-4677-8df7-23ae23a369df"
  });
</script>
	<!-- End Channel Plugin -->
</body>
<footer>
	<jsp:include page="main/footer.jsp" />
</footer>
</html>