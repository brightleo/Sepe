<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="order.chart"/></title>
    <%@ include file="common/style.jsp" %>
<%@ include file="common/script.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
	<form id="order_chart_form" class="css-form">
        <div class="css-form-header">
            <h3><f:message key="order.chart"/></h3>
        </div>
		<div class="css-form-row">
			<label for="chartType"><f:message key="order.chart.type"/>:</label>
		    <select id="chartType" name="chartType">
		     	<option value="1"><f:message key="order.chart.type.pie"/></option>
		     	<option value="2"><f:message key="order.chart.type.bar"/></option>
		     	<option value="3"><f:message key="order.chart.type.line"/></option>
		    </select>
		</div>
		<div class="css-form-row">
		<label><f:message key="order.chart.filter"/>:</label>
		  <span>
		  	<input type="radio" id="chart_time_y" name="chart_time" value="0" checked/><f:message key="order.chart.type.y"/>
		  </span>
		  <span id="c_month">
		  	<input type="radio" id="chart_time_m" name="chart_time" value="1" /><f:message key="order.chart.type.m"/>
		  </span>
		  <span>
			  <select id="chartTypeYear" name="chartTypeYear"></select><f:message key="order.chart.year"/>
		  </span>
		  <span id="c_month_s">
		  	<select id="chartTypeM" name="chartTypeM"></select><f:message key="order.chart.month"/>
		  </span>
		  <span id="c_amount" style="display:none;">
		  	<input type="radio" id="amount_type_o" name="amount_type" value="0" checked/><f:message key="order.chart.type.bar.order"/>
		  	<input type="radio" id="amount_type_b" name="amount_type" value="1" /><f:message key="order.chart.type.bar.billing"/>
		  </span>
		  <span id="c_salesman" style="display:none;margin-left:15px">
			  <f:message key="order.salesman"/>:
			  <select id="salesman" name="salesman">
			  	<c:forEach var="salesmanInfo" items="${salesmanList}">
			    	<option value="${salesmanInfo.name}">${salesmanInfo.name}</option>
			    </c:forEach>
			  </select>
		  </span>
		  <button id="doChart"><f:message key="order.chart.do"/></button>
		</div>
        <div id="orderChart" style="height:600px; width:800px;"></div>
	</form>
</div>
<link rel="stylesheet" href="${BASE}/www/lib/jqplot/css/jquery.jqplot.min.css">
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.dateAxisRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/lib/jqplot/jqplot.donutRenderer.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/order_chart.js"></script>
</body>
</html>