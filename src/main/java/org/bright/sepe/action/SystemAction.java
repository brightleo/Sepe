package org.bright.sepe.action;

import org.bright.sepe.Constant;
import org.smart4j.framework.mvc.DataContext;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Params;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;
import org.smart4j.plugin.security.SecurityHelper;
import org.smart4j.plugin.security.fault.LoginException;

@Action
public class SystemAction {


    @Request.Get("/login")
    public View login() {
        return new View("login.jsp");
    }

    @Request.Post("/login")
    public Result login(Params params) {
        String username = params.getString("username");
        String password = params.getString("password");

        try {
            SecurityHelper.login(username, password, false);
        } catch (LoginException e) {
            return new Result(false);
        }
        DataContext.Session.put(Constant.LOGIN_USER, username);

        return new Result(true);
    }

    @Request.Get("/logout")
    public Result logout() {
        SecurityHelper.logout();
        return new Result(true);
    }
}
