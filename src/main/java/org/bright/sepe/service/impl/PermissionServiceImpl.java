package org.bright.sepe.service.impl;

import java.util.List;

import org.bright.sepe.entity.Permission;
import org.bright.sepe.service.PermissionService;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Override
    public List<Permission> getPermissionList() {
        return DataSet.selectList(Permission.class);
    }
}
