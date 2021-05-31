package top.so.dao;

import top.so.entity.Comment;

import java.util.List;

public interface CommentDao {
    public List<Comment> selectWithPage(Comment comment,int pageNum);
    public boolean insertComment(Comment comment);
}
