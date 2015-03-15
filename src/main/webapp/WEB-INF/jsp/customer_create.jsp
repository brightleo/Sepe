<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="customer"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
    <form id="customer_create_form" class="form-horizontal">
        <div class="css-form-header">
            <h6><f:message key="customer.create_customer"/></h6>
        </div>
        <div class="form-group">
            <label for="id"><f:message key="customer.id"/>:</label>
            <div>
            	<input type="text" id="id" name="id" value="${id}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="name"><f:message key="customer.name"/>:</label>
            <div> 
            	<input type="text" id="name" name="name" class="ext-required">
            </div>
        </div>
        <div class="form-group">
            <label for="username"><f:message key="customer.username"/>:</label>
            <div>
            	<input type="text" id="username" name="username">
            </div>
        </div>
        <div class="form-group">
            <label for="usertel"><f:message key="customer.usertel"/>:</label>
            <div>
            	<input type="text" id="usertel" name="usertel">
            </div>
            
        </div>
        <div class="form-group">
            <label for="comment"><f:message key="customer.comment"/>:</label>
            <div>
            	<textarea id="comment" name="comment" rows="5"></textarea>
            </div>
        </div>
		<div class="form-group">
          <div class="col-lg-offset-2 col-lg-10">
            <button type="submit" class="btn btn-default"><f:message key="common.save"/></button>
            <button type="button" id="back" class="btn btn-default"><f:message key="common.back"/></button>
          </div>
        </div>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>

<script type="text/javascript" src="${BASE}/www/js/customer_create.js"></script>

</body>
</html>