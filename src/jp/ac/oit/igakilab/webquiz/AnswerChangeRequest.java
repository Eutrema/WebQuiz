package jp.ac.oit.igakilab.webquiz;

public class AnswerChangeRequest {
	private int guestID = 0;
	private int answer = 0;

	public AnswerChangeRequest() {
	}

	public int getguestID() {
		return guestID;
	}

	public void setguestID(int guestID) {
		this.guestID = guestID;
	}

	public int getanswer() {
		return answer;
	}

	public void setanswer(int answer) {
		this.answer = answer;
	}
}
