package top.so.dao.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Repository;
import top.so.dao.AbstractBaseDao;
import top.so.dao.CommentDao;
import top.so.entity.Comment;

import java.util.List;

@Repository
public class CommentDaoImpl extends AbstractBaseDao implements CommentDao {

    public List<Comment> selectWithPage(Comment comment,int pageNum) {
        PageHelper.startPage(pageNum,6);
        return this.getSqlSession().selectList(this.getClass().getName()+".select",comment);
    }

    public boolean insertComment(Comment comment) {
        //成功返回1 失败返回0
        if(this.getSqlSession().insert(this.getClass().getName()+".insertComment",comment)==1){
            return true;
        }
        return false;
    }
}
