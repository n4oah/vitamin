<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companySearch.css">
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<style type="text/css">
html, body, #waha{
   	height:100%;
   	margin:0;
}
* {font-family: 'Nanum Gothic', sans-serif, serif;}
div.top {width: 50vw; border-bottom: 0.3vh solid black}
div.top > .logo {width: 7.2vh}
div.top > .title {font-size: 3.5vh; color: #5566ff; font-weight: bold}
div.top > .bookmark {float: right; width: 3vh;}
div.top > .bookmark:hover {background-image: url("https://i.imgur.com/PRgfqvQ.png"); background-size: 3vh}
.summary {background-color: pink; width: 65vw; height: 6.8vh 6.8vw; border-radius: 1vw}
.vr {width: 0.2vw; height: 100%; background-color: gray; display: inline-block; position: absolute}
.sumtitle {display: inline-block; overflow: hidden; margin-top: -0.3vh}
/* .sumtitle > div:first-child {border-bottom: 0.2vh solid black; width: 100%; padding-bottom: 0.5vw; padding-to: 0.5vw} */
.sumtitle > div:last-child {top: -0.3vh}
.sumtitle > * {text-align: center; color: black; font-size: 100%; font-weight: bold}
.chart, .graphTop {height: 18vh; width: 50vw}
.chart div[name='graph'] {width: 3.5vh; display: inline-block}
.graph1 {
    height: 79.6%;
    background-color: rgb(255, 83, 83)
}
.graph2 {
    height: 43.7%;
    background-color: rgb(137, 255, 83);
}
.graph3 {
    height: 98.6%;
    background-color: rgb(83, 109, 255);
}
.graphText {
	display: inline-block;
    position: absolute;
	height: auto;
	margin-left: 0.3vw;
	font-size: 2vh;
	font-weight: bold;
}
.graphName > span {font-size: 2vh}
.hover {
	position: absolute;
	font-weight: bold;
	font-size: 1vw;
	border-radius: 0.5vw;
	background-color: #ff8e00;
	padding: 0.1vw;
	border: 0.2vw solid black;
	z-index: 1000;
}
#header {
    padding: 5px 8px;
}
.recruitList {
	height: 10vw;
	text-align: center;
}
.recruitList > div {
	display: inline-block;
}
.recruitList img {
	width: 50%;
}
.recruit {
	width: 15%;
	height: 100%;
	border: 1px solid black;
	vertical-align: middle;
    line-height: 2vw;
}
h6 {
	display: inline-block;
}
.recTitle {
	font-weight: bold;
}
.recTitle, .recContent {
	border-bottom: 1px solid gray;
}
.recContent > div {
	text-align: left;
	display: inline-block;
	width: 45%;
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap; 
}
.detail, .comment {
	border: 1px solid #e4e4e4;
	margin-left: auto;
    margin-right: auto;
}
.detail {width: 30vw;}
.comment {width: 50vw;}
.detail span {text-align: left;}
.detail > div {border-left: 3px solid blue; padding-left: 3px; border-bottom: 1px solid black;}
.detail > div:first-child {font-weight: bold; background: #e0e0e0;}
.detail > div > span:first-child {
	display: inline-block;
    width: 100px;
}
.input-group-addon {padding-top: 0px; padding-bottom: 0px;}
.heart {
	background-image: url("https://i.imgur.com/ZttVr5D.png");
	background-repeat: no-repeat;
	background-position: -15px;
	background-size: 15px;
}
.heart:hover, .selected {
	background-image: url("https://i.imgur.com/ZttVr5D.png");
	background-position: 0px;
}
.col-lg-6 {width: 100%}
.commentTitle {font-weight: bold; font-size: 2vw; border-left: 5px solid blue; padding-left: 5px;}
.regDate {width: 100px; display: inline-block;}
.input-group {border-bottom: 1px solid #e4e4e4;}
hr {
	width: 100%;
    border: 0;
    background: black;
    height: 0.2vw;
    margin-top: 0.2vw;
    margin-bottom: 0.2vw;
}
.sumtitle > div:first-child {
	margin-top: 0.2vw;
}
body > div {margin-bottom: 4vh; margin-left: auto; margin-right: auto;}
.sumtitle:not(:last-child) {
	border-right: 0.2vw solid gray;
}
.sum {display: flex; width: 65vh; background-cl}
.sumtitle {margin-left: auto; margin-right: auto; flex: 1 1;}

@keyframes snow {
0% {
    -webkit-box-shadow: 0 0 0 transparent, 34vw -121vh 4px 1px #fff, -26vw -67vh 5px 1px #fff, 66vw -114vh 1px 3px #fff, -53vw -131vh 5px 2px #fff, 13vw -59vh 8px 2px #fff, -75vw -145vh 2px 5px #fff, 59vw -94vh 8px 1px #fff, -95vw -79vh 8px 1px #fff, 19vw -90vh 4px 2px #fff, -60vw -93vh 2px 2px #fff, 76vw -147vh 6px 1px #fff, -92vw -134vh 4px 5px #fff, 48vw -112vh 3px 1px #fff, -63vw -119vh 3px 4px #fff, 94vw -147vh 1px 2px #fff, -27vw -87vh 5px 2px #fff, 31vw -89vh 6px 3px #fff, -10vw -132vh 4px 2px #fff, 6vw -116vh 6px 3px #fff, -12vw -52vh 6px 4px #fff, 90vw -138vh 2px 4px #fff, -10vw -106vh 2px 1px #fff, 17vw -80vh 3px 3px #fff, -96vw -134vh 2px 3px #fff, 17vw -123vh 7px 3px #fff, -19vw -59vh 2px 3px #fff, 58vw -136vh 7px 4px #fff, -82vw -114vh 7px 4px #fff, 20vw -95vh 5px 2px #fff, -34vw -79vh 8px 2px #fff, 12vw -75vh 8px 5px #fff, -76vw -71vh 5px 2px #fff, 46vw -115vh 4px 3px #fff, -69vw -56vh 3px 3px #fff, 93vw -113vh 7px 1px #fff, -63vw -92vh 3px 5px #fff, 86vw -99vh 8px 3px #fff, -34vw -138vh 1px 4px #fff, 46vw -117vh 6px 5px #fff, -28vw -107vh 5px 4px #fff, 77vw -72vh 3px 1px #fff, -37vw -108vh 6px 5px #fff, 47vw -127vh 5px 2px #fff, -58vw -68vh 6px 3px #fff, 1vw -82vh 4px 2px #fff, -50vw -100vh 3px 1px #fff, 62vw -83vh 1px 3px #fff, -73vw -113vh 8px 4px #fff, 62vw -135vh 7px 1px #fff, -12vw -81vh 7px 4px #fff, 71vw -133vh 5px 4px #fff, -92vw -116vh 1px 5px #fff, 19vw -84vh 7px 4px #fff, -64vw -87vh 7px 4px #fff, 18vw -77vh 3px 3px #fff, -65vw -100vh 7px 2px #fff, 15vw -72vh 7px 4px #fff, -33vw -142vh 7px 4px #fff, 34vw -149vh 1px 3px #fff, -24vw -59vh 2px 5px #fff, 33vw -62vh 8px 2px #fff, -54vw -125vh 6px 1px #fff, 94vw -61vh 3px 1px #fff, -46vw -144vh 6px 4px #fff, 33vw -123vh 7px 3px #fff, -16vw -102vh 4px 5px #fff, 95vw -88vh 2px 1px #fff, -2vw -73vh 7px 2px #fff, 64vw -55vh 7px 3px #fff, -59vw -76vh 3px 4px #fff, 47vw -97vh 1px 4px #fff, -65vw -76vh 5px 4px #fff, 98vw -62vh 2px 3px #fff, -72vw -104vh 1px 5px #fff, 84vw -121vh 5px 3px #fff, -41vw -75vh 2px 1px #fff, 70vw -144vh 6px 5px #fff, -92vw -111vh 8px 2px #fff, 67vw -137vh 3px 5px #fff, -6vw -106vh 6px 4px #fff, 52vw -107vh 8px 1px #fff, -59vw -89vh 6px 2px #fff, 93vw -118vh 6px 4px #fff, -17vw -83vh 4px 1px #fff, 34vw -63vh 5px 5px #fff, -63vw -82vh 8px 1px #fff, 42vw -126vh 2px 5px #fff, -26vw -139vh 1px 5px #fff, 79vw -73vh 4px 2px #fff, -38vw -108vh 6px 4px #fff, 8vw -100vh 7px 2px #fff, -97vw -85vh 5px 3px #fff, 67vw -92vh 1px 1px #fff, -14vw -86vh 7px 1px #fff, 89vw -50vh 1px 2px #fff, -64vw -102vh 4px 2px #fff, 59vw -50vh 7px 2px #fff, -6vw -82vh 4px 5px #fff, 1vw -108vh 5px 1px #fff, -78vw -106vh 7px 1px #fff;
    box-shadow: 0 0 0 transparent, 34vw -121vh 4px 1px #fff, -26vw -67vh 5px 1px #fff, 66vw -114vh 1px 3px #fff, -53vw -131vh 5px 2px #fff, 13vw -59vh 8px 2px #fff, -75vw -145vh 2px 5px #fff, 59vw -94vh 8px 1px #fff, -95vw -79vh 8px 1px #fff, 19vw -90vh 4px 2px #fff, -60vw -93vh 2px 2px #fff, 76vw -147vh 6px 1px #fff, -92vw -134vh 4px 5px #fff, 48vw -112vh 3px 1px #fff, -63vw -119vh 3px 4px #fff, 94vw -147vh 1px 2px #fff, -27vw -87vh 5px 2px #fff, 31vw -89vh 6px 3px #fff, -10vw -132vh 4px 2px #fff, 6vw -116vh 6px 3px #fff, -12vw -52vh 6px 4px #fff, 90vw -138vh 2px 4px #fff, -10vw -106vh 2px 1px #fff, 17vw -80vh 3px 3px #fff, -96vw -134vh 2px 3px #fff, 17vw -123vh 7px 3px #fff, -19vw -59vh 2px 3px #fff, 58vw -136vh 7px 4px #fff, -82vw -114vh 7px 4px #fff, 20vw -95vh 5px 2px #fff, -34vw -79vh 8px 2px #fff, 12vw -75vh 8px 5px #fff, -76vw -71vh 5px 2px #fff, 46vw -115vh 4px 3px #fff, -69vw -56vh 3px 3px #fff, 93vw -113vh 7px 1px #fff, -63vw -92vh 3px 5px #fff, 86vw -99vh 8px 3px #fff, -34vw -138vh 1px 4px #fff, 46vw -117vh 6px 5px #fff, -28vw -107vh 5px 4px #fff, 77vw -72vh 3px 1px #fff, -37vw -108vh 6px 5px #fff, 47vw -127vh 5px 2px #fff, -58vw -68vh 6px 3px #fff, 1vw -82vh 4px 2px #fff, -50vw -100vh 3px 1px #fff, 62vw -83vh 1px 3px #fff, -73vw -113vh 8px 4px #fff, 62vw -135vh 7px 1px #fff, -12vw -81vh 7px 4px #fff, 71vw -133vh 5px 4px #fff, -92vw -116vh 1px 5px #fff, 19vw -84vh 7px 4px #fff, -64vw -87vh 7px 4px #fff, 18vw -77vh 3px 3px #fff, -65vw -100vh 7px 2px #fff, 15vw -72vh 7px 4px #fff, -33vw -142vh 7px 4px #fff, 34vw -149vh 1px 3px #fff, -24vw -59vh 2px 5px #fff, 33vw -62vh 8px 2px #fff, -54vw -125vh 6px 1px #fff, 94vw -61vh 3px 1px #fff, -46vw -144vh 6px 4px #fff, 33vw -123vh 7px 3px #fff, -16vw -102vh 4px 5px #fff, 95vw -88vh 2px 1px #fff, -2vw -73vh 7px 2px #fff, 64vw -55vh 7px 3px #fff, -59vw -76vh 3px 4px #fff, 47vw -97vh 1px 4px #fff, -65vw -76vh 5px 4px #fff, 98vw -62vh 2px 3px #fff, -72vw -104vh 1px 5px #fff, 84vw -121vh 5px 3px #fff, -41vw -75vh 2px 1px #fff, 70vw -144vh 6px 5px #fff, -92vw -111vh 8px 2px #fff, 67vw -137vh 3px 5px #fff, -6vw -106vh 6px 4px #fff, 52vw -107vh 8px 1px #fff, -59vw -89vh 6px 2px #fff, 93vw -118vh 6px 4px #fff, -17vw -83vh 4px 1px #fff, 34vw -63vh 5px 5px #fff, -63vw -82vh 8px 1px #fff, 42vw -126vh 2px 5px #fff, -26vw -139vh 1px 5px #fff, 79vw -73vh 4px 2px #fff, -38vw -108vh 6px 4px #fff, 8vw -100vh 7px 2px #fff, -97vw -85vh 5px 3px #fff, 67vw -92vh 1px 1px #fff, -14vw -86vh 7px 1px #fff, 89vw -50vh 1px 2px #fff, -64vw -102vh 4px 2px #fff, 59vw -50vh 7px 2px #fff, -6vw -82vh 4px 5px #fff, 1vw -108vh 5px 1px #fff, -78vw -106vh 7px 1px #fff;
}
index.html?limi…ge=2&q=snow:48
100% {
    -webkit-box-shadow: 0 0 0 transparent, 99vw 95vh 8px 5px #fff, -71vw 106vh 1px 3px #fff, 55vw 98vh 4px 1px #fff, -77vw 141vh 4px 5px #fff, 17vw 67vh 5px 1px #fff, -64vw 126vh 8px 1px #fff, 71vw 62vh 5px 3px #fff, -31vw 74vh 8px 5px #fff, 80vw 73vh 1px 1px #fff, -28vw 76vh 7px 5px #fff, 83vw 101vh 8px 3px #fff, -83vw 105vh 4px 4px #fff, 58vw 102vh 7px 2px #fff, -42vw 54vh 2px 5px #fff, 60vw 108vh 3px 3px #fff, -43vw 61vh 8px 2px #fff, 98vw 124vh 6px 4px #fff, -93vw 101vh 2px 3px #fff, 72vw 57vh 4px 4px #fff, -93vw 112vh 1px 4px #fff, 39vw 110vh 4px 1px #fff, -49vw 55vh 2px 5px #fff, 9vw 65vh 2px 3px #fff, -46vw 58vh 8px 2px #fff, 38vw 65vh 8px 3px #fff, -80vw 109vh 3px 1px #fff, 26vw 135vh 4px 2px #fff, -56vw 102vh 5px 3px #fff, 76vw 71vh 1px 3px #fff, -69vw 134vh 7px 1px #fff, 26vw 58vh 3px 5px #fff, -17vw 53vh 6px 4px #fff, 32vw 60vh 3px 2px #fff, -61vw 94vh 2px 1px #fff, 78vw 78vh 8px 5px #fff, -96vw 125vh 2px 2px #fff, 40vw 103vh 6px 1px #fff, -18vw 123vh 6px 4px #fff, 9vw 68vh 6px 2px #fff, -35vw 109vh 8px 4px #fff, 33vw 100vh 8px 1px #fff, -81vw 110vh 7px 5px #fff, 40vw 145vh 5px 4px #fff, -37vw 74vh 1px 1px #fff, 20vw 64vh 4px 1px #fff, -89vw 145vh 3px 3px #fff, 90vw 133vh 4px 1px #fff, -54vw 107vh 6px 1px #fff, 93vw 90vh 4px 4px #fff, -97vw 65vh 7px 5px #fff, 24vw 117vh 3px 4px #fff, -8vw 60vh 2px 4px #fff, 35vw 145vh 3px 1px #fff, -90vw 120vh 3px 2px #fff, 17vw 60vh 7px 4px #fff, -31vw 127vh 6px 4px #fff, 76vw 106vh 5px 2px #fff, -3vw 76vh 5px 3px #fff, 85vw 54vh 4px 1px #fff, -4vw 109vh 3px 3px #fff, 30vw 94vh 4px 5px #fff, -30vw 149vh 6px 3px #fff, 97vw 81vh 2px 4px #fff, -78vw 146vh 2px 1px #fff, 46vw 98vh 8px 4px #fff, -60vw 140vh 8px 1px #fff, 20vw 101vh 3px 2px #fff, -56vw 129vh 5px 2px #fff, 31vw 95vh 4px 3px #fff, -12vw 57vh 3px 2px #fff, 18vw 124vh 3px 2px #fff, -10vw 135vh 6px 4px #fff, 74vw 128vh 1px 3px #fff, -67vw 60vh 7px 2px #fff, 68vw 97vh 3px 3px #fff, -64vw 119vh 1px 1px #fff, 64vw 63vh 4px 5px #fff, -7vw 115vh 5px 1px #fff, 65vw 77vh 8px 3px #fff, -35vw 83vh 6px 4px #fff, 41vw 126vh 8px 3px #fff, -93vw 138vh 7px 4px #fff, 97vw 137vh 8px 1px #fff, -36vw 81vh 8px 5px #fff, 3vw 67vh 2px 3px #fff, -5vw 51vh 2px 1px #fff, 60vw 128vh 2px 4px #fff, -20vw 90vh 8px 5px #fff, 69vw 89vh 6px 1px #fff, -18vw 87vh 5px 5px #fff, 98vw 123vh 8px 5px #fff, -95vw 62vh 6px 1px #fff, 76vw 52vh 5px 3px #fff, -29vw 136vh 6px 5px #fff, 36vw 69vh 3px 2px #fff, -67vw 126vh 5px 3px #fff, 81vw 89vh 6px 2px #fff, -10vw 126vh 1px 2px #fff, 61vw 108vh 2px 2px #fff, -20vw 99vh 1px 1px #fff;
    box-shadow: 0 0 0 transparent, 99vw 95vh 8px 5px #fff, -71vw 106vh 1px 3px #fff, 55vw 98vh 4px 1px #fff, -77vw 141vh 4px 5px #fff, 17vw 67vh 5px 1px #fff, -64vw 126vh 8px 1px #fff, 71vw 62vh 5px 3px #fff, -31vw 74vh 8px 5px #fff, 80vw 73vh 1px 1px #fff, -28vw 76vh 7px 5px #fff, 83vw 101vh 8px 3px #fff, -83vw 105vh 4px 4px #fff, 58vw 102vh 7px 2px #fff, -42vw 54vh 2px 5px #fff, 60vw 108vh 3px 3px #fff, -43vw 61vh 8px 2px #fff, 98vw 124vh 6px 4px #fff, -93vw 101vh 2px 3px #fff, 72vw 57vh 4px 4px #fff, -93vw 112vh 1px 4px #fff, 39vw 110vh 4px 1px #fff, -49vw 55vh 2px 5px #fff, 9vw 65vh 2px 3px #fff, -46vw 58vh 8px 2px #fff, 38vw 65vh 8px 3px #fff, -80vw 109vh 3px 1px #fff, 26vw 135vh 4px 2px #fff, -56vw 102vh 5px 3px #fff, 76vw 71vh 1px 3px #fff, -69vw 134vh 7px 1px #fff, 26vw 58vh 3px 5px #fff, -17vw 53vh 6px 4px #fff, 32vw 60vh 3px 2px #fff, -61vw 94vh 2px 1px #fff, 78vw 78vh 8px 5px #fff, -96vw 125vh 2px 2px #fff, 40vw 103vh 6px 1px #fff, -18vw 123vh 6px 4px #fff, 9vw 68vh 6px 2px #fff, -35vw 109vh 8px 4px #fff, 33vw 100vh 8px 1px #fff, -81vw 110vh 7px 5px #fff, 40vw 145vh 5px 4px #fff, -37vw 74vh 1px 1px #fff, 20vw 64vh 4px 1px #fff, -89vw 145vh 3px 3px #fff, 90vw 133vh 4px 1px #fff, -54vw 107vh 6px 1px #fff, 93vw 90vh 4px 4px #fff, -97vw 65vh 7px 5px #fff, 24vw 117vh 3px 4px #fff, -8vw 60vh 2px 4px #fff, 35vw 145vh 3px 1px #fff, -90vw 120vh 3px 2px #fff, 17vw 60vh 7px 4px #fff, -31vw 127vh 6px 4px #fff, 76vw 106vh 5px 2px #fff, -3vw 76vh 5px 3px #fff, 85vw 54vh 4px 1px #fff, -4vw 109vh 3px 3px #fff, 30vw 94vh 4px 5px #fff, -30vw 149vh 6px 3px #fff, 97vw 81vh 2px 4px #fff, -78vw 146vh 2px 1px #fff, 46vw 98vh 8px 4px #fff, -60vw 140vh 8px 1px #fff, 20vw 101vh 3px 2px #fff, -56vw 129vh 5px 2px #fff, 31vw 95vh 4px 3px #fff, -12vw 57vh 3px 2px #fff, 18vw 124vh 3px 2px #fff, -10vw 135vh 6px 4px #fff, 74vw 128vh 1px 3px #fff, -67vw 60vh 7px 2px #fff, 68vw 97vh 3px 3px #fff, -64vw 119vh 1px 1px #fff, 64vw 63vh 4px 5px #fff, -7vw 115vh 5px 1px #fff, 65vw 77vh 8px 3px #fff, -35vw 83vh 6px 4px #fff, 41vw 126vh 8px 3px #fff, -93vw 138vh 7px 4px #fff, 97vw 137vh 8px 1px #fff, -36vw 81vh 8px 5px #fff, 3vw 67vh 2px 3px #fff, -5vw 51vh 2px 1px #fff, 60vw 128vh 2px 4px #fff, -20vw 90vh 8px 5px #fff, 69vw 89vh 6px 1px #fff, -18vw 87vh 5px 5px #fff, 98vw 123vh 8px 5px #fff, -95vw 62vh 6px 1px #fff, 76vw 52vh 5px 3px #fff, -29vw 136vh 6px 5px #fff, 36vw 69vh 3px 2px #fff, -67vw 126vh 5px 3px #fff, 81vw 89vh 6px 2px #fff, -10vw 126vh 1px 2px #fff, 61vw 108vh 2px 2px #fff, -20vw 99vh 1px 1px #fff;
}
}

.snow__item {
  position: absolute;
    width: 5px;
    height: 5px;
    margin: auto;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    border-radius: 50%;
    -webkit-animation: snow 10000ms linear infinite;
    animation: snow 10000ms linear infinite;
}
</style>
</head>
<body>
<div class="snow__item"></div>
<div class="top" id="header">
	<img alt="${com.companyName}" src="../images/${logo }" class="logo">
	
	<span class="title">${com.companyName}</span>
	
	<img class="bookmark" alt="즐겨찾기" src="https://png.icons8.com/small/540/bookmark.png">
</div>

<%-- <div class="summary">
	<div class="sumtitle">
		<div>회사 유형</div>
		<hr>
		<div>${com.companyType}</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>사업 내용</div>
		<hr>
		<div>${com.businessContent }</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>사원 수</div>
		<hr>
		<div>${com.employeeCount}</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>전화번호</div>
		<hr>
		<div>${com.telNumber }</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>회사 규모</div>
		<hr>
		<div>대기업</div>
	</div>
</div> --%>

<div class="sum">
	<div class="sumtitle">
		<div>회사 유형</div>
		<hr>
		<div>${com.companyType}</div>
	</div>
	<div class="sumtitle">
		<div>사업 내용</div>
		<hr>
		<div>${com.businessContent }</div>
	</div>
	<div class="sumtitle">
		<div>사원 수</div>
		<hr>
		<div>${com.employeeCount}</div>
	</div>
	<div class="sumtitle">
		<div>전화번호</div>
		<hr>
		<div>${com.telNumber }</div>
	</div>
	<div class="sumtitle">
		<div>회사 규모</div>
		<hr>
		<div>대기업</div>
	</div>
</div>

<div class="chart">
	<div class="graphTop">
		<div class="graph1" name="graph"></div>
		<div class="graph2" name="graph"></div>
		<div class="graph3" name="graph"></div>
		<div class="graphText">회사와 적성이 맞을 것으로 예상 됩니다.</div>
	</div>
	<div class="graphName">
		<span>그래프 1</span>
		<span>그래프 2</span>
		<span>그래프 3</span>
	</div>
</div>


<div class="recruitList">
	<div class="prev"><img src="https://i.imgur.com/oLfh9Tj.png"></div>
	<c:forEach begin="0" end="5" var="i">
		<div class="recruit" 
		<c:if test="${i >= 3 }">
			style="display: none;"
		</c:if>
		>
			<div class="recTitle">${i }년 신입 및 경력사원 모집</div>
			<div class="recContent">
				<div>연봉 | 1만원</div>
				<div>지역 | 서울 외</div>
			</div>
			<div class="recContent">
				<div>필요 | JSP 외</div>
				<div>업종 | 기술</div>
			</div>
			<div class="recDate">
				<div>12/19~12/22</div>
			</div>
		</div>
	</c:forEach>
	<div class="next"><img src="https://i.imgur.com/XQJb8Kq.png"></div>
</div>

<div class="detail">
	<div>
		<span class="detailTitle">기업명</span>
		<span>NHN</span>
	</div>
	
	<div>
		<span class="detailTitle">대표자명</span>
		<span>아무개</span>
	</div>
	
	<div>
		<span class="detailTitle">업종</span>
		<span>IT</span>
	</div>
	
	<div>
		<span class="detailTitle">사업형태</span>
		<span>광고</span>
	</div>
	
	<div>
		<span class="detailTitle">설립일</span>
		<span>2006년</span>
	</div>
</div>

<div class="comment">
	<div class="commentTitle">회사 후기</div>
	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <span class="input-group-addon">
	      	<img src="https://i.imgur.com/5MJKaCv.png" width="15" class="heart">
	      </span>
	      <input type="text" class="form-control" aria-label="...">
	      <span class="input-group-addon">
    		<a>제출</a>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
  	</div>
  	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <span class="regDate">
	      	17/12/27
	      </span>
	      <span class="content">
	      	blah blah blah blah blah blah blah blah blah blah
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
  	</div>
</div>

<script type="text/javascript">
	function resize() {
		var chk = false;
		if ($(window).width() < $(window).height()) {
			$(".summary").width($(window).width());
			$(".top").css({"width": "95%", "margin": "2.5%"});
			$(".logo").width("8.0vh");
			$(".bookmark").css({"width": "3.3vh", "background-size": $(".bookmark").width()});
			$(".sumtitle > *").css({"font-size": "200%"});
			chk = true;
		} else {
			chk = false;
			$(".top").css({"width": "50vw", "margin": ""});
			$(".top").css({"margin-left": ($(window).width()-$(".top").width())/2+'px'});
			$(".logo").width("");
			$(".bookmark").width("");
			$(".sumtitle > *").css({"font-size": "100%"});
			$(".summary").width("");
		}
		//$(".chart").css({"margin-left": ($(window).width()-$(".chart").width())/2+'px'});
		$(".graphText").css({"margin-top": ($(".graphTop").height()-$(".graphText").height())/2+'px'});
		for (var i = 0; i < $('.graphTop > div[name="graph"]').length; i++) {
			var margin = ($(".graphName > span:eq("+i+")").width()-$(".graphTop > div:eq("+i+")").width())/2+"px";
			$(".graphTop > div:eq("+i+")").css({"margin-left": margin, "margin-right": margin});
		}
		$(".top > .title").css({"margin-left": ($(".top").width()-$(".top > .title").width())/2-$(".top > .logo").width()+'px'});
		//$(".sumtitle").width($(".summary").width()/$(".sumtitle").length-$(".sumtitle").length);
		$(".vr").height($(".summary").height()+"px");
		//if (!chk) $(".summary").css({"margin-left": ($(window).width()-$(".summary").width())/2+'px'});
		//else $(".summary").css({"margin-left": ""});
	}

	resize();

	$(window).resize(function() {
		resize();
	});

	$(".top > .bookmark").on("click", function () {
		if (confirm("즐겨찾기에 추가합니다.")) {
			
		} else {
			
		}
	});

	var d;
	
	$("div[name='graph']").hover(function (e) {
		d = $("<div>").css({"top": e.pageY, "left": e.clientX}).text(($(this).height()/$(this).parent().height()*100).toPrecision(3)+"%").addClass("hover");
		$(this).after(d);
	}, function () {
		$(".hover").animate({"opacity": 0}, 700, function () {
			$(this).remove();
		});
	});
	
	var reIndex = 0;
	var reMaxIndex = $(".recruit").length-3;
	
	$(".prev").click(function () {
		if (reIndex <= 0) return;
		reIndex--;
		$(".recruit:eq("+reIndex+")").css({"display": ""}, 200);
		$(".recruit:eq("+(reIndex+3)+")").css({"display": "none"}, 200);
	});
	
	$(".next").click(function () {
		if (reIndex >= reMaxIndex) return;
		$(".recruit:eq("+(reIndex+3)+")").css({"display": ""});
		$(".recruit:eq("+reIndex+")").css({"display": "none"});
		reIndex++;
	});
	
	$(".heart").click(function () {
		console.log("sasada")
		$(this).toggleClass("selected"/* , 500, "linear" */);
	});

</script>
</body>
</html>