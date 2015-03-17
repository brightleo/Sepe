<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<c:set var="noticeList" value="${noticePager.recordList}"/>
<table class="footable default footable-loaded">
    <thead>
        <tr>
        	<th><f:message key="notice.title"/></th>
        	<th><f:message key="notice.date"/></th>
            <th>
                <select id="noticeType" name="noticeType" data-toggle="select" class="sepe form-control select select-primary">
                    <option value="" ${type == '' ? 'selected' : ''}><f:message key="notice.type"/></option>
                    <option value="1" ${type == '1' ? 'selected' : ''}><f:message key="notice.type.1"/></option>
                    <option value="2" ${type == '2' ? 'selected' : ''}><f:message key="notice.type.2"/></option>
                    <option value="3" ${type == '3' ? 'selected' : ''}><f:message key="notice.type.3"/></option>
                    <option value="4" ${type == '4' ? 'selected' : ''}><f:message key="notice.type.4"/></option>
                </select>
            </th>
        	<th><f:message key="notice.comment"/></td>
            <th class="css-width-25"><f:message key="common.action"/></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="notice" items="${noticeList}">
            <tr data-id="${notice.id}" data-name="${notice.title}">
                <td><a href="${BASE}/notice/${notice.id}"><span class="sepe-icon ${notice.status == 2 ? 'sepe-readed' : ''} fui-mail"></span>${notice.title}</a></td>
                <td>
                    ${notice.noticeDate}
                </td>
                <td>
                    <f:message key="notice.type.${notice.type}"/>
                </td>
                <td>
                    ${notice.comment}
                </td>
                <td>
                    <security:hasPermission name="order.delete">
                        <a href="#" class="ext-notice-delete"><span class="sepe-icon fui-cross-circle"></span></a>
                    </security:hasPermission>
                </td> 
            </tr>
        </c:forEach>
    </tbody>
</table>
<tag:pager id="notice_pager" pager="${noticePager}"/>
<script type="text/javascript">
$(function() {
    //
    $("#noticeType").change(function() {
        $('#notice_search_form #type').val($(this).val());
        $('#notice_search_form').submit();
    });
});
</script>