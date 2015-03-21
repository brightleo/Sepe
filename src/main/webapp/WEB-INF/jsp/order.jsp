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
                <h6><f:message key="order.order_list"/></h6>
            </div>
            <div class="css-panel-content">
                <div>
                <form id="order_search_form" class="sepe-form navbar-form">
                    <input type="hidden" id="orderby" name="orderby" value="desc"/>
                    <input type="hidden" id="status" name="status" value=""/>
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
                               <div>
                                  <select id="products" name="products" data-toggle="select" class="form-control sepe css-width-400 select select-default">
                                    <option value=""><f:message key="common.all"/></option>
                                    <c:forEach var="product" items="${products}">
                                        <option value="${product.productType.name}">${product.productType.name}</option>
                                    </c:forEach>
                                  </select>
                                </div>
                            </td>
                            <td>
                                <div class="css-right">
                                    <security:hasPermission name="order.create">
                                        <a href="${BASE}/order/create"><f:message key="order.create_order"/></a>
                                    </security:hasPermission>
                                </div>
                            </td>
                        </tr>
                    </table>  
                </form>

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