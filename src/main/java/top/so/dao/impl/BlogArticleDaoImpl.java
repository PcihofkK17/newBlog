package top.so.dao.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Repository;
import top.so.dao.AbstractBaseDao;
import top.so.dao.BlogArticleDao;
import top.so.entity.BlogArticle;

import java.util.List;

@Repository
public class BlogArticleDaoImpl extends AbstractBaseDao implements BlogArticleDao {
    private static int PAGENUM=0;

    public List<BlogArticle> selectAll(BlogArticle blogArticle) {

       return this.getSqlSession().selectList(this.getClass().getName()+".selectAll",blogArticle);
    }


    public List<BlogArticle> selectWithPage(BlogArticle blogArticle, int pageNum) {
       // pageNum:页码 pageSize每一页数据数量
        PageHelper.startPage(pageNum,2);

        return this.getSqlSession().selectList(this.getClass().getName()+".selectAll",blogArticle);
    }

    /**
     *
     * @param blogArticle
     * @return
     */

    public Boolean updateBlogArticle(BlogArticle blogArticle) {
        //成功返回1 失败返回0
       if(this.getSqlSession().update(this.getClass().getName()+".update",blogArticle)==1){
           return true;
       }
        return false;
    }

    /**
     *
     * @param blogArticle
     * @return 成功插入则返回真，否则返回假
     */
    public Boolean insertBlogArticle(BlogArticle blogArticle) {
        if(this.getSqlSession().insert(this.getClass().getName()+".insert",blogArticle)==1){
            return true;
        }
        return false;
    }


}
