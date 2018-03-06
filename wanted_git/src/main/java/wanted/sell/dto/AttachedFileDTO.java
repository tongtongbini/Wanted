package wanted.sell.dto;

public class AttachedFileDTO
{
	private int idx;
	private String board_idx;
	private String originalfile;
	private String serverfile;
	private long file_size;
	
	public AttachedFileDTO() {}
	
	public AttachedFileDTO(int idx, String board_idx, String originalfile, String serverfile, long file_size) {
		this.idx = idx;
		this.board_idx = board_idx;
		this.originalfile = originalfile;
		this.serverfile = serverfile;
		this.file_size = file_size;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}
	public String getOriginalfile() {
		return originalfile;
	}
	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}
	public String getServerfile() {
		return serverfile;
	}
	public void setServerfile(String serverfile) {
		this.serverfile = serverfile;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
    
}
