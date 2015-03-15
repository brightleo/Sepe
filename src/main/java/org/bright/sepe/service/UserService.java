package org.bright.sepe.service;

import java.util.List;
import java.util.Map;

import org.bright.sepe.bean.UserBean;
import org.bright.sepe.entity.Customer;
import org.bright.sepe.entity.Salesman;
import org.bright.sepe.entity.User;
import org.smart4j.framework.dao.bean.Pager;

public interface UserService {

    void login(String username, String password);

    List<User> findUserList();

    List<UserBean> findUserBeanList();

    @Deprecated
    List<User> findUserListByUsername(String username);

    List<UserBean> findUserBeanListByUsername(String username);

    @Deprecated
    User findUser(long userId);

    UserBean findUserBean(long userId);

    boolean saveUser(Map<String, Object> fieldMap);

    boolean updateUser(long userId, Map<String, Object> fieldMap);

    boolean deleteUser(long userId);
    
    List<Salesman> findSalesmanList();
    
    boolean saveSalesman(Map<String, Object> fieldMap);
    
    List<Customer> findCustomerList();
    
    Pager<Customer> getCustomerPager(int pageNumber, int pageSize, String name);
    
    boolean saveCustomer(Map<String, Object> fieldMap);
    
    Customer findCustomer(long id);
    
    boolean updateCustomer(long id, Map<String, Object> fieldMap);
    
    boolean deleteCustomer(long id);
}
