<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<c:set var="noticeList" value="${noticePager.recordList}"/>
<table class="footable default footable-loaded">
    <thead>
        <tr>
        	<th><f:message key="notice.title"/></th>
        	<th><f:message key="notice.date"/></th>
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