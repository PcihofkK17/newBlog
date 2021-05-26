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
        ModelAndView mv = new ModelAndView();
      for(UserDTO user:userDTOList){
          mv.addObject("userDTO",user);
          mv.setViewName("home");
          return mv;
      }
      mv.addObject("wrongInfo","账号或密码错误!");
      mv.setViewName("login");
        return mv;
    }

    @RequestMapping(value = "goRegister",method = {RequestMethod.GET})
    public ModelAndView goRegister(){
        ModelAndView mv = new ModelAndView("register");
        return mv;
    }

    @RequestMapping(value = "doRegister",method = {RequestMethod.POST})
    public ModelAndView doRegister(UserDTO userDTO){
        ModelAndView mv = new ModelAndView();
        List<UserDTO> userDTOList = userService.selectUser(userDTO);
        boolean flag = true;
        for(UserDTO u:userDTOList){
            if(u.getLoginName().equals(userDTO.getLoginName())){
                flag = false;
            }
        }
        if(flag && userService.insertUser(userDTO)){
            mv.setViewName("login");
        }
        else{
            mv.addObject("hint","注册失败！");
            mv.addObject("wrongInfo","注册账号重复！");
            mv.setViewName("fail");
        }
        return mv;
    }



}
