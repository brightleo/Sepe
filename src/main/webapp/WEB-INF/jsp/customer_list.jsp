<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<c:set var="customerList" value="${customerPager.recordList}"/>
<table class="footable default footable-loaded">
    <thead>
        <tr>
            <th style="width:100px"><f:message key="customer.id"/></th>
        	<th><f:message key="customer.name"/></th>
        	<th><f:message key="customer.username"/></th>
        	<th><f:message key="customer.usertel"/></th>
        	<th><f:message key="customer.comment"/></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${customerList}">
            <tr data-id="${customer.id}" data-name="${customer.name}">
            	<td>
                    ${customer.id}
                </td>
                <td>
                    <a href="${BASE}/customer/${customer.id}">${customer.name}</a>
                </td>
                <td>
                    ${customer.username}
                </td>
                <td>
                    ${customer.usertel}
                </td>
                <td>
                    ${customer.comment}
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<tag:pager id="customer_pager" pager="${customerPager}"/>