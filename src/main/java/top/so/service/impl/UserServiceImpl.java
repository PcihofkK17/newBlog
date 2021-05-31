package top.so.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.so.dao.UserDao;
import top.so.dto.UserDTO;
import top.so.entity.User;
import top.so.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public List<UserDTO> selectUser(UserDTO userDTO){
        List<User> userList =  userDao.selectUser(DTOToPOJO(userDTO));
        List<UserDTO> userDTOList = POJOToDTO(userList);
        return userDTOList;
    }
    public boolean insertUser(UserDTO userDTO) {
        //使用UUID随机生成用户ID号
        UUID uuid = UUID.randomUUID();
        userDTO.setUserID(String.valueOf(uuid).replaceAll("-",""));
        return userDao.insertUser(DTOToPOJO(userDTO));
    }


    /**
     * @author so
     * @description DTO转POJO 数据用于页面显示
     * @param userDTO   //DTO对象集
     * @return  User POJO对象集
     */

    private User DTOToPOJO(UserDTO userDTO){
        User result = new User();
        if(userDTO!=null){
            result.setLoginName(userDTO.getLoginName());
            result.setPassword(userDTO.getPassword());
            result.setUserID(userDTO.getUserID());
        }
        return result;
    }

    /**
     * @Author so
     * @Describe POJO转DTO 数据用于页面显示
     * @param userList   //POJO对象集
     * @return  UserDTO DTO对象集
     */

    private List<UserDTO> POJOToDTO(List<User> userList){
        List<UserDTO> result = new ArrayList<UserDTO>();
        UserDTO temp;
         for(User user:userList){
            temp = new UserDTO();
            temp.setUserID(user.getUserID());
            temp.setLoginName(user.getLoginName());
            temp.setPassword(user.getPassword());
            result.add(temp);
         }
        return result;
    }


    /**
     * @Author so
     * @Describe POJO转DTO 数据用于页面显示
     * @param user   //POJO对象
     * @return  UserDTO DTO对象
     */

    private UserDTO POJOToDTO(User user){
        UserDTO result = null;
        if(user!=null){
            result = new UserDTO();
            result.setUserID(user.getUserID());
            result.setLoginName(user.getLoginName());
            result.setPassword(user.getPassword());
        }
        return result;
    }

}
