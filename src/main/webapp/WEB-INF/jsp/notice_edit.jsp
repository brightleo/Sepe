<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/meta.jsp" %>
    <title><f:message key="common.title"/> - <f:message key="notice"/></title>
    <%@ include file="common/style.jsp" %>
</head>
<body>

<input type="hidden" id="id" value="${notice.id}">

<div class="container">
<%@ include file="common/header.jsp" %>
    <form id="notice_edit_form" class="form-horizontal">
        <div class="css-form-header">
            <h6><f:message key="notice.edit_notice"/></h6>
        </div>
        <div class="form-group">
            <label for="title"><f:message key="notice.title"/>:</label>
            <div>
                <input type="text" id="title" name="title" value="${notice.title}" class="ext-required">
            </div>
        </div>
        <div class="form-group">
            <label for="noticeDate"><f:message key="notice.date"/>:</label>
            <div>
                <input type="text" id="noticeDate" name="noticeDate" value="${notice.noticeDate}" class="ext-required css-readonly" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label for="type"><f:message key="notice.type"/>:</label>
            <div>
                <label class="radio" for="type1">
                    <tag:types index="1" value="${notice.type}" /><f:message key="notice.type.1"/>
                </label>
                <label class="radio" for="type2">
                    <tag:types index="2" value="${notice.type}" /><f:message key="notice.type.2"/>
                </label>
                <label class="radio" for="type3">
                    <tag:types index="3" value="${notice.type}" /><f:message key="notice.type.3"/>
                </label>
                <label class="radio" for="type4">
                    <tag:types index="4" value="${notice.type}" /><f:message key="notice.type.4"/>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="status"><f:message key="notice.status"/>:</label>
            <div>
                <label class="radio" for="status1">
                    <tag:status index="1" value="${notice.status}" /><f:message key="notice.status.1"/>
                </label>
                <label class="radio" for="status2">
                    <tag:status index="2" value="${notice.status}" /><f:message key="notice.status.2"/>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="comment"><f:message key="notice.comment"/>:</label>
            <div>
                <textarea id="comment" name="comment" rows="5" class="ext-required">${notice.comment}</textarea>
            </div>
        </div>
        <div class="form-group">
          <div class="col-lg-offset-2 col-lg-10">
            <button type="button" id="back" class="btn btn-default css-right sepe-btn"><f:message key="common.back"/></button>
            <security:hasPermission name="order.edit">
                <button type="submit" class="btn btn-default css-right sepe-btn"><f:message key="common.save"/></button>
            </security:hasPermission>
          </div>
        </div>
    </form>
</div>

<%@ include file="common/footer.jsp" %>

<%@ include file="common/script.jsp" %>
<link rel="stylesheet" href="${BASE}/www/lib/jquery-ui/css/hot-sneaks/jquery-ui-1.10.4.custom.min.css">
<script type="text/javascript" src="${BASE}/www/lib/jquery-ui/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="${BASE}/www/js/notice_edit.js"></script>

</body>
</html>