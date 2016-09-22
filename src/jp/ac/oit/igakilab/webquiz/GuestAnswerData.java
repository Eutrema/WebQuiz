package jp.ac.oit.igakilab.webquiz;


public class GuestAnswerData {
	private int guestID = 0;
	private String guestName = "";
	private String answer = "";

	public GuestAnswerData() {
	}

	public int getguestID() {
		return guestID;
	}

	public void setguestID(int guestID) {
		this.guestID = guestID;
	}

	public String getguestName() {
		return guestName;
	}

	public void setguestName(String guestName) {
		this.guestName = guestName;
	}

	public String getanswer() {
		return answer;
	}

	public void setanswer(String answer) {
		this.answer = answer;
	}
}
