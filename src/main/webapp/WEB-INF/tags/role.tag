<%@ tag import="org.smart4j.framework.util.CollectionUtil" %>
<%@ tag import="org.bright.sepe.entity.Role" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/global.jsp" %>

<%@ attribute name="roleList" required="true" type="java.util.List<org.bright.sepe.entity.Role>" %>
<%@ attribute name="userRoleList" required="false" type="java.util.List<org.bright.sepe.entity.Role>" %>

<%
    String template = "<label class=\"radio\" for=\"roleId%d\"><input type=\"radio\" data-toggle=\"radio\" name=\"roleId\" id=\"roleId%d\" value=\"%d\"%s>%s</label>";
    for (Role role : roleList) {
        long id = role.getId();
        String roleName = role.getRoleName();
        String checked = "";
        if (CollectionUtil.isNotEmpty(userRoleList)) {
            for (Role userRole : userRoleList) {
                if (userRole.getId() == id) {
                    checked = "checked";
                    break;
                }
            }
        }
        String html = String.format(template, id, id, id, checked, roleName);
        out.write(html);
    }
%>