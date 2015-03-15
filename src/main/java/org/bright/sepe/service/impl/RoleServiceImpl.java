package org.bright.sepe.service.impl;

import java.util.List;

import org.bright.sepe.entity.Role;
import org.bright.sepe.service.RoleService;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;

@Service
public class RoleServiceImpl implements RoleService {

    @Override
    public List<Role> getRoleList() {
        return DataSet.selectList(Role.class);
    }
}
