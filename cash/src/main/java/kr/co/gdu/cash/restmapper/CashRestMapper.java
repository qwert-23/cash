package kr.co.gdu.cash.restmapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface CashRestMapper {

	// 연도 통합  1~12월 지출내역 
	public Map<String, Object> selectTotalOutOfYear(int year);
	//  연도 통합  1~12월 수입내역 
	public Map<String, Object> selectTotalInOfYear(int year);
	// 2020 년  월 선택 주간  지출 내역 
	public Map<String, Object> selectInCategoryYear(int year);
	// 2020 년  월 선택 주간  수입 내역 
	public Map<String, Object> selectInWeekly(int month);
		//연도의 가장 큰 지출을 카테고리 별로 알수있는
	public Map<String, Object>selectOutMaxCategoryYear(int year);

}