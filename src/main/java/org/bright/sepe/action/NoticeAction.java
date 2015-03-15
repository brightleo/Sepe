package org.bright.sepe.action;

import java.util.Map;

import org.bright.sepe.Constant;
import org.bright.sepe.Tool;
import org.bright.sepe.entity.Notice;
import org.bright.sepe.service.NoticeService;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.DataContext;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Params;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;
import org.smart4j.plugin.security.annotation.HasRoles;

@Action
@HasRoles("admin")
public class NoticeAction {

    @Inject
    private NoticeService noticeService;
    
    @Request.Get("/un_read_notices")
    public Result getUnReadNotices() {
    	Result result = new Result(true);
    	result.setData(noticeService.getNotices());
        return result;
    }

    @Request.Get("/notices")
    public View index() {
        int pageNumber = 1;
        int pageSize = Tool.getPageSize("notice_pager");
        String name = "";
        Pager<Notice> noticePager = noticeService.getNoticePager(pageNumber, pageSize, name);
        return new View("notice.jsp").data("noticePager", noticePager);
    }
    @Request.Post("/notice/search")
    public View search(Params params) {
        int pageNumber = params.getInt(Constant.PAGE_NUMBER);
        int pageSize = params.getInt(Constant.PAGE_SIZE);
        String name = params.getString("param");
        Pager<Notice> noticePager = noticeService.getNoticePager(pageNumber, pageSize, name);
        return new View("notice_list.jsp")
            .data("noticePager", noticePager);
    }

    @Request.Get("/notice")
    public View create() {
        return new View("notice_create.jsp");
    }
    
    @HasRoles("admin")
    @Request.Post("/notice")
    public Result save(Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean result = noticeService.saveNotice(fieldMap);
        return new Result(result);
    }
    
    @Request.Get("/notice/{id}")
    public View edit(long id) {
    	Notice notice = noticeService.findNotice(id);
    	DataContext.Request.put("notice", notice);
        return new View("notice_edit.jsp");
    }

    @Request.Put("/notice/{id}")
    public Result update(long id, Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean result = noticeService.updateNotice(id, fieldMap);
        return new Result(result);
    }
    @Request.Delete("/notice/{id}")
    public Result delete(long id) {
        boolean result = noticeService.deleteNotice(id);
        return new Result(result);
    }
}
