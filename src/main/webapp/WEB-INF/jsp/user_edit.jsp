<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="user"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<c:set var="user" value="${userBean.user}"/>
<c:set var="userRoleList" value="${userBean.roleList}"/>

<input type="hidden" id="id" value="${user.id}">
<div class="container">
<%@ include file="common/header.jsp" %>
    <form id="user_edit_form" class="form-horizontal">
        <div class="css-form-header">
            <h3><f:message key="user.edit_user"/></h3>
        </div>
        <div class="form-group">
            <label for="username"><f:message key="user.username"/>:</label>
            <div>
                <div class="input-group">
                  <span class="input-group-addon">@</span>
                  <input type="text" id="username" value="${user.username}" class="css-readonly" readonly>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="password"><f:message key="user.password"/>:</label>
            <div>
                <input type="text" id="password" name="password">
            </div>
        </div>
        <div class="form-group">
            <label><f:message key="user.role"/>:</label>
            <div>
                <tag:role roleList="${roleList}" userRoleList="${userRoleList}"/>
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

<script type="text/javascript" src="${BASE}/www/js/user_edit.js"></script>

</body>
</html>