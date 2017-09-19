<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mood of the year</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script language="JavaScript">
	function displayLineChart() {
	
		var data = {
			labels : [ "${LabelMonth1}", "${LabelMonth2}","${LabelMonth3}","${LabelMonth4}","${LabelMonth5}","${LabelMonth6}","${LabelMonth7}","${LabelMonth8}","${LabelMonth9}","${LabelMonth10}","${LabelMonth11}","${LabelMonth12}" ],
			datasets : [{
				label : "Rate of the year",
				fillColor : "rgba(151,187,205,0)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(151,187,205,1)",
				data : [ ${RateMonth1}, ${RateMonth2},${RateMonth3},${RateMonth4},${RateMonth5},${RateMonth6},${RateMonth7},${RateMonth8},${RateMonth9},${RateMonth10},${RateMonth11},${RateMonth12} ]
				},{
	                label: "Your rates",
	                fillColor: "rgba(220,220,220,0)",
	                strokeColor: "rgba(220,220,220,1)",
	                pointColor: "rgba(220,220,220,1)",
	                pointStrokeColor: "#fff",
	                pointHighlightFill: "#fff",
	                pointHighlightStroke: "rgba(220,220,220,1)",
	                data: [ ${Rate2Month1}, ${Rate2Month2},${Rate2Month3},${Rate2Month4},${Rate2Month5},${Rate2Month6},${Rate2Month7},${Rate2Month8},${Rate2Month9},${Rate2Month10},${Rate2Month11},${Rate2Month12} ]
				}],
				
		};
		var options = {
		        animation: true,
			    scales: {
			        animation: true
			    }
			};
		
		var ctx = document.getElementById("lineChart").getContext("2d");
	    var lineChart = new Chart(ctx).Line(data, options);
	}
</script>
</head>
<%@include file="header.jsp"%>

<body onload="displayLineChart();">
<h1 style="text-align:center;">Rates over the last 12 months</h1>
	<div class="box">
		<canvas id="lineChart"
			style="height: 450px; width: 800px; padding-left: 0; padding-right: 0; margin-left: auto; margin-right: auto; display: block;"></canvas>
	</div> 
	</body>
<%@include file="footer.jsp"%>
</html>