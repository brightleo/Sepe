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

<div class="container">
<%@ include file="common/header.jsp" %>
    <div id="main">
        <div class="css-panel">
            <div class="css-panel-header">
                <h3><f:message key="user.user_list"/></h3>
            </div>
            <div class="css-panel-content">
                <div class="css-row">
                    <div class="css-left">
                        <form id="user_search_form" class="sepe-form navbar-form">
                            <div class="form-group sepe-search">
                                <div class = "input-group">
                                    <input type="text" name="username" class="form-control" type="search" placeholder="<f:message key="user.username"/>">
                                    <span class="input-group-btn">
                                      <button type="submit" id="search" class="btn"><span class="fui-search"></span></button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="css-right">
                        <a href="${BASE}/user"><f:message key="user.create_user"/></a>
                    </div>
                </div>
                <div id="user_list">
                    <%@ include file="user_list.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>

<script type="text/javascript" src="${BASE}/www/js/user.js"></script>

</body>
</html>