<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="notice"/></title>
    <%@ include file="common/style.jsp" %>
    <%@ include file="common/script.jsp" %>
</head>
<body>

<div class="container">
<%@ include file="common/header.jsp" %>
    <div id="main">
        <div class="css-panel">
            <div class="css-panel-header">
                <h6><f:message key="notice.list"/></h6>
            </div>
            <div class="css-panel-content">
                <div>
                    <form id="notice_search_form" class="sepe-form navbar-form">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                  <div class = "sepe input-group">
                                    <input type="text" name="param" class="form-control" type="search">
                                    <input type="hidden" name="type" id="type" class="form-control" value="">
                                        <span class="input-group-btn">
                                          <button type="submit" id="search" class="btn"><span class="fui-search"></span></button>
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <div class="css-right">
                                        <security:hasPermission name="order.create">
                                            <a href="${BASE}/notice"><f:message key="notice.create_notice"/></a>
                                        </security:hasPermission>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="notice_list">
                    <%@ include file="notice_list.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
<script type="text/javascript" src="${BASE}/www/js/notice.js"></script>

</body>
</html>