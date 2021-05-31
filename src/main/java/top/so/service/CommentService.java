package top.so.service;

import top.so.dto.CommentDTO;

import java.util.List;

public interface CommentService {
    public List<CommentDTO> selectCommentWithPage(CommentDTO commentDTO,int pageNum);
    public Boolean insertComment(CommentDTO commentDTO);
}
