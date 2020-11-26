package kr.co.gdu.cash.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashRestMapper;

@Transactional
@Service
public class CashRestService {
	@Autowired CashRestMapper cashRestMapper;
	
	
	// 모든 연도 통합  1~12월 지출내역 
	public Map<String, Object> getTotalOutOfYear(int year){
		return cashRestMapper.selectTotalOutOfYear(year);
	}
	
	// 모든 연도 통합  1~12월 수입내역 
	public Map<String, Object> getTotalInOfYear(int year){
		return cashRestMapper.selectTotalInOfYear(year);
		
	}
	// 연도의 가장 큰 지출을 카테고리 별로 알수있는
	public Map<String,Object>getselectOutMaxCategoryYear(int year){
		
		return cashRestMapper.selectOutMaxCategoryYear(year);
	}
	
	// 2020 년  월 선택 주간  지출 내역 
	public Map<String,Object> getselectInCategoryYear(int year){
		return cashRestMapper.selectInCategoryYear(year);
	}
	
	// 2020 년  월 선택 주간  수입 내역 
	public Map<String,Object> getselectInWeekly(int month){
		return cashRestMapper.selectInWeekly(month);
	}
	
	
	

}