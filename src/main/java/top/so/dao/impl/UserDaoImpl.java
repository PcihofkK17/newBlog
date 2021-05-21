package top.so.dao.impl;

import org.springframework.stereotype.Repository;
import top.so.dao.AbstractBaseDao;
import top.so.dao.UserDao;
import top.so.entity.User;

import java.util.List;

@Repository
public class UserDaoImpl extends AbstractBaseDao implements UserDao {
    public boolean insertUser(User user) {
        //成功返回1 失败返回0
        if(this.getSqlSession().insert(this.getClass().getName()+".insert",user)==1){
            return true;
        }
        return false;
    }

    public List<User> selectUser(User user) {
        return this.getSqlSession().selectList(this.getClass().getName()+".selectUser",user);
    }


    public User selectUser(String userID) {
        return this.getSqlSession().selectOne(this.getClass().getName()+".selectUserByUserID",userID);
    }
}
