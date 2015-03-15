<%@ tag import="org.smart4j.framework.util.CollectionUtil" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/global.jsp" %>
<%@ attribute name="index" required="true" type="java.lang.String" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%
    String template = "<input type=\"radio\" data-toggle=\"radio\" name=\"status\" id=\"status%d\" value=\"%d\"%s>";
    int id = Integer.parseInt(index);
    int status = Integer.parseInt(value);
    String checked = "";
        if (status == id) {
            checked = "checked";
        }
    String html = String.format(template, id, id, checked);
    out.write(html);
%>