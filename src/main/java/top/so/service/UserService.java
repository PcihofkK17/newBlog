package top.so.service;


import top.so.dto.UserDTO;

import java.util.List;

public interface UserService {
    public List<UserDTO> selectUser(UserDTO userDTO);
    public boolean insertUser(UserDTO userDTO);
}
