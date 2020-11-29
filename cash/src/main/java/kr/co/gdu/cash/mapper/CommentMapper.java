package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	
	 int insertComment(Comment comment); //댓글 등록
	  
	 int deleteComment(int commentId); //댓글 삭제
}
