package top.so.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.BlogArticleDTO;
import top.so.dto.UserDTO;
import top.so.service.BlogArticleService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myBlog")
public class MyBlogController {

    @Autowired
    private BlogArticleService blogArticleService;



    @RequestMapping("")
    public ModelAndView myBlog(){
        ModelAndView mv = new ModelAndView("user/personalHomePage");
        return mv;
    }

    @RequestMapping("goWriteBlog")
    public ModelAndView goWriteBlog(){
        ModelAndView mv = new ModelAndView("user/writeBlog");
        return mv;
    }

    @RequestMapping("publishBlog")
    public ModelAndView publishBlog(BlogArticleDTO blogArticleDTO, HttpSession httpSession){
        ModelAndView mv = new ModelAndView("user/personalHomePage");
        //从session中获取当前用户，并且赋值给文章作者
        UserDTO userDTO = (UserDTO) httpSession.getAttribute("currUser");
        blogArticleDTO.setUserName(userDTO.getLoginName());
        if(blogArticleService.insertBlogArticle(blogArticleDTO)){
            mv.addObject("alertInfo","发表成功");
        }
        else{
            mv.addObject("alertInfo","发表失败");
        }
        return mv;
    }







}
