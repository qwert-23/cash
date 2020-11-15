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
		 System.out.println("getSelectOutOfYear 호출성공");
		return cashRestMapper.selectOutOfYear(year);
	}
	

}
