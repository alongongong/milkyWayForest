<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두/차</title>
<link rel="stylesheet" type="text/css" href="../css/beanNTea.css">
</head>
<style>
li {
   list-style: none;
}
</style>
<body>
<form id="beanNTeaForm">

<h1>원두/차</h1>
	<!-- 1번 -->
	<fieldset> 
	
	    <ul>
               <li><a href="#">원두</a></li>
               <li><a href="#">차</a></li>
		</ul>
	</fieldset> 
	<hr>
	<br>
	<!-- 2번 -->
	<div id="dd">
	<div>원두/차</div>
	<hr>
		<ul>
           <li><a href="#">Menu 원두</a></li>
           <li><a href="#">Menu 차</a></li>
           <li><a href="#">Menu 3</a></li>
        </ul>
	</div>
	<hr>
	
	<!-- 3번 -->
	
	<table>
		<ul>
           <li><a href="#">Menu 1</a></li>
           <li><a href="#">Menu 2</a></li>
           <li><a href="#">Menu 3</a></li>
        </ul>
	</table>
	<hr>
	
	<!-- 4번 -->
	<table border="1"  cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center" colspan="2">원두/차</td>
		</tr>
		<tr>
			<td width="100" align="center"><a href="#">원두</a></td>
			<td width="100" align="center"><a href="#">차</a></td>
			</tr>
	</table> 
	<hr>
	
	<!-- 5번 -->
	<table class="bean" border="1px solid">
		<tr>
			<th colspan="2">원두/차</th>
		</tr>
		<tr>
			<td width="100" align="center"><a href="#">원두</a></td>
			<td width="100" align="center"><a href="#">차</a></td>
		</tr>
	</table> 
	<hr>
	
	

</form>
<br><br><br>

<div id="beanMenuDiv">원두</div>
<br><br><br>

<div id="teaMenuDiv">차</div>
<br><br><br>

</body>
</html>