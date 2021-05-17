package top.so.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import top.so.dao.UserDao;
import top.so.entity.User;

import java.util.List;

@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {


    @Override
    public List<User> selectUser(User user) {
        return this.getSqlSession().selectList(this.getClass().getName()+".selectUser",user);
    }

    @Override
    public User selectUser(String userID) {
        return this.getSqlSession().selectOne(this.getClass().getName()+".selectUserByUserID",userID);
    }
}
