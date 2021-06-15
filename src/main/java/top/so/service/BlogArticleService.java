package top.so.service;



import top.so.dto.BlogArticleDTO;

import java.util.List;

public interface BlogArticleService {

    public List<BlogArticleDTO> selectBlogArticle(BlogArticleDTO blogArticleDTO);
    public List<BlogArticleDTO> selectBlogArticleWithPage(BlogArticleDTO blogArticleDTO, int pageNum);
    public BlogArticleDTO selectBlogArticle(String articleID);
    public Boolean updateBlogArticle(BlogArticleDTO blogArticleDTO);
    public Boolean insertBlogArticle(BlogArticleDTO blogArticleDTO);
    public Boolean deleteBlogArticle(BlogArticleDTO blogArticleDTO);
}
