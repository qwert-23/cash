package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashRestMapper {
		
	// 모든 연도 통합  1~12월 지출내역 
	public Map<String, Object> selectOutOfYear(int year);
	// 모든 연도 통합  1~12월 수입내역 
	public Map<String, Object> selectInOfYear(int year);
	// 2020 년  월 선택 주간  지출 내역 
	public Map<String, Object> selectOutWeekly(int month);
	// 2020 년  월 선택 주간  수입 내역 
	public Map<String, Object> selectInWeekly(int month);
	

}
