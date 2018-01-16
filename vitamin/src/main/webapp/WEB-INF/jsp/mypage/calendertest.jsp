<!doctype html>

<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>Basic initialization</title>

	<script>
		(function (i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
			(i[r].q = i[r].q || []).push(arguments)		
}, i[r].l = 1 * new Date(); a = s.createElement(o),
			m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
		})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-11031269-1', 'auto');
		ga('send', 'pageview');
	</script>
	<script src="https://cdn.ravenjs.com/3.10.0/raven.min.js"></script>
	<script>Raven.config('https://b506cc95e6244203a69070d518196d06@sentry.dhtmlx.ru/7').install()</script>
</head>
<script src="../../css/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../../css/dhtmlxscheduler.css" type="text/css" charset="utf-8">


<style type="text/css">
	html,
	body {
		margin: 0px;
		padding: 0px;
		height: 100%;
		overflow: hidden;
	}
</style>

<script type="text/javascript" charset="utf-8">
	function init() {
		scheduler.config.xml_date = "%Y-%m-%d %H:%i";
		scheduler.init('scheduler_here', new Date(2018, 0, 1), "week");
		scheduler.load("./data/events.xml");

	}
</script>

<body onload="init();">
	<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>
	</div>
</body>