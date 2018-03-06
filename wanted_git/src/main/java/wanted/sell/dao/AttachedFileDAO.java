package wanted.sell.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wanted.sell.dto.AttachedFileDTO;

public class AttachedFileDAO implements AttachedFileDAOImpl
{
	public AttachedFileDAO() {}
	
	@Override
	public HashMap<String, Object> insert(String originalfile, String serverfile, long file_size)
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("originalfile", originalfile);
		map.put("serverfile", serverfile);
		map.put("file_size", file_size);
		
		System.out.println("originalFileName : " + map.get("originalfile"));
		System.out.println("serverfile : " + map.get("serverfile"));
		System.out.println("file_size : " + map.get("file_size"));
		System.out.println("==========================");
		
		return map;
	}
	
	@Override
	public HashMap<String, Object> insertUpdate(String originalfile, String serverfile, 
			long file_size, String board_idx)
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_idx", board_idx);
		map.put("originalfile", originalfile);
		map.put("serverfile", serverfile);
		map.put("file_size", file_size);
		
		System.out.println("bord_idx : " + map.get("board_idx"));
		System.out.println("originalFileName : " + map.get("originalfile"));
		System.out.println("serverfile : " + map.get("serverfile"));
		System.out.println("file_size : " + map.get("file_size"));
		System.out.println("==========================");
		
		return map;
	}

	@Override
	public void insert(HashMap<String, Object> map) {}

	@Override
	public ArrayList<AttachedFileDTO> select(String board_idx) {
		return null;
	}

	@Override
	public String selectFile(String board_idx, String originalfile) {
		return null;
	}

	@Override
	public List<String> selectDelete(String board_idx) {
		return null;
	}

	@Override
	public void deleteFile(String board_idx) {}

	@Override
	public void insertUpdate(HashMap<String, Object> map) {}

	@Override
	public String selectFileDelete(String originalfile) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOneFile(String originalfile) {
		// TODO Auto-generated method stub
		
	}
	
}
