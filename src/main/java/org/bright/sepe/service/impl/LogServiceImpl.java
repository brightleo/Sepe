package org.bright.sepe.service.impl;

import org.bright.sepe.entity.Log;
import org.bright.sepe.service.LogService;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;
import org.smart4j.framework.tx.annotation.Transaction;
import org.smart4j.framework.util.DateUtil;

@Service
public class LogServiceImpl implements LogService {

    @Override
    @Transaction
    public void log(String description) {
        Log log = new Log();
        log.setDate(DateUtil.getCurrentDate());
        log.setTime(DateUtil.getCurrentTime());
        log.setDescription(description);
        DataSet.insert(log);
    }
}
