<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<c:set var="noticeList" value="${noticePager.recordList}"/>
<table class="footable default footable-loaded">
    <thead>
        <tr>
        	<th><f:message key="notice.title"/></th>
        	<th><f:message key="notice.date"/></th>
        	<th  style="word-break:break-all; word-wrap:break-word;"><f:message key="notice.comment"/></td>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="notice" items="${noticeList}">
            <tr data-id="${notice.id}" data-name="${notice.title}">
                <td>
                    <a href="${BASE}/notice/${notice.id}">${notice.title}</a>
                </td>
                <td>
                    ${notice.noticeDate}
                </td>
                <td>
                    ${notice.comment}
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<tag:pager id="notice_pager" pager="${noticePager}"/>