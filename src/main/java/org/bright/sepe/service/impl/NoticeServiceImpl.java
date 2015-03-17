package org.bright.sepe.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.bright.sepe.Constant;
import org.bright.sepe.entity.Notice;
import org.bright.sepe.service.NoticeService;
import org.bright.sepe.utils.ConvertUtils;
import org.smart4j.framework.dao.DatabaseHelper;
import org.smart4j.framework.dao.SqlHelper;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.mvc.DataContext;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;

import com.alibaba.druid.util.StringUtils;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private String sort_ = "id desc";

	@Override
	public List<Notice> findNoticeList() {
		String condition = "notice_date <= ?";
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(new Date());
		return DataSet.selectListWithConditionAndSort(Notice.class, condition, sort_, date);
	}

	@Override
	public Pager<Notice> getNoticePager(int pageNumber, int pageSize, String param, String type) {
		String condition = "(notice_date like ? or title like ? or comment like ?) and type like ?";
		Boolean hasDate = true;
		
		try {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			if(!StringUtils.isEmpty(param) && !ConvertUtils.isNumeric(param)) {
				format.setLenient(false);
				format.parse(param);
			}
		}  catch (Exception e) {
			hasDate = false;
		}
		long count = 0;
		List<Notice> noticeList = null;
		if (hasDate) {
			Object[] params = { "%" + param + "%", "%" + param + "%", "%" + param + "%" , "%" + type + "%"};
			count = DataSet.selectCount(Notice.class, condition, params);
			noticeList = DataSet.selectListForPager(pageNumber,
					pageSize, Notice.class, condition, sort_, params);
		} else {
			condition = "(title like ? or comment like ?) and type like ?";
			Object[] params = { "%" + param + "%", "%" + param + "%", "%" + type + "%"};
			count = DataSet.selectCount(Notice.class, condition, params);
			noticeList = DataSet.selectListForPager(pageNumber,
					pageSize, Notice.class, condition, sort_, params);
		}
		return new Pager<Notice>(pageNumber, pageSize, count, noticeList);
	}

	@Override
	public boolean saveNotice(Map<String, Object> fieldMap) {
		return DataSet.insert(Notice.class, fieldMap);
	}

	@Override
	public Notice findNotice(long id) {
		return DataSet.select(Notice.class, "id = ?", id);
	}

	@Override
	public boolean updateNotice(long id, Map<String, Object> fieldMap) {
		Notice notice = this.findNotice(id);
		notice.setNoticeDate(String.valueOf(fieldMap.get("noticeDate")));
		notice.setTitle(String.valueOf(fieldMap.get("title")));
		notice.setStatus(String.valueOf(fieldMap.get("status")));
		notice.setType(String.valueOf(fieldMap.get("type")));
		notice.setComment(String.valueOf(fieldMap.get("comment")));
		return DataSet.update(notice);
	}

	@Override
	public boolean deleteNotice(long id) {
		return DataSet.delete(Notice.class, "id = ?", id);
	}

	@Override
	public Object[][] getNotices() {
		String loginUser = DataContext.Session.get(Constant.LOGIN_USER);
		if (StringUtils.isEmpty(loginUser)) {
			return null;
		} else {
			String sql = SqlHelper.getSql("SELECT_UN_READ_NOTICES");
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String date = format.format(new Date());
			return ConvertUtils.ConvertForNotice(DatabaseHelper.queryArrayList(sql, date));
		}
	}
}
