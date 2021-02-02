package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;


@Mapper
public interface NoticefileMapper {
	int insertNoticefile(Noticefile noticfile); //파일의 등록
	List<String>selectNoticefileNameList(int noticeId); //파일의 목록
	int deleteAllNoticefile(int noticeId); // 파일의 삭제
	
}
