package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	// 공지 목록
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
							@PathVariable(value = "currentPage") int currentPage) {
		int rowPerPage=5;
		int countPage = noticeService.getTotalCount();
		int lastPage= 0;
		if ((countPage % rowPerPage)==0) {
			lastPage = countPage/rowPerPage;
		}else if ((countPage % rowPerPage) !=0) {
			lastPage = (countPage/rowPerPage)+1;
		}
		
		List<Notice>noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
	
		return "noticeList";
	}
	
	
	
	// 공지 입력 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	// 공지 입력 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		noticeService.addNotice(noticeForm);
		return "redirect:/admin/noticeList/1";
	}
	
	
	// 공지 상세 보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model, 
			@PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "noticeOne";
	}
	
	// 공지 삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(@RequestParam(value = "noticeId") int noticeId) {
		return "redirect:/admin/noticeList";
	}
	// 공지 수정 폼
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, @RequestParam(value = "noticeId") int noticeId) {
		return "modifyNotice";
	}
	// 공지 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		return "redirect:/admin/noticeOne?noticeId="+notice.getNoticeId();
	}
}
