<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="order"/></title>
    <%@ include file="common/style.jsp" %>
    <%@ include file="common/script.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
    <div id="main">
        <div class="css-panel">
            <div class="css-panel-header">
                <h3><f:message key="order.order_list"/></h3>
            </div>
            <div class="css-panel-content">
                <div class="css-row">
                    <div class="css-left">
                        <form id="order_search_form" class="sepe-form navbar-form">
                            <div class="form-group sepe-search">
                                <div class = "input-group">
                                    <input class="form-control" name="name" type="search" placeholder="<f:message key="common.search.fileds"/>">
                                    <span class="input-group-btn">
                                      <button type="submit" id="search" class="btn"><span class="fui-search"></span></button>
                                    </span>
                                </div>
                                <input type="hidden" id="orderby" name="orderby" value="desc"/>
                                <input type="hidden" id="status" name="status" value=""/>
                            </div>
                        </form>
                    </div>
                    <div class="css-right">
                        <security:hasPermission name="order.create">
                            <a href="${BASE}/order/create"><f:message key="order.create_order"/></a>
                        </security:hasPermission>
                    </div>
                </div>
                <div id="order_list">
                    <%@ include file="order_list.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
<script type="text/javascript" src="${BASE}/www/js/order.js"></script>
</body>
</html>