package top.so.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.UserDTO;
import top.so.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @RequestMapping(value = "login",method = {RequestMethod.POST})
    public ModelAndView login(UserDTO userDTO){

      List<UserDTO> userDTOList =  userService.selectUser(userDTO);
        ModelAndView mv = new ModelAndView("home");
      for(UserDTO user:userDTOList){
          mv.addObject("userDTO",user);
          break;
      }
       return mv;
    }
}
