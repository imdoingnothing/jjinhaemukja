package recipe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Recipe implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1116533018259162170L;
	
	private int bNo;
	private String bTitle;
	private Date bDate;
	private String bContent;
	private int bUp;
	private int bDown;
	private int bViews;
	private String mId;
	private String nCode;
	
	public Recipe() {
		super();
	}

	public Recipe(int bNo, String bTitle, Date bDate, String bContent, int bUp, int bDown, int bViews, String mId,
			String nCode) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bDate = bDate;
		this.bContent = bContent;
		this.bUp = bUp;
		this.bDown = bDown;
		this.bViews = bViews;
		this.mId = mId;
		this.nCode = nCode;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbUp() {
		return bUp;
	}

	public void setbUp(int bUp) {
		this.bUp = bUp;
	}

	public int getbDown() {
		return bDown;
	}

	public void setbDown(int bDown) {
		this.bDown = bDown;
	}

	public int getbViews() {
		return bViews;
	}

	public void setbViews(int bViews) {
		this.bViews = bViews;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getnCode() {
		return nCode;
	}

	public void setnCode(String nCode) {
		this.nCode = nCode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Recipe [bNo=" + bNo + ", bTitle=" + bTitle + ", bDate=" + bDate + ", bContent=" + bContent + ", bUp="
				+ bUp + ", bDown=" + bDown + ", bViews=" + bViews + ", mId=" + mId + ", nCode=" + nCode + "]";
	}

}
