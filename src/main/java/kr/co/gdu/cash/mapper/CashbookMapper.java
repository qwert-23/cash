package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;


@Mapper
public interface CashbookMapper {
	// Map : beginRow, rowPerPage
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map); 
	
	// 전체 cashbookList  엑셀파일
	List<Cashbook> selectCashbookListAll();
	
	// 가계부 지출/수익 추가
	int insertCashbook(Cashbook cashbook);
	
	// 가계부 지출/수익 수정
	int updateCashbook(Cashbook cashbook);
	
	// 가계부 지출/수익 삭제
	int deleteCashbook(int cashbookId);
	
	
	//차트
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
}
