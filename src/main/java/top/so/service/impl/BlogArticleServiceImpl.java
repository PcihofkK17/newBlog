package top.so.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.so.dao.BlogArticleDao;
import top.so.dao.UserDao;
import top.so.dto.BlogArticleDTO;
import top.so.entity.BlogArticle;
import top.so.entity.User;
import top.so.service.BlogArticleService;

import java.util.ArrayList;
import java.util.List;


@Service
public class BlogArticleServiceImpl implements BlogArticleService {

   @Autowired
    private BlogArticleDao blogArticleDao;
   @Autowired
    private UserDao userDao;



    public List<BlogArticleDTO> selectBlogArticle(BlogArticleDTO blogArticleDTO) {

        List<BlogArticleDTO> blogArticleDTOList;
        List<BlogArticle> blogArticleList =  blogArticleDao.selectAll(DTOToPOJO(blogArticleDTO));
            blogArticleDTOList = POJOListToDTOList(blogArticleList);
                 return blogArticleDTOList;
    }


    public List<BlogArticleDTO> selectBlogArticleWithPage(BlogArticleDTO blogArticleDTO, int pageNum) {

        List<BlogArticle> blogArticleList =  blogArticleDao.selectWithPage(DTOToPOJO(blogArticleDTO),pageNum);
        List<BlogArticleDTO>   blogArticleDTOList = POJOListToDTOList(blogArticleList);
        return  blogArticleDTOList;
    }


    public BlogArticleDTO selectBlogArticle(String articleID) {
        BlogArticle blogArticle = new BlogArticle();
        blogArticle.setArticleID(articleID);
        List<BlogArticle> blogArticleList = blogArticleDao.selectAll(blogArticle);
        BlogArticleDTO blogArticleDTO = null;

             blogArticleDTO = POJOToDTO(blogArticleList);
        return blogArticleDTO;
    }


    /**
     * @Author so
     * @Describe POJO转DTO 数据用于页面显示
     * @param blogArticle   //POJO对象集
     * @return  BlogArticleDTO DTO对象集
     */
    private List<BlogArticleDTO> POJOListToDTOList(List<BlogArticle> blogArticle){
        List<BlogArticleDTO> result = new ArrayList<BlogArticleDTO>();
        BlogArticleDTO temp;
        User user;
        for (BlogArticle ba:blogArticle) {
            temp = new BlogArticleDTO();
            temp.setArticleID(ba.getArticleID());
            temp.setArticleName(ba.getArticleName());
            temp.setArticleContent(ba.getArticleContent());
            temp.setReadNum(ba.getReadNum());
            temp.setLikeNum(ba.getLikeNum());
            temp.setGenTime(ba.getGenTime().substring(0,ba.getGenTime().indexOf(".")));
            temp.setCommentNum(ba.getCommentNum());
            user = userDao.selectUser(ba.getUserID());
            temp.setUserName(user.getLoginName());
            result.add(temp);
        }
        return result;
    }


    public Boolean updateBlogArticle(BlogArticleDTO blogArticleDTO) {
        return blogArticleDao.updateBlogArticle(DTOToPOJO(blogArticleDTO));
    }

    /**
     * @Author so
     * @Describe POJO转DTO 数据用于页面显示
     * @param blogArticle   //POJO对象
     * @return  BlogArticleDTO DTO对象
     */
    private BlogArticleDTO POJOToDTO(List<BlogArticle> blogArticle){
        BlogArticleDTO result = null;
        User user;
        for (BlogArticle ba:blogArticle) {
            result = new BlogArticleDTO();
            result.setArticleID(ba.getArticleID());
            result.setArticleName(ba.getArticleName());
            result.setArticleContent(ba.getArticleContent());
            result.setReadNum(ba.getReadNum());
            result.setLikeNum(ba.getLikeNum());
            result.setGenTime(ba.getGenTime().substring(0,ba.getGenTime().indexOf(".")));
            result.setCommentNum(ba.getCommentNum());
            user = userDao.selectUser(ba.getUserID());
            result.setUserName(user.getLoginName());
            return result;
        }
        return null;
    }





    /**
     * @author so
     * @description DTO转POJO 数据用于页面显示
     * @param blogArticleDTO   //DTO对象集
     * @return  BlogArticle POJO对象集
     */
    private BlogArticle DTOToPOJO(BlogArticleDTO blogArticleDTO){
        BlogArticle blogArticle= new BlogArticle();
            if(blogArticleDTO!=null){
                User user = new User();
                user.setLoginName(blogArticleDTO.getUserName());
                user= getUserByName(userDao.selectUser(user),blogArticleDTO.getUserName());
                //如果对象user不为空，则设置UserID
                if(user!=null)
                blogArticle.setUserID(user.getUserID());
                blogArticle.setArticleID(blogArticleDTO.getArticleID());
                blogArticle.setArticleName(blogArticleDTO.getArticleName());
                blogArticle.setArticleContent(blogArticleDTO.getArticleContent());
                blogArticle.setReadNum(blogArticleDTO.getReadNum());
                blogArticle.setLikeNum(blogArticleDTO.getLikeNum());
                blogArticle.setGenTime(blogArticleDTO.getGenTime());
                blogArticle.setCommentNum(blogArticleDTO.getCommentNum());
            }
        return blogArticle;
    }


    /**
     * 根据用户名（登录账号）找出改用户User对象信息
     * @param userList
     * @param userName
     * @return User对象
     */
    private User getUserByName(List<User> userList,String userName){
        for(User u:userList){
            if(u.getLoginName().equals(userName)){
                return u;
            }
        }
        return null;
    }

}
