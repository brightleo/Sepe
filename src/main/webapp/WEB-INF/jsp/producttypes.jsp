<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="producttype"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
    <form id="producttype_form" class="css-form">
        <div class="css-form-header">
            <h6><f:message key="producttype"/></h6>
        </div>
        <div id="html" class="sepe-tree">
            <ul>
                <li id="rootproduct" data-jstree='{ "opened" : true }'><f:message key="producttype.root"/>
                    <ul>
                        <c:forEach var="productTypeBean" items="${productTypeBeanList}">
                            <li data-jstree='{ "opened" : true }'>${productTypeBean.productType.name}
                                <ul>
                                    <c:forEach var="productType" items="${productTypeBean.productTypeList}">
                                        <li>${productType.name}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
        </div>
        <security:hasPermission name="order.edit">
            <div class="css-form-footeform-group">
                <button id="save" type="submit" class="btn btn-default css-right sepe-btn"><f:message key="common.save"/></button>
            </div>
        </security:hasPermission>
        <input type="hidden" id="producttype_value" name="producttype_value"/>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>
<link rel="stylesheet" href="${BASE}/www/lib/jstree/themes/default/style.min.css">
<script type="text/javascript" src="${BASE}/www/lib/jstree/jstree.min.js"></script>
<script type="text/javascript"src="${BASE}/www/js/product_type.js"></script>
</body>
</html>