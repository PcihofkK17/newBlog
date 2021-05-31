package top.so.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.so.dao.CommentDao;
import top.so.dao.UserDao;
import top.so.dto.CommentDTO;
import top.so.entity.Comment;
import top.so.entity.User;
import top.so.service.CommentService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Service
public class CommentServiceImpl implements CommentService {


    @Autowired
    private CommentDao commentDao;
    @Autowired
    private UserDao userDao;

    public List<CommentDTO> selectCommentWithPage(CommentDTO commentDTO,int pageNum) {
        List<Comment> commentList = commentDao.selectWithPage(DTOToPOJO(commentDTO),pageNum);
        List<CommentDTO> commentDTOList = POJOToDTO(commentList);
        return commentDTOList;
    }



    public Boolean insertComment(CommentDTO commentDTO) {
        UUID uuid = UUID.randomUUID();
        commentDTO.setCommentID(String.valueOf(uuid).replaceAll("-",""));
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        commentDTO.setCommentDate( formatter.format(date));
        return commentDao.insertComment(DTOToPOJO(commentDTO));
    }




    private List<CommentDTO> POJOToDTO(List<Comment> commentList) {
        List<CommentDTO> commentDTOList = new ArrayList<CommentDTO>();
        CommentDTO temp;
        User user;
        for(Comment comment:commentList){
            temp = new CommentDTO();
            temp.setArticleID(comment.getArticleID());
            temp.setCommentContent(comment.getCommentContent());
            temp.setCommentDate(comment.getCommentDate().substring(0,comment.getCommentDate().indexOf(".")));
            //根据userid查找 用户名称（登录名）
            user = userDao.selectUser(comment.getUserID());
            temp.setUserName(user.getLoginName());
            temp.setCommentID(comment.getCommentID());
            commentDTOList.add(temp);
        }
        return commentDTOList;
    }

    private Comment DTOToPOJO(CommentDTO commentDTO) {
        Comment comment = new Comment();
        if(commentDTO!=null){
            comment.setArticleID(commentDTO.getArticleID());
            comment.setCommentContent(commentDTO.getCommentContent());
            comment.setCommentDate(commentDTO.getCommentDate());
            //根据用户名称查找用户，获取用户ID
            User user = getUserByName(commentDTO.getUserName());
            if(user!=null){
                comment.setUserID(user.getUserID());
            }
            comment.setCommentID(commentDTO.getCommentID());
        }
        return comment;
    }


    private User getUserByName(String userName){

        if(userName==null||userName.equals(""))
            return null;
        User user = new User();
        user.setLoginName(userName);
        User result =null;
        List<User> userList = userDao.selectUser(user);
        for(User u:userList){
            result = u;
        }
        return result;
    }


}
