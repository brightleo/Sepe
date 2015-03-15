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
    <form id="order_edit_form" class="form-horizontal">
        <div class="css-form-header">
            <h3><f:message key="order.edit_order"/></h3>
        </div>
        <div id="sepetabs">
	        <ul> 
			    <li><a href="#tabs1"><f:message key="order.tabs.base"/></a></li> 
			    <li><a href="#tabs2"><f:message key="order.tabs.shipment_billing"/></a></li> 
			    <li><a href="#tabs3"><f:message key="order.tabs.tosection"/></a></li> 
		  	</ul>
		  	<div id="tabs1">
		        <div class="form-group">
		            <label for="code"><f:message key="order.code"/><span class="css-color-red">*</span>:</label>
		            <div>
		            	<input type="text" id="code" name="code" value="${order.code}" readonly class="css-readonly"/>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="name"><f:message key="order.name"/><span class="css-color-red">*</span>:</label>
		            <div>
		            	<input type="text" id="name" name="name" value="${order.name}" class="ext-required">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="productType"><f:message key="order.product_type"/>:</label>
		            <div>
			            <select id="productType" name="productTypeId" data-toggle="select" class="form-control select select-default">
			                <c:forEach var="productType" items="${productTypeList}">
			                    <c:set var="displayName" value='${productType.parentname} - ${productType.name}'  />
			                    <option value="${productType.id}" ${order.subProductType == productType.name ? 'selected' : ''}>${displayName}</option>
			                </c:forEach>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="customer"><f:message key="order.customer"/><span class="css-color-red">*</span>:</label>
		            <div>
			            <input type="text" id="customer" name="customer" value="${order.customer}" class="ext-required">
			            <input type="hidden" id="customerNames" name="customerNames" value='${customerNames}' />
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="customerOrderid"><f:message key="order.customerOrderid"/><span class="css-color-red">*</span>:</label>
		            <div>
		            	<input type="text" id="customerOrderid" name="customerOrderid" value="${order.customerOrderid}" class="ext-required">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="salesman"><f:message key="order.salesman"/>:</label>
		            <div>
			            <select id="salesman" name="salesman" data-toggle="select" class="form-control select select-default">
			                <c:forEach var="salesmanInfo" items="${salesmanList}">
			                    <option value="${salesmanInfo.name}" ${order.salesman == salesmanInfo.name ? 'selected' : ''}>${salesmanInfo.name}</option>
			                </c:forEach>
			            </select>		            	
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="orderamount"><f:message key="order.orderamount"/>:</label>
		            <div>
		            	<input type="text" id="orderamount" name="orderamount" value="${order.orderamount}"/>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="orderdate"><f:message key="order.orderdate"/>:</label>
		            <div>
		            	<input type="text" id="orderdate" name="orderdate" value="${order.orderdate}"  readonly="true" class="sepe-date css-readonly">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="deliverydate"><f:message key="order.deliverydate"/>:</label>
		            <div>
		            	<input type="text" id="deliverydate" name="deliverydate" value="${order.deliverydate}" readonly="true" class="sepe-date css-readonly"/>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="status"><f:message key="order.status"/>:</label>
		            <div>
		            	<label class="radio" for="status1">
		            		<tag:status index="1" value="${order.status}" /><f:message key="order.status1"/>
		            	</label>
		            	<label class="radio" for="status2">
		            		<tag:status index="2" value="${order.status}" /><f:message key="order.status2"/>
		            	</label>
		            	<label class="radio" for="status3">
		            		<tag:status index="3" value="${order.status}" /><f:message key="order.status3"/>
		            	</label>
		            	<label class="radio" for="status0">
		            		<tag:status index="0" value="${order.status}" /><f:message key="order.status0"/>
		            	</label>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="comment"><f:message key="order.comment"/>:</label>
		            <div>
		            	<textarea id="comment" name="comment"  rows="5">${order.comment}</textarea>
		            </div>
		        </div>
		  	</div>
			<div id="tabs2">
				<button type="button" id="add"><f:message key="common.add"/></button>
				<table id="forCopyTable" style="display:none">
					<tr>
			            <td><input type="text" id="shipmentcode" name="shipmentcode" /></td>
			            <td><input type="text" id="shipmentdate" name="shipmentdate" readonly="true" class="sepe-date css-readonly"/></td>
			            <td><input type="text" id="productName" name="productName" /></td>
			            <td><input type="text" id="quantity" name="quantity" /></td>
			            <td><input type="text" id="unitprice" name="unitprice" /></td>
			            <td><input type="text" id="billingcode" name="billingcode"  /></td>
			            <td><input type="text" id="billingdate" name="billingdate"  readonly="true" class="sepe-date css-readonly"/></td>
			            <td><input type="text" id="billingProductName" name="billingProductName"  /></td>
			            <td><input type="text" id="billingQuantity" name="billingQuantity"  /></td>
			            <td><input type="text" id="billingUnitprice" name="billingUnitprice"  /></td>
			            <td><button type="button" id="delete"><f:message key="common.delete"/></button></td>
			        </tr>
				</table>
				<div class="tab tab-size-small sepe-table">
					<table id="subordertable" class="footable default footable-loaded">
					    <thead>
					        <tr>
					            <th><f:message key="order.shipmentcode"/></th>
					        	<th><f:message key="order.shipmentdate"/></th>
					        	<th><f:message key="order.productName"/></th>
					        	<th><f:message key="order.quantity"/></th>
					        	<th><f:message key="order.unitprice"/></th>
					            <th><f:message key="order.billingcode"/></th>
					            <th><f:message key="order.billingdate"/></th>
					            <th><f:message key="order.billingProductName"/></th>
					            <th><f:message key="order.billingQuantity"/></th>
					            <th><f:message key="order.billingUnitprice"/></th>
					           	<th><f:message key="common.action"/></td>
					        </tr>
					    </thead>
					    <tbody>
					     <c:forEach var="subOrder" items="${orderBean.subOrderList}" varStatus="status" >
							<tr id="${status.index}">
					            <td><input type="text" id="shipmentcode${status.index}" name="shipmentcode${status.index}" value="${subOrder.shipmentcode}" /></td>
					            <td><input type="text" id="shipmentdate${status.index}" name="shipmentdate${status.index}" value="${subOrder.shipmentdate}" class="sepe-date css-readonly" readonly="true" /></td>
					            <td><input type="text" id="productName${status.index}" name="productName${status.index}" value="${subOrder.productName}" /></td>
					            <td><input type="text" id="quantity${status.index}" name="quantity${status.index}" value="${subOrder.quantity}" /></td>
					            <td><input type="text" id="unitprice${status.index}" name="unitprice${status.index}" value="${subOrder.unitprice}" /></td>
					            <td><input type="text" id="billingcode${status.index}" name="billingcode${status.index}"  value="${subOrder.billingcode}"/></td>
					            <td><input type="text" id="billingdate${status.index}" name="billingdate${status.index}"  value="${subOrder.billingdate}" class="sepe-date css-readonly" readonly="true" /></td>
					            <td><input type="text" id="billingProductName${status.index}" name="billingProductName${status.index}"  value="${subOrder.billingProductName}"/></td>
					            <td><input type="text" id="billingQuantity${status.index}" name="billingQuantity${status.index}"  value="${subOrder.billingQuantity}"/></td>
					            <td><input type="text" id="billingUnitprice${status.index}" name="billingUnitprice${status.index}"  value="${subOrder.billingUnitprice}"/></td>
					            <td><button type="button" id="delete${status.index}"><f:message key="common.delete"/></button></td>
					        </tr>
	                     </c:forEach>
					    </tbody>
					</table>
				</div>
				<input type="hidden" id="shipmentamount" name="shipmentamount" value="${order.shipmentamount}" />
				<input type="hidden" id="billingamount" name="billingamount" value="${order.billingamount}" />
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
				<button type="button" id="addfortab3"><f:message key="common.add"/></button>
				<table id="forCopyTableFortab3" style="display:none">
					<tr>
			            <td><input type="text" id="tosectionDate" name="tosectiondate" readonly="true" class="sepe-date css-readonly"/></td>
			            <td><input type="text" id="tosectionAmount" name="tosectionAmount" /></td>
			            <td><input type="text" id="tosectionComment" name="tosectionComment" /></td>
			            <td><button type="button" id="deleteFortab3"><f:message key="common.delete"/></button></td>
			        </tr>
				</table>
				<div class="tab sepe-table">
					<table id="tosectiontable" class="footable default footable-loaded">
					    <thead>
					        <tr>
					            <th><f:message key="order.tosectionDate"/></th>
					        	<th><f:message key="order.tosectionAmount"/></th>
					        	<th><f:message key="order.tosectionComment"/></th>
					           	<th><f:message key="common.action"/></th>
					        </tr>
					    </thead>
					    <tbody>
					    	<c:forEach var="tosection" items="${orderBean.tosectionList}" varStatus="status" >
								<tr id="${status.index}">
					            	<td><input type="text" id="tosectiondate${status.index}" name="tosectiondate${status.index}" value="${tosection.tosectiondate}" class="sepe-date css-readonly" readonly="true" /></td>
					            	<td><input type="text" id="tosectionAmount${status.index}" name="tosectionAmount${status.index}" value="${tosection.tosectionAmount}" /></td>
					            	<td><input type="text" id="tosectionComment${status.index}" name="tosectionComment${status.index}" value="${tosection.tosectionComment}" /></td>
					            	<td><button type="button" id="delete${status.index}"><f:message key="common.delete"/></button></td>
					        	 </tr>
					         </c:forEach>
					    </tbody>
					</table>		
				</div>
				<input type="hidden" id="tosectionamount" name="tosectionamount" value="${order.tosectionamount}"/>
				<table style="width:100%">
					<tr >
						<td>
							<f:message key="order.counttosectionamount"/><span id="counttosectionamount">${order.tosectionamount == null ? '0' : order.tosectionamount}</span><f:message key="common.yuan"/>
						</td>
					</tr>
				</table>
        	</div>
	        <div class="form-group">
	          <div class="col-lg-offset-2 col-lg-10">
	            <button type="submit" class="btn btn-default"><f:message key="common.save"/></button>
	            <button type="button" id="back" class="btn btn-default"><f:message key="common.back"/></button>
	          </div>
	        </div>
	    </div>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>
<link rel="stylesheet" href="${BASE}/www/lib/jquery-ui/css/smoothness/jquery-ui-1.10.4.custom.min.css"">
<script type="text/javascript" src="${BASE}/www/lib/jquery-ui/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/order_edit.js"></script>
</body>
</html>