package top.so.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.so.dao.BlogArticleDao;
import top.so.dao.UserDao;
import top.so.dto.BlogArticleDTO;
import top.so.entity.BlogArticle;
import top.so.entity.User;
import top.so.service.BlogArticleService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


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

    public Boolean updateBlogArticle(BlogArticleDTO blogArticleDTO) {
        return blogArticleDao.updateBlogArticle(DTOToPOJO(blogArticleDTO));
    }

    public Boolean insertBlogArticle(BlogArticleDTO blogArticleDTO) {

        UUID uuid = UUID.randomUUID();
        blogArticleDTO.setArticleID(String.valueOf(uuid).replaceAll("-",""));
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        blogArticleDTO.setGenTime(formatter.format(date));
        return blogArticleDao.insertBlogArticle(DTOToPOJO(blogArticleDTO));
    }

    public Boolean deleteBlogArticle(BlogArticleDTO blogArticleDTO) {
        return blogArticleDao.deleteBlogArticle(DTOToPOJO(blogArticleDTO));
    }


    /**
     * @Author so
     * @Describe POJO???DTO ????????????????????????
     * @param blogArticle   //POJO?????????
     * @return  BlogArticleDTO DTO?????????
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




    /**
     * @Author so
     * @Describe POJO???DTO ????????????????????????
     * @param blogArticle   //POJO??????
     * @return  BlogArticleDTO DTO??????
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
     * @description DTO???POJO ????????????????????????
     * @param blogArticleDTO   //DTO?????????
     * @return  BlogArticle POJO?????????
     */
    private BlogArticle DTOToPOJO(BlogArticleDTO blogArticleDTO){
        BlogArticle blogArticle= new BlogArticle();
            if(blogArticleDTO!=null){
                User user = new User();
                user.setLoginName(blogArticleDTO.getUserName());
                user= getUserByName(userDao.selectUser(user),blogArticleDTO.getUserName());
                //????????????user?????????????????????UserID
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
     * ????????????????????????????????????????????????User????????????
     * @param userList
     * @param userName
     * @return User??????
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
