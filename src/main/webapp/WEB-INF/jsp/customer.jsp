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
    <div id="main">
        <div class="css-panel">
            <div class="css-panel-header">
                <h6><f:message key="customer.list"/></h6>
            </div>
            <div class="css-panel-content">
                <div>
                    <form id="customer_search_form" class="sepe-form navbar-form">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                  <div class = "sepe input-group">
                                        <input class="form-control" name="name" type="search" placeholder="<f:message key="common.search.fileds"/>">
                                        <span class="input-group-btn">
                                          <button type="submit" id="search" class="btn"><span class="fui-search"></span></button>
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <div class="css-right">
                                        <security:hasPermission name="order.create">
                                            <a href="${BASE}/customer"><f:message key="customer.create_customer"/></a>
                                        </security:hasPermission>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="customer_list">
                    <%@ include file="customer_list.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>

<script type="text/javascript" src="${BASE}/www/js/customer.js"></script>

</body>
</html>