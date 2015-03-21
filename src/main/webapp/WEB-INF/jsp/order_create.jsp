<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="order"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
    <form id="order_create_form" enctype="multipart/form-data" class="form-horizontal">
        <div class="css-form-header">
            <h6><f:message key="order.create_order"/></h6>
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
		            	<input type="text" id="code" name="code" class="ext-required">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="name"><f:message key="order.name"/><span class="css-color-red">*</span>:</label>
		            <div>
		            	<input type="text" id="name" name="name" class="ext-required">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="productType"><f:message key="order.product_type"/>:</label>
		            <div>
			            <select id="productType" name="productTypeId" data-toggle="select" class="form-control select select-default">
	                        <c:forEach var="productType" items="${productTypeList}">
	                            <c:set var="displayName" value='${productType.parentname} - ${productType.name}'  />
	                            <option value="${productType.id}">${displayName}</option>
	                        </c:forEach>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="customer"><f:message key="order.customer"/><span class="css-color-red">*</span>:</label>
		            <div>
		            	<input type="text" id="customer" name="customer" maxlength="20" class="ext-required">
		            </div>
		            <input type="hidden" id="customerNames" name="customerNames" value='${customerNames}' />
		        </div>
		        <div class="form-group">
		            <label for="customerOrderid"><f:message key="order.customerOrderid"/></span>:</label>
		            <div>
		            	<input type="text" id="customerOrderid" name="customerOrderid">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="salesman"><f:message key="order.salesman"/>:</label>
		            <div>
			            <select id="salesman" name="salesman" data-toggle="select" class="form-control select select-default">
			                <c:forEach var="salesmanInfo" items="${salesmanList}">
			                    <option value="${salesmanInfo.name}">${salesmanInfo.name}</option>
			                </c:forEach>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="orderamount"><f:message key="order.orderamount"/>:</label>
		            <div>
		            	<input type="text" id="orderamount" name="orderamount" />
		            </div>
		        </div>
		       
		        <div class="form-group">
		            <label for="orderdate"><f:message key="order.orderdate"/>:</label>
		            <div>
		            	<input type="text" id="orderdate" name="orderdate" class="sepe-date css-readonly" >
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="deliverydate"><f:message key="order.deliverydate"/>:</label>
		            <div>
		            	<input type="text" id="deliverydate" name="deliverydate" class="sepe-date css-readonly" >
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="orderQuantity"><f:message key="order.orderQuantity"/>:</label>
		            <div>
		            	<input type="text" id="orderQuantity" name="orderQuantity">
		            </div>
		        </div>
		        <div class="form-group">
		            <label for="status"><f:message key="order.status"/>:</label>
		            <div>
		            	<label class="radio" for="status1">
		            		<tag:status index="1" value="1" /><f:message key="order.status1"/>
		            	</label>
		            	<label class="radio" for="status2">
		            		<tag:status index="2" value="1" /><f:message key="order.status2"/>
		            	</label>
		            	<label class="radio" for="status3">
		            		<tag:status index="3" value="1" /><f:message key="order.status3"/>
		            	</label>
		            	<label class="radio" for="status0">
		            		<tag:status index="0" value="1" /><f:message key="order.status0"/>
		            	</label>
		            </div>

		        </div>
		        <div class="form-group">
		            <label for="comment"><f:message key="order.comment"/>:</label>
		            <div>
		            	<textarea id="comment" name="comment" rows="5"></textarea>
		            </div>
		        </div>
		  	</div>
			<div id="tabs2">
				<button type="button" id="add" class="btn btn-default btn-xs css-right sepe-btn"><f:message key="common.add"/></button>
				<div class="tab tab-size-small sepe-table">
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
				            <td><a href="#" id="delete"><span class="fui-cross"></span></a></td>
				        </tr>
					</table>
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
					           	<th></th>
					        </tr>
					    </thead>
					    <tbody>
					    </tbody>
					</table>
				</div>
				<input type="hidden" id="shipmentamount" name="shipmentamount" value="0" />
				<input type="hidden" id="billingamount" name="billingamount" value="0"/>
				<table style="width:100%">
					<tr >
						<td style="width:50%">
							<f:message key="order.countshipmentamount"/><span id="countshipmentamount">0</span><f:message key="common.yuan"/>
						</td>
						<td>
							<f:message key="order.countbillingamount"/><span id="countbillingamount">0</span><f:message key="common.yuan"/>
						</td>
					</tr>
				</table>
			</div>
			<div id="tabs3">
				<button type="button" id="addfortab3" class="btn btn-default btn-xs css-right sepe-btn"><f:message key="common.add"/></button>
				<table id="forCopyTableFortab3" style="display:none">
				<tr>
			            <td><input type="text" id="tosectionDate" name="tosectiondate" readonly="true" class="sepe-date css-readonly"/></td>
			            <td><input type="text" id="tosectionAmount" name="tosectionAmount" /></td>
			            <td><input type="text" id="tosectionComment" name="tosectionComment" /></td>
			            <td><a href="#" id="deleteFortab3"><span class="fui-cross"></span></a></td>
			        </tr>
				</table>
				<div class="tab sepe-table">
					<table id="tosectiontable"class="footable default footable-loaded">
					    <thead>
					        <tr>
					            <th><f:message key="order.tosectionDate"/></th>
					        	<th><f:message key="order.tosectionAmount"/></th>
					        	<th><f:message key="order.tosectionComment"/></th>
					           	<th></th>
					        </tr>
					    </thead>
					    <tbody>
					    </tbody>
					</table>
				</div>
					<input type="hidden" id="tosectionamount" name="tosectionamount" value="0"/>
					<table style="width:100%">
						<tr >
							<td>
								<f:message key="order.counttosectionamount"/><span id="counttosectionamount">0</span><f:message key="common.yuan"/>
							</td>
						</tr>
					</table>
			</div>
	        <div class="form-group">
	          <div class="col-lg-offset-2 col-lg-10 ">
	            <button type="button" id="back" class="btn btn-default css-right sepe-btn"><f:message key="common.back"/></button>
	            <button type="submit" class="btn btn-default css-right sepe-btn"><f:message key="common.save"/></button>
	          </div>
	        </div>
        </div>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>
<link rel="stylesheet" href="${BASE}/www/lib/jquery-ui/css/smoothness/jquery-ui-1.10.4.custom.min.css">
<script type="text/javascript" src="${BASE}/www/lib/jquery-ui/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/order_create.js"></script>
</body>
</html>