package spring.vo;



public class PicTest {
	private String orifile;
	private String filepath;
	private long filesize;
	
	
	public PicTest() {}
	
	
	
	public PicTest(String orifile, String filepath, long filesize) {
		this.orifile = orifile;
		this.filepath = filepath;
		this.filesize = filesize;
	}

	public String getOrifile() {
		return orifile;
	}
	public PicTest setOrifile(String orifile) {
		this.orifile = orifile;
		return this;
	}
	public String getFilepath() {
		return filepath;
	}
	public PicTest setFilepath(String filepath) {
		this.filepath = filepath;
		return this;
	}

	public long getFilesize() {
		return filesize;
	}
	public PicTest setFilesize(long filesize) { 
		this.filesize = filesize;
		return this;
	}
	
	
	
	
	
}
