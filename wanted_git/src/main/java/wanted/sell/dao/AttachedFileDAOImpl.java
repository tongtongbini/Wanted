package wanted.sell.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wanted.sell.dto.AttachedFileDTO;


public interface AttachedFileDAOImpl
{
	public void insert(HashMap<String, Object> map);
	
	public void insertUpdate(HashMap<String, Object> map);
	
	public HashMap<String, Object> insert(String originalfile, String serverfile, long file_size);
	
	public HashMap<String, Object> insertUpdate(String originalfile, String serverfile, long file_size, String board_idx);
	
	public ArrayList<AttachedFileDTO> select(String board_idx);
	
	public String selectFile(String board_idx, String originalfile);
	
	public List<String> selectDelete(String board_idx);
	
	public String selectFileDelete(String originalfile);
	
	public void deleteFile(String board_idx);
	
	public void deleteOneFile(String originalfile);
}
