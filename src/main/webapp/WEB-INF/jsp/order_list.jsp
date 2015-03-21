<%@ page pageEncoding="UTF-8" %>
<%@ include file="common/global.jsp" %>
<%@ taglib prefix="security" uri="/security" %>
<c:set var="orderBeanList" value="${orderBeanPager.recordList}"/>
<div class="sepe-table">
<table id="order_table" class="sepe-table footable default footable-loaded" style="margin-bottom:10px">
    <thead>
        <tr>
            <th id="ordercode"
                <c:choose>
                    <c:when test="${order == 'asc'}">
                         class="footable-sorted-desc"
                    </c:when>
                    <c:otherwise>
                        class="footable-sorted"
                    </c:otherwise>
                </c:choose>
            data-sort-initial="true"><a href="#" class="table_a"><f:message key="order.code"/></a><span class="footable-sort-indicator"></span></th>
            <th><f:message key="order.name"/></th>
            <th><f:message key="order.product_type"/></th>
            <th><f:message key="order.salesman"/></th>
            <th><f:message key="order.customer"/></th>
            <th><f:message key="order.customerOrderid"/></th>
            <th><f:message key="order.orderamount"/></th>
            <th><f:message key="order.orderdate"/></th>
            <th><f:message key="order.orderQuantity"/></th>
            <th>
                <select id="orderStatus" name="orderStatus" data-toggle="select" class="sepe form-control select select-primary">
                    <option value="" ${status == '' ? 'selected' : ''}><f:message key="order.list.status"/></option>
                    <option value="1" ${status == '1' ? 'selected' : ''}><f:message key="order.status1"/></option>
                    <option value="2" ${status == '2' ? 'selected' : ''}><f:message key="order.status2"/></option>
                    <option value="3" ${status == '3' ? 'selected' : ''}><f:message key="order.status3"/></option>
                    <option value="0" ${status == '0' ? 'selected' : ''}><f:message key="order.status0"/></option>
                </select>
            </th>
            <th class="css-width-25"></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="orderBean" items="${orderBeanList}">
            <c:set var="order" value="${orderBean.order}"/>
            <tr data-id="${order.id}" data-name="${order.name}">
                <td>${order.code}</td>
                <td><a href="${BASE}/order/view/${order.id}">${order.name}</a></td>
                <td class="nonewline">${order.subProductType}</td>
                <td class="nonewline">${order.salesman}</td>
                <td class="nonewline">${order.customer}</td>
                <td class="nonewline">${order.customerOrderid}</td>
                <td class="nonewline">${order.orderamount}</td>
                <td class="nonewline">${order.orderdate}</td>
                <td class="nonewline">${order.orderQuantity}</td>
                <td class="nonewline"><f:message key="order.status${order.status}"/></td>
                <td>
                    <security:hasPermission name="order.edit">
                        <a href="${BASE}/order/edit/${order.id}"><span class="sepe-icon fui-new"></span></a>
                    </security:hasPermission>
                    <security:hasPermission name="order.delete">
                        <a href="#" class="ext-order-delete"><span class="sepe-icon fui-cross-circle"></span></a>
                    </security:hasPermission>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<tag:pager id="order_pager" pager="${orderBeanPager}"/>
<script type="text/javascript">
$(function() {
    $("#ordercode a.table_a").click(function() {
        var $orderby = $('#order_search_form #orderby');
        if ($orderby.val() === 'asc'){
            $orderby.val('desc');
        } else {
            $orderby.val('asc');
        }
        $('#order_search_form').submit();
    });
    $("#orderStatus").change(function() {
        $('#order_search_form #status').val($(this).val());
        $('#order_search_form').submit();
    });
});
</script>