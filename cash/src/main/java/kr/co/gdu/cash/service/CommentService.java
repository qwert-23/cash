package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Transactional
@Service
public class CommentService {
	@Autowired
		  CommentMapper commentMapper;
	
		  
	public int getremoveComment(int commentId) { //댓글 삭제
		return commentMapper.deleteComment(commentId);
	}
	
	
	public int insertComment(Comment comment) { //댓글 작성
		return commentMapper.insertComment(comment);
	}
		

}
