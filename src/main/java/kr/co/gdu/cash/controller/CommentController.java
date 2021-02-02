package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired 
		private CommentService commentService;
	//댓글 삭제
	
	@GetMapping("/admin/removeComment")
	public String removeComment(@RequestParam(value="commentId") int commentId,
							@RequestParam(value="noticeId") int noticeId) {
		commentService.getremoveComment(commentId);
		return "redirect:/admin/noticeOne/"+noticeId;
	}
		
	
	
	
		
		//댓글 입력
		@PostMapping("/admin/addComment")
		public String addComment(Comment comment) {
			commentService.insertComment(comment);
			
			return "redirect:/admin/noticeOne/" + comment.getNoticeId();
			
		}
		
		
		
		
}
