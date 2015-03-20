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
	<form id="order_chart_form" class="form-horizontal">
        <div class="css-form-header">
            <h3><f:message key="order.chart"/></h3>
        </div>
		<div class="form-group">
			<label for="chartType"><f:message key="order.chart.type"/>:</label>
			<div class="col-xs-3">
		    	<select id="chartType" name="chartType" data-toggle="select" class="form-control select select-default">
			     	<option value="1"><f:message key="order.chart.type.pie"/></option>
			     	<option value="2"><f:message key="order.chart.type.bar"/></option>
			     	<option value="3"><f:message key="order.chart.type.line"/></option>
			    </select>
			</div>
		</div>
		<div class="form-group">
			<label><f:message key="order.chart.filter"/>:</label>
			<div class="row">
				<div class="col-xs-3">
					<label id="c_year" for="chart_time_y" class="radio">
						<input type="radio" id="chart_time_y" name="chart_time" value="0" data-toggle="radio" checked/><f:message key="order.chart.type.y"/>
					</label>
					<label id="c_month" for="chart_time_m" class="radio">
						<input type="radio" id="chart_time_m" name="chart_time" value="1" data-toggle="radio"/><f:message key="order.chart.type.m"/>
					</label>
				</div>
				<div class="col-xs-4">
					<select id="chartTypeYear" name="chartTypeYear" class="form-control sepe css-width-100 select select-default"></select><span class="time-padding"><f:message key="order.chart.year"/></span>
					<label id="c_month_s">
					<select id="chartTypeM" name="chartTypeM"   class="form-control sepe css-width-75 select select-default"></select><span class="time-padding"><f:message key="order.chart.month"/></span>
					</label>
				</div>
				<div id="c_amount" style="display:none;" class="col-xs-3">
				  	<label for="amount_type_o" class="radio">
				  		<input type="radio" id="amount_type_o" name="amount_type" data-toggle="radio" value="0" checked/><f:message key="order.chart.type.bar.order"/>
				  	</label>
				  	<label for="amount_type_b" class="radio">
				  		<input type="radio" id="amount_type_b" name="amount_type" data-toggle="radio" value="1" /><f:message key="order.chart.type.bar.billing"/>
				  	</label>
				</div>
			  <div id="c_salesman" style="display:none;" class="col-xs-5">
			  	<label><f:message key="order.salesman"/>:</label>
				  <select id="salesman" name="salesman" data-toggle="select" class="form-control sepe css-width-200 select select-default">
				  	<c:forEach var="salesmanInfo" items="${salesmanList}">
				    	<option value="${salesmanInfo.name}">${salesmanInfo.name}</option>
				    </c:forEach>
				  </select>
			  </div>
			</div>
		</div>
		<div class="form-group css-right">
			<button id="doChart" class="btn"><f:message key="order.chart.do"/></button>
		</div>
        <div id="orderChart" class="sepe-chart"></div>
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