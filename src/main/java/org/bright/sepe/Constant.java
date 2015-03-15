package org.bright.sepe;

import org.smart4j.framework.core.ConfigHelper;

public interface Constant {

    String CAPTCHA = "session.captcha";
    
    String LOGIN_USER = "loginUser";

    String PAGE_NUMBER = "pageNumber";
    String PAGE_SIZE = "pageSize";

    String UPLOAD_PATH = ConfigHelper.getString("sepe.upload_path");
}
