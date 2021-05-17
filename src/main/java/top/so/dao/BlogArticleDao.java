package top.so.dao;

import top.so.entity.BlogArticle;

import java.util.List;

public interface BlogArticleDao {

    public List<BlogArticle> selectAll(BlogArticle blogArticle);
    public List<BlogArticle> selectWithPage(BlogArticle blogArticle, int pageNum);
    public Boolean updateBlogArticle(BlogArticle blogArticle);
}
