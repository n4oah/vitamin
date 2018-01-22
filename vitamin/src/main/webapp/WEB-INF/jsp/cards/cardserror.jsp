<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TROLLO</title>
<style>
	html{background:white;}
	body{margin:0;}
	div{text-align: center; font-family: "맑은 고딕";}
	#A{display:flex; justify-content: center; width:100vw; height:100vh;}
	#B{display:flex; justify-content: center; flex-direction: column;}
	#trollo{
		width:10vw; height:10vw;
		background:url("/vitamin/image/cards/Trollo.png") no-repeat;
		background-size:100%;
		align-self: center;
	}
	#error{font-size:3vw;}
	#description{font-size:2vw;}
</style>
<script src="../js/jquery/jquery-3.2.1.js"></script>
</head>
<body>
	<noscript><p>스크립트 켜라</p></noscript>
	<div id="A">
		<div id="B">
			<div id="trollo"></div>
			<div id="error"></div>
			<div id="description"></div>
		</div>
	</div>
</body>
<script>
	$("#error").text('${error}')
	$("#description").text('${description}')
</script>
</html>