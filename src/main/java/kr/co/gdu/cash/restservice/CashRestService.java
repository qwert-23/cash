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
	public Map<String, Object> getSelectOutOfYear(int year){
		
		return cashRestMapper.selectOutOfYear(year);
	}
	
	// 모든 연도 통합  1~12월 수입내역 
	public Map<String, Object> getSslectInOfYear(int year){
			
		return cashRestMapper.selectInOfYear(year);
		
	}
	
	// 2020 년  월 선택 주간  지출 내역 
	public Map<String,Object> getselectOutWeekly(int month){
		
		return cashRestMapper.selectOutWeekly(month);
	}
	
	// 2020 년  월 선택 주간  수입 내역 
	public Map<String,Object> getselectInWeekly(int month){
		
		return cashRestMapper.selectInWeekly(month);
	}
	
	
	

}
