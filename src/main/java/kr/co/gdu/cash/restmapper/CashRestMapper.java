package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashRestMapper {
		
	// 모든 연도 통합  1~12월 지출내역 
	public Map<String, Object> selectOutOfYear(int year);
	

}
