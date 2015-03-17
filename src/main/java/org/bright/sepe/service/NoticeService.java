package org.bright.sepe.service;

import java.util.List;
import java.util.Map;

import org.bright.sepe.entity.Notice;
import org.smart4j.framework.dao.bean.Pager;

public interface NoticeService {

	List<Notice> findNoticeList();

	Pager<Notice> getNoticePager(int pageNumber, int pageSize, String param, String type);

	boolean saveNotice(Map<String, Object> fieldMap);

	Notice findNotice(long id);

	boolean updateNotice(long id, Map<String, Object> fieldMap);

	boolean deleteNotice(long id);

	Object[][] getNotices();
}
