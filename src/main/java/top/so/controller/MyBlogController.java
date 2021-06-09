package top.so.controller;


import com.sun.deploy.net.HttpResponse;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.BlogArticleDTO;
import top.so.dto.UserDTO;
import top.so.service.BlogArticleService;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myBlog")
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
        mv.addObject("blogArticleDTOList",blogArticleDTOList);
        return mv;
    }

    @RequestMapping(value = "goWriteBlog")
    public ModelAndView goWriteBlog(){
        ModelAndView mv = new ModelAndView("user/writeBlog");
        return mv;
    }

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







}
