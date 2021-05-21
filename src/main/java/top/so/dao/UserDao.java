package top.so.dao;

import top.so.entity.User;

import java.util.List;

public interface UserDao {
    public List<User> selectUser(User user);
    public User selectUser(String userID);
    public boolean insertUser(User user);
}
