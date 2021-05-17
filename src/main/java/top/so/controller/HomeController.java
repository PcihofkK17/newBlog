package top.so.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.BlogArticleDTO;
import top.so.service.BlogArticleService;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private BlogArticleService blogArticleService;

    @RequestMapping("")
    public ModelAndView home(BlogArticleDTO blogArticleDTO){
        List<BlogArticleDTO> blogArticleDTOList =blogArticleService.selectBlogArticleWithPage(blogArticleDTO,1);
       for(int i=0;i<blogArticleDTOList.size();i++){
           blogArticleDTOList.get(i).setArticleContent(blogArticleDTOList.get(i).getArticleContent().replaceAll("\\r|\\n","").replace(" ","").substring(1,100));
       }
        ModelAndView mv = new ModelAndView("home");
        //初始化页码
        mv.addObject("pageNum",1);
        mv.addObject("blogArticleDTOList",blogArticleDTOList);
        return mv;
    }

    @RequestMapping("loadMoreBlogArticleList")
    public ModelAndView loadMoreBlogArticleList(BlogArticleDTO blogArticleDTO, int pageNum){
        List<BlogArticleDTO> blogArticleDTOList =blogArticleService.selectBlogArticleWithPage(blogArticleDTO,pageNum);
        ModelAndView mv = new ModelAndView("home");
        System.out.println(pageNum);
        if(blogArticleDTOList.isEmpty()){
            mv.addObject("blogArticleDTOList",null);
            return mv;
        }
        for(int i=0;i<blogArticleDTOList.size();i++){
            blogArticleDTOList.get(i).setArticleContent(blogArticleDTOList.get(i).getArticleContent().replaceAll("\r|\n","").replace(" ","").substring(1,100));
        }
       mv.addObject("blogArticleDTOList",blogArticleDTOList);
        return mv;
    }

    /**
     *
     * @param articleID 文章ID
     * @return ModelAndView 设置参数（BlogArticleDTO对象）
     */
    @RequestMapping(value = "loadBlogArticle",method = {RequestMethod.GET})
    public ModelAndView loadBlogArticle(@RequestParam("articleID")String articleID){
        ModelAndView mv = new ModelAndView("blogPost");
        //根据文章ID（articleID）查找文章
       BlogArticleDTO blogArticleDTO =  blogArticleService.selectBlogArticle(articleID);
       //
        blogArticleDTO.setReadNum(blogArticleDTO.getReadNum()+1);
       blogArticleService.updateBlogArticle(blogArticleDTO);
       blogArticleDTO.setArticleContent(blogArticleDTO.getArticleContent().replaceAll("\\r|\\n","<br/>"));
       mv.addObject("blogArticleDTO",blogArticleDTO);
        return mv;
    }


}
