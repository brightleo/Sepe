<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="salesman"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
    <form id="salesman_form" class="form-horizontal">
        <div class="css-form-header">
            <h3><f:message key="salesman.list"/></h3>
        </div>
		<div id="tabs3" class="form-group">
			<table id="forCopyTable" style="display:none">
				<tr>
		            <td><input type="hidden" id="id" name="id" /></td>
		            <td><input type="text" id="name" name="name" class="form-control"/></td>
		        </tr>
			</table>
			<table id="salesmantable" class="footable default footable-loaded">
			    <thead>
			        <tr>
			            <th style="width:80px"><f:message key="salesman.id"/></th>
			        	<th><f:message key="salesman.username"/></th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="salesman" items="${salesmanList}" varStatus="status" >
						<tr id='${salesman.id}'>
			            	<td><input type="hidden" id="id${status.index}" name="id${status.index}" value="${salesman.id}" />${salesman.id}</td>
			            	<td><input type="text" id="name${status.index}" name="name${status.index}" value="${salesman.name}" class="ext-required form-control"/></td>
			        	 </tr>
			         </c:forEach>
			    </tbody>
			</table>
		</div>
		<div class="form-group">
            <security:hasPermission name="order.edit">
            	<button type="button" id="add" class="btn btn-default"><f:message key="common.add"/></button>
                <button type="submit" class="btn btn-default"><f:message key="common.save"/></button>
            </security:hasPermission>
        </div>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>
<script type="text/javascript" src="${BASE}/www/js/salesman.js"></script>
</body>
</html>