<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="login"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<security:user>
    <c:redirect context="/${BASE}" url="/orders"/>
</security:user>
<div class="sepe-login container">
  <div class="login">
    <div class="login-screen">
      <div class="login-icon">
        <img src="img/login/icon.png" alt="Welcome to Mail App" />
        <h4><small>销售管理</small></h4>
      </div>

      <div class="login-form">
        <form id="login_form">
          <div class="form-group">
            <input type="text" class="form-control login-field" value="admin" name="username" id="username" placeholder="Enter your name" />
            <label class="login-field-icon fui-user" for="username"></label>
          </div>
          <div class="form-group">
            <input type="password" class="form-control login-field" value="admin" id="password" name="password" placeholder="Password"/>
            <label class="login-field-icon fui-lock" for="password"></label>
          </div>
          <a class="btn btn-primary btn-lg btn-block" id="loginBtn"><f:message key="login"/></a>
        </form>
      </div>
    </div>
  </div>
</div>
<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>

<script type="text/javascript" src="${BASE}/www/js/login.js"></script>

</body>
</html>