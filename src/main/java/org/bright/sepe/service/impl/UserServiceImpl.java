package org.bright.sepe.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.bright.sepe.bean.UserBean;
import org.bright.sepe.entity.Customer;
import org.bright.sepe.entity.Permission;
import org.bright.sepe.entity.Role;
import org.bright.sepe.entity.Salesman;
import org.bright.sepe.entity.User;
import org.bright.sepe.service.UserService;
import org.bright.sepe.utils.ConvertUtils;
import org.smart4j.framework.dao.DatabaseHelper;
import org.smart4j.framework.dao.SqlHelper;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;
import org.smart4j.framework.tx.annotation.Transaction;
import org.smart4j.framework.util.CastUtil;
import org.smart4j.framework.util.StringUtil;
import org.smart4j.plugin.security.SecurityHelper;

@Service
public class UserServiceImpl implements UserService {

    private static final String roleListSql = SqlHelper.getSql("SELECT_ROLE_BY_USERID");
    private static final String permissionListSql = SqlHelper.getSql("SELECT_PERMISSION_BY_USERID");

    @Override
    public void login(String username, String password) {
        SecurityHelper.login(username, password, false);
    }

    @Override
    public List<User> findUserList() {
        return DataSet.selectList(User.class);
    }

    @Override
    public List<UserBean> findUserBeanList() {
        List<User> userList = DataSet.selectList(User.class);
        return getUserBeanList(userList);
    }

    private List<UserBean> getUserBeanList(List<User> userList) {
        List<UserBean> userBeanList = new ArrayList<UserBean>();
        for (User user : userList) {
            UserBean userBean = createUserBean(user);
            userBeanList.add(userBean);
        }
        return userBeanList;
    }

    private UserBean createUserBean(User user) {
        long userId = user.getId();
        List<Role> roleList = DatabaseHelper.queryEntityList(Role.class, roleListSql, userId);
        List<Permission> permissionList = DatabaseHelper.queryEntityList(Permission.class, permissionListSql, userId);
        return new UserBean(user, roleList, permissionList);
    }

    @Override
    public List<User> findUserListByUsername(String username) {
        return DataSet.selectListWithCondition(User.class, "username like ?", "%" + username + "%");
    }

    @Override
    public List<UserBean> findUserBeanListByUsername(String username) {
        List<User> userList = DataSet.selectListWithCondition(User.class, "username like ?", "%" + username + "%");
        return getUserBeanList(userList);
    }

    @Override
    public User findUser(long userId) {
        return DataSet.select(User.class, "id = ?", userId);
    }

    @Override
    public UserBean findUserBean(long id) {
        User user = DataSet.select(User.class, "id = ?", id);
        if (user == null) return null;
        return createUserBean(user);
    }

    @Override
    @Transaction
    public boolean saveUser(Map<String, Object> fieldMap) {
        String username = CastUtil.castString(fieldMap.get("username"));
        String password = SecurityHelper.encrypt(CastUtil.castString(fieldMap.get("password")));

        long userId = insertUser(username, password);
        String roleIdStr = CastUtil.castString(fieldMap.get("roleId"));
        insertUserRole(userId, roleIdStr);
        return true;
    }

    private long insertUser(String username, String password) {
        return CastUtil.castLong(DatabaseHelper.insertReturnPK(
            "insert into user (username, password) values (?, ?)",
            username, password
        ));
    }

    private void insertUserRole(long userId, String roleIdStr) {
        long[] roleIdArray = CastUtil.castLongArray(roleIdStr.split(StringUtil.SEPARATOR));
        for (long roleId : roleIdArray) {
            DatabaseHelper.update(
                "insert user_role (user_id, role_id) values (?, ?)",
                userId, roleId
            );
        }
    }

    @Override
    @Transaction
    public boolean updateUser(long userId, Map<String, Object> fieldMap) {
        User user = DataSet.select(User.class, "id = ?", userId);
        if (user == null) return false;

        String password = CastUtil.castString(fieldMap.get("password"));
        if (StringUtil.isNotEmpty(password)) {
            password = SecurityHelper.encrypt(password);
            user.setPassword(password);
        }

        deleteUserRole(userId);
        String roleIdStr = CastUtil.castString(fieldMap.get("roleId"));
        insertUserRole(userId, roleIdStr);
        return DataSet.update(user);
    }

    private void deleteUserRole(long userId) {
        DatabaseHelper.update(
            "delete from user_role where user_id = ?",
            userId
        );
    }

    @Override
    @Transaction
    public boolean deleteUser(long userId) {
        return DataSet.delete(User.class, "id = ?", userId);
    }

	@Override
	public List<Salesman> findSalesmanList() {
		return DataSet.selectList(Salesman.class);
	}

	@Override
	public boolean saveSalesman(Map<String, Object> fieldMap) {
		boolean result = false;
		List<String> salesmanNameList = ConvertUtils.ConvertFromMapToSalesmanList(fieldMap);
		DataSet.delete(Salesman.class, "id > ?", "0");
		for (int i = 0; i < salesmanNameList.size(); i++) {
			String name = salesmanNameList.get(i);
			Salesman salesman = new Salesman();
			salesman.setId(i + 1);
			salesman.setName(name);
			result = DataSet.insert(salesman);
		}
		return result;
	}

	@Override
	public List<Customer> findCustomerList() {
		return DataSet.selectList(Customer.class);
	}

	@Override
	public boolean saveCustomer(Map<String, Object> fieldMap) {
		return DataSet.insert(Customer.class, fieldMap);
	}

	@Override
	public boolean deleteCustomer(long id) {
		return DataSet.delete(Customer.class, "id = ?", id);
	}

	@Override
	public Customer findCustomer(long id) {
		return DataSet.select(Customer.class, "id = ?", id);
	}

	@Override
	public boolean updateCustomer(long id, Map<String, Object> fieldMap) {
		Customer customer = this.findCustomer(id);
		if (customer != null) {
			customer.setName(String.valueOf(fieldMap.get("name")));
			customer.setUsername(fieldMap.get("username") == null ? null
					: fieldMap.get("username").toString());
			customer.setUsertel(fieldMap.get("usertel") == null ? null
					: fieldMap.get("usertel").toString());
			customer.setComment(fieldMap.get("comment") == null ? null
					: fieldMap.get("comment").toString());
			return DataSet.update(customer);
		}
		return false;
	}

	@Override
	public Pager<Customer> getCustomerPager(int pageNumber, int pageSize, String name) {
		String condition = "name like ?";
		Object[] params = {"%" + name + "%"};
		long count = DataSet.selectCount(Customer.class, condition, params);
		List<Customer> customerList = DataSet.selectListForPager(pageNumber, pageSize, Customer.class, condition, "id asc", params);
		return new Pager<Customer>(pageNumber, pageSize, count, customerList);
	}
}
