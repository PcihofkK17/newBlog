package top.so.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.UserDTO;
import top.so.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/user")
@SessionAttributes("currUser")//当前用户
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login",method = {RequestMethod.POST})
    public ModelAndView login(UserDTO userDTO, ModelMap modelMap){
        ModelAndView mv = new ModelAndView();
      List<UserDTO> userDTOList =  userService.selectUser(userDTO);
      //判断结果集中是否有匹配的数据 如有则返回到主页
          for(UserDTO user:userDTOList){
//              mv.addObject("userDTO",user);
              mv.setViewName("redirect:/home");
              modelMap.addAttribute("currUser",user);
              return mv;
          }
      //否则 提示账号或密码错误
      mv.addObject("wrongInfo","账号或密码错误!");
      mv.setViewName("main/login");
        return mv;
    }

    @RequestMapping(value = "goRegister",method = {RequestMethod.GET})
    public ModelAndView goRegister(){
        ModelAndView mv = new ModelAndView("main/register");
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
            mv.addObject("hasCount","yep");
            mv.setViewName("main/login");
        }
        else{
            mv.addObject("hint","注册失败！");
            mv.addObject("wrongInfo","注册账号重复！");
            mv.setViewName("main/fail");
        }
        return mv;
    }



}
