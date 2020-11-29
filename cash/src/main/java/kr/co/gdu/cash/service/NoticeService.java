package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service 
@Transactional
public class NoticeService {
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
		private final String PATH =  "C:\\Users\\kang\\Downloads\\git2\\cash\\cash\\src\\main\\webapp\\upload";
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	@Autowired private CommentMapper commentMapper;
	
	
	//상세보기
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
		
	}
	// 공지사항 작성
	public void addNotice(NoticeForm noticeForm) {
		logger.debug("**************************************");
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.insertNotice(notice); 
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefileList() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefile.add(nf);
				logger.debug("for문:"+nf);
				
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {	//예외 발생처리
					e.printStackTrace(); 
					throw new RuntimeException();
				}
				
			}
		}
	
		if(noticefile !=null) {
			for(Noticefile nf: noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
			
			
		}
	}
		

	// notice 페이징
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage){	//페이징
		int beginRow =(currentPage -1)* rowPerPage;
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("beginRow",beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Notice>noticeList = noticeMapper.selectNoticeListByPage(map);
		
		return noticeList;
	}
	
	public int getTotalCount() {	
		return noticeMapper.selectTotalCount();
	}
	
	
	public Map<String, Object> getNoticeAndInOutList() { 
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	
	
	public List<Notice> getNoticeList() {
		return noticeMapper.selectLatestNoiceList();
	}
}
