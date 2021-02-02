
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
	
	
	// 모든 연도 통합  1~12월 통합 지출내역 
	@GetMapping("/selectTotalOutOfYear/{year}")
	public Map<String, Object> selectTotalOutOfYear( @PathVariable(name="year")
		int year){
		System.out.println("*********************selectTotalOutOfYear"+year+"*********************************");
		return  cashRestService.getTotalOutOfYear(year);
	
	}
	
	
	// 모든 연도 통합  1~12월 통합수 수입 내역 
	@GetMapping("/selectTotalInOfYear/{year}")
	public Map<String, Object> selectInOfYear( @PathVariable(name="year")
		int year){
		System.out.println("*********************selectInOfYear"+year+"*********************************");
		return  cashRestService.getTotalInOfYear(year);
	
	}
		//연도의 가장 큰 지출을 카테고리 별로 알수있는
	@GetMapping("/selectOutMaxCategoryYear/{year}")
	public Map<String, Object> selectOutMaxCategoryYear(@PathVariable(name="year")
	int year){
		System.out.println("*********************selectOutMaxCategoryYear"+year+"*********************************");
		return  cashRestService.getselectOutMaxCategoryYear(year);
	}
	
	@GetMapping("/selectInCategoryYear/{year}")
	public Map<String, Object> selectInCategoryYear(@PathVariable(name="year")
	int year){
		System.out.println("*********************selectInCategoryYear"+year+"*********************************");
		return  cashRestService.getselectInCategoryYear(year);
	}
	

}