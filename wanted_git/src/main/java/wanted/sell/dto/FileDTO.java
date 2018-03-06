package wanted.sell.dto;

public class FileDTO
{
	private String idx;
	private String board_idx;
	private String originalfile;
	private String serverfile;
	private long file_size;
	
	public FileDTO() {}
	
	public FileDTO(String idx, String board_idx, String originalfile, String serverfile, long file_size) {
		super();
		this.idx = idx;
		this.board_idx = board_idx;
		this.originalfile = originalfile;
		this.serverfile = serverfile;
		this.file_size = file_size;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
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
