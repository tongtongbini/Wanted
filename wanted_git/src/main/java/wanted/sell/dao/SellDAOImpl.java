package wanted.sell.dao;

import java.util.ArrayList;

import wanted.sell.dto.SellDTO;

public interface SellDAOImpl
{
	// 판매 물품 등록
	public int write(String brand, String model, String grade,
			String year, String km, String fuel,
			String transmission, String title, String contents,
			String price, String id);

	// 판매 물품 리스트 출력
	public ArrayList<SellDTO> list();

	// 판매 물품 상세보기
	public SellDTO view(String idx);

	// 판매글 수정
	public int modify(String idx, String brand, String model, String grade,
			String year, String km, String fuel,
			String transmission, String title, String contents, String price);

	// 판매글 삭제
	public int delete(String idx);

	// 판매완료
	public void complete(String title, String id);
}
