package kr.co.gdu.cash.restcontoller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashRestService;

@RestController
public class CashRestController {

	@Autowired CashRestService cashRestService;
	
	// 모든 연도 통합  1~12월 지출내역 
	@GetMapping("/admin/selectOutOfYear/{year}")
	public Map<String, Object> selectOutOfYear( @PathVariable(name="year")
		int year){
		 System.out.println("selectOutOfYear 호출성공");
		Map<String,Object> map = cashRestService.getSelectOutOfYear(year);
		return map;
	}
	
	
}
