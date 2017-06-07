package com.kdn.model.domain;

public class FileBean {
	private int no;
	private String rfilename;
	private String sfilename;
	private int bno;
	public FileBean(){}
	public FileBean(String filename, String sfilename) {
		this.rfilename = filename;
		this.sfilename = sfilename;
	}
	public FileBean(int no, String filename, String sfilename, int bno) {
		this.no = no;
		this.rfilename = filename;
		this.sfilename = sfilename;
		this.bno = bno;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FileBean [no=").append(no).append(", filename=").append(rfilename).append(", sfilename=")
				.append(sfilename).append(", bno=").append(bno).append("]");
		return builder.toString();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFilename() {
		return rfilename;
	}
	public void setFilename(String rfilename) {
		this.rfilename = rfilename;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	
	
	
	
}
