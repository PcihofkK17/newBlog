package top.so.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import top.so.dto.CommentDTO;
import top.so.service.CommentService;

import java.util.List;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "leaveComment",method = RequestMethod.POST)
    public ModelAndView leaveComment(CommentDTO commentDTO){

        ModelAndView mv = new ModelAndView("main/blogPost");
        if(commentService.insertComment(commentDTO)){
            //评论添加成功
        }
        CommentDTO selectParam = new CommentDTO();
        selectParam.setArticleID(commentDTO.getArticleID());
       List<CommentDTO> commentDTOList = commentService.selectCommentWithPage(selectParam,1);
       if(!commentDTOList.isEmpty()){
           mv.addObject("commentDTOList",commentDTOList);
       }
        return mv;
    }

    @RequestMapping(value = "goPage",method = RequestMethod.POST)
    public ModelAndView goPage(String articleID,int pageNum){
        ModelAndView mv = new ModelAndView("main/blogPost");
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setArticleID(articleID);
        List<CommentDTO> commentDTOList = commentService.selectCommentWithPage(commentDTO,pageNum);
        mv.addObject("commentDTOList",commentDTOList);
        return mv;
    }



}
