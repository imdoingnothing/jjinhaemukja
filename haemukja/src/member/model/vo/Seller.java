package member.model.vo;

import java.io.Serializable;

public class Seller implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -951810464657238823L;
	
	private String sid;
	private String spw; 
	private String company;
	private String stel; 
	private String caddr; 
	private String cno;  
	private String sout; 
	private String scode;
	   
	public Seller(String sid, String spw, String company, String stel, String caddr, String cno, String sout, String scode) {
		this.sid = sid;
	    this.spw = spw;
	    this.company = company;
	    this.stel = stel;
	    this.caddr = caddr;
	    this.cno = cno;
	    this.sout = sout;
	    this.scode = scode;
	}
	
	public Seller(String sid, String spw) {
		this.sid = sid;
	    this.spw = spw;
	}
	
	
	public Seller(String sid, String spw, String company, String stel, String caddr, String cno, String scode) {
		this.sid = sid;
	    this.spw = spw;
	    this.company = company;
	    this.stel = stel;
	    this.caddr = caddr;
	    this.cno = cno;
	    this.scode = scode;
	}

	public String getSid() {
	    return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSpw() {
	    return spw;
	}
	public void setSpw(String spw) {
	    this.spw = spw;
	}
	public String getCompany() {
	    return company;
	}
	public void setCompany(String company) {
	    this.company = company;
	}
	public String getStel() {
	    return stel;
	}
	public void setStel(String stel) {
		
	    this.stel = stel;
	}
	public String getCaddr() {
	    return caddr;
	}
	public void setCaddr(String caddr) {
	    this.caddr = caddr;
	}
	public String getCno() {
	    return cno;
	}
	public void setCno(String cno) {
	    this.cno = cno;
	}
	public String getSout() {
	    return sout;
	}
	public void setSout(String sout) {
	    this.sout = sout;
	}
	
	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public static long getSerialversionuid() {
	    return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Seller [sid=" + sid + ", spw=" + spw + ", company=" + company + ", stel=" + stel + ", caddr=" + caddr
				+ ", cno=" + cno + ", sout=" + sout + ", scode=" + scode + "]";
	}

}
