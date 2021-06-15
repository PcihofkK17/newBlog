package top.so.controller;



import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.BlogArticleDTO;
import top.so.dto.UserDTO;
import top.so.service.BlogArticleService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myBlog")
@SessionAttributes("isSuccess")//操作状态
public class MyBlogController {

    @Autowired
    private BlogArticleService blogArticleService;



    @RequestMapping(value = "",method = RequestMethod.GET)
    public ModelAndView myBlog(HttpSession httpSession){
        ModelAndView mv = new ModelAndView("user/personalHomePage");
        UserDTO userDTO = (UserDTO) httpSession.getAttribute("currUser");
        BlogArticleDTO blogArticleDTO = new BlogArticleDTO();
        blogArticleDTO.setUserName(userDTO.getLoginName());
        List<BlogArticleDTO> blogArticleDTOList = blogArticleService.selectBlogArticleWithPage(blogArticleDTO,1);
        if(!blogArticleDTOList.isEmpty())
        mv.addObject("blogArticleDTOList",blogArticleDTOList);
        return mv;
    }

    @RequestMapping(value = "goWriteBlog")
    public ModelAndView goWriteBlog(){
        ModelAndView mv = new ModelAndView("user/writeBlog");
        return mv;
    }

    /**
     * 发表文章
     * @param blogArticleDTO
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "publishBlog",method = RequestMethod.POST,produces="application/json")
    @ResponseBody
    public String publishBlog(BlogArticleDTO blogArticleDTO, HttpSession httpSession){
        String result = null;
        Map<String,Object> map = new HashMap<String,Object>();
       ObjectMapper mapper = new ObjectMapper();
        //从session中获取当前用户，并且赋值给文章作者
        UserDTO userDTO = (UserDTO) httpSession.getAttribute("currUser");
        blogArticleDTO.setUserName(userDTO.getLoginName());
        if(blogArticleService.insertBlogArticle(blogArticleDTO)){
            map.put("isSuccess","true");
        }
        else{
            map.put("isSuccess","false");
        }

        try {
            result = mapper.writeValueAsString(map);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

    @RequestMapping(value = "goEditArticle",method = RequestMethod.GET)
    public ModelAndView goEditArticle(BlogArticleDTO blogArticleDTO){
        ModelAndView mv = new ModelAndView("user/editBlog");
        List<BlogArticleDTO> blogArticleDTOList = blogArticleService.selectBlogArticleWithPage(blogArticleDTO,1);
        for(BlogArticleDTO blogArticle:blogArticleDTOList){
            BlogArticleDTO result = blogArticle;
            mv.addObject("blogArticleDTO",result);
            break;
        }
        return mv;
    }

    /**
     * 修改文章
     * @param blogArticleDTO
     * @return
     */
    @RequestMapping(value = "editArticle",method = RequestMethod.POST)
    @ResponseBody
    public String editArticle(BlogArticleDTO blogArticleDTO){
        String result = null;
        Map<String,Object> map = new HashMap<String,Object>();
        ObjectMapper mapper = new ObjectMapper();
        if(blogArticleService.updateBlogArticle(blogArticleDTO)){
            map.put("isSuccess","true");
        }
        else{
            map.put("isSuccess","false");
        }
        try {
            result = mapper.writeValueAsString(map);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 删除文章
     */
    @RequestMapping(value = "deleteArticle",method = RequestMethod.POST)
    public ModelAndView deleteArticle(BlogArticleDTO blogArticleDTO, ModelMap modelMap){
        ModelAndView mv = new ModelAndView("redirect:/myBlog");
        if(blogArticleService.deleteBlogArticle(blogArticleDTO)){
           modelMap.addAttribute("isSuccess","true");
        }
        else{
            modelMap.addAttribute("isSuccess","false");
        }
        return mv;
    }

    @RequestMapping(value = "goPage",method = RequestMethod.POST)
    public ModelAndView goPage(int pageNum,HttpSession httpSession){
        UserDTO userDTO = (UserDTO) httpSession.getAttribute("currUser");
        System.out.println(userDTO.getLoginName());
        ModelAndView mv = new ModelAndView("user/personalHomePage");
        BlogArticleDTO blogArticleDTO = new BlogArticleDTO();
        blogArticleDTO.setUserName(userDTO.getLoginName());
        List<BlogArticleDTO> blogArticleDTOList = blogArticleService.selectBlogArticleWithPage(blogArticleDTO,pageNum);
            mv.addObject("blogArticleDTOList",blogArticleDTOList);
        return mv;
    }



}
