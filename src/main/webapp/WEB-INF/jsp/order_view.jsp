<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>

<c:set var="order" value="${orderBean.order}"/>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="order"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<input type="hidden" id="id" value="${order.id}">

<div class="container">
<%@ include file="common/header.jsp" %>
    <form class="css-form">
        <div class="css-form-header">
            <h3><f:message key="order.view_order"/></h3>
        </div>
        <div id="sepetabs">
	        <ul> 
			    <li><a href="#tabs1"><f:message key="order.tabs.base"/></a></li> 
			    <li><a href="#tabs2"><f:message key="order.tabs.shipment_billing"/></a></li> 
			    <li><a href="#tabs3"><f:message key="order.tabs.tosection"/></a></li> 
		  	</ul>
		  	<div id="tabs1">
		        <div class="css-form-row">
		            <label for="code"><f:message key="order.code"/>:</label>
		            <input type="text" id="code" name="code" value="${order.code}" class="css-readonly" readonly>
		            <span class="css-color-red">*</span>
		        </div>
		        <div class="css-form-row">
		            <label for="name"><f:message key="order.name"/>:</label>
		            <input type="text" id="name" name="name" value="${order.name}" class="css-readonly" readonly>
		            <span class="css-color-red">*</span>
		        </div>
		        <div class="css-form-row">
		            <label><f:message key="order.product_type"/>:</label>
		            <input type="text" id="productType" name="productType" class="css-readonly" value="${order.productType}-${order.subProductType}" readonly>
		        </div>
		        <div class="css-form-row">
		            <label for="customer"><f:message key="order.customer"/>:</label>
		            <input type="text" id="customer" name="customer" value="${order.customer}" class="css-readonly" readonly>
		        </div>
		        <div class="css-form-row">
		            <label for="customerOrderid"><f:message key="order.customerOrderid"/>:</label>
		            <input type="text" id="customerOrderid" name="customerOrderid" value="${order.customerOrderid}" class="css-readonly" readonly>
		        </div>
		        <div class="css-form-row">
		            <label for="salesman"><f:message key="order.salesman"/>:</label>
		            <input type="text" id="salesman" name="salesman" value="${order.salesman}" class="css-readonly" readonly>
		            <span class="css-color-red">*</span>
		        </div>
		        <div class="css-form-row">
		            <label for="orderamount"><f:message key="order.orderamount"/>:</label>
		            <input type="text" id="orderamount" name="orderamount" value="${order.orderamount}" class="css-readonly" readonly/>
		        </div>
		        <div class="css-form-row">
		            <label for="orderdate"><f:message key="order.orderdate"/>:</label>
		            <input type="text" id="orderdate" name="orderdate" value="${order.orderdate}" class="css-readonly" readonly />
		        </div>
		        <div class="css-form-row">
		            <label for="deliverydate"><f:message key="order.deliverydate"/>:</label>
		            <input type="text" id="deliverydate" name="deliverydate" value="${order.deliverydate}" class="css-readonly" readonly />
		        </div>
		        <div class="css-form-row">
		            <label for="comment"><f:message key="order.comment"/>:</label>
		            <span><f:message key="order.status${order.status}"/></span>
		        </div>
		        <div class="css-form-row">
		            <label for="comment"><f:message key="order.comment"/>:</label>
		            <textarea id="comment" name="comment" rows="5" class="css-readonly" readonly>${order.comment}</textarea>
		        </div>
		  	</div>
			<div id="tabs2">
				<table id="subordertable" class="footable default footable-loaded">
				    <thead>
				        <tr>
				            <td><f:message key="order.shipmentcode"/></td>
				        	<td><f:message key="order.shipmentdate"/></td>
				        	<td><f:message key="order.productName"/></td>
				        	<td><f:message key="order.quantity"/></td>
				        	<td><f:message key="order.unitprice"/></td>
				            <td><f:message key="order.billingcode"/></td>
				            <td><f:message key="order.billingdate"/></td>
				            <td><f:message key="order.invoicecode"/></td>
				            <td><f:message key="order.billingProductName"/></td>
				            <td><f:message key="order.billingQuantity"/></td>
				            <td><f:message key="order.billingUnitprice"/></td>
				        </tr>
				    </thead>
				    <tbody>
				     <c:forEach var="subOrder" items="${orderBean.subOrderList}" varStatus="status" >
						<tr>
				            <td><input type="text" id="shipmentcode${status.index}" name="shipmentcode${status.index}" value="${subOrder.shipmentcode}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="shipmentdate${status.index}" name="shipmentdate${status.index}" value="${subOrder.shipmentdate}" class="css-readonly" readonly/></td>
				            <td><input type="text" id="productName${status.index}" name="productName${status.index}" value="${subOrder.productName}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="quantity${status.index}" name="quantity${status.index}" value="${subOrder.quantity}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="unitprice${status.index}" name="unitprice${status.index}" value="${subOrder.unitprice}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="billingcode${status.index}" name="billingcode${status.index}"  value="${subOrder.billingcode}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="billingdate${status.index}" name="billingdate${status.index}"  value="${subOrder.billingdate}" class="css-readonly" readonly/></td>
				            <td><input type="text" id="invoicecode${status.index}" name="invoicecode${status.index}"  value="${subOrder.invoicecode}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="billingProductName${status.index}" name="billingProductName${status.index}"  value="${subOrder.billingProductName}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="billingQuantity${status.index}" name="billingQuantity${status.index}"  value="${subOrder.billingQuantity}" class="css-readonly" readonly /></td>
				            <td><input type="text" id="billingUnitprice${status.index}" name="billingUnitprice${status.index}"  value="${subOrder.billingUnitprice}" class="css-readonly" readonly/></td>
				        </tr>
                     </c:forEach>
				    </tbody>
				</table>
				<table style="width:100%">
					<tr >
						<td style="width:50%">
							<f:message key="order.countshipmentamount"/><span id="countshipmentamount">${order.shipmentamount == null ? '0' : order.shipmentamount}</span><f:message key="common.yuan"/>
						</td>
						<td>
							<f:message key="order.countbillingamount"/><span id="countbillingamount">${order.billingamount == null ? '0' : order.billingamount}</span><f:message key="common.yuan"/>
						</td>
					</tr>
				</table>
			</div>
			<div id="tabs3">
				<table id="tosectiontable" class="footable default footable-loaded">
				    <thead>
				        <tr>
				            <td><f:message key="order.tosectionDate"/></td>
				        	<td><f:message key="order.tosectionAmount"/></td>
				        	<td><f:message key="order.tosectionComment"/></td>
				        </tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tosection" items="${orderBean.tosectionList}" varStatus="status" >
							<tr>
				            	<td><input type="text" id="tosectiondate${status.index}" name="tosectiondate${status.index}" value="${tosection.tosectiondate}" class="css-readonly" readonly/></td>
				            	<td><input type="text" id="tosectionAmount${status.index}" name="tosectionAmount${status.index}" value="${tosection.tosectionAmount}" class="css-readonly" readonly/></td>
				            	<td><input type="text" id="tosectionComment${status.index}" name="tosectionComment${status.index}" value="${tosection.tosectionComment}" class="css-readonly" readonly/></td>
				        	 </tr>
				         </c:forEach>
				    </tbody>
				</table>
				<table style="width:100%">
					<tr >
						<td>
							<f:message key="order.counttosectionamount"/><span id="counttosectionamount">${order.tosectionamount == null ? '0' : order.tosectionamount}</span><f:message key="common.yuan"/>
						</td>
					</tr>
				</table>
			</div>
        </div>
        <div class="css-form-footer">
            <button type="button" id="back"><f:message key="common.back"/></button>
        </div>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>
<link rel="stylesheet" href="${BASE}/www/lib/jquery-ui/css/smoothness/jquery-ui-1.10.4.custom.min.css"">
<script type="text/javascript" src="${BASE}/www/lib/jquery-ui/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/order_view.js"></script>
<script type="text/javascript"> 
$(function() {
    $( "#sepetabs" ).tabs();
  })
</script>
</body>
</html>