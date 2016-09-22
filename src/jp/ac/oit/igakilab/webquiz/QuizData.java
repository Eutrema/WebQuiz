package jp.ac.oit.igakilab.webquiz;

public class QuizData {
	private int quizID;
	private String quizOwnerName;
	private int quizAnswerNumber;
	private boolean isFinished;
	public int getquizID() {
		return quizID;
	}
	public void setquizID(int quizID) {
		this.quizID = quizID;
	}
	public String getquizOwnerName() {
		return quizOwnerName;
	}
	public void setquizOwnerName(String quizOwnerName) {
		this.quizOwnerName = quizOwnerName;
	}
	public int getquizAnswerNumber() {
		return quizAnswerNumber;
	}
	public void setquizAnswerNumber(int quizAnswerNumber) {
		this.quizAnswerNumber = quizAnswerNumber;
	}
	public boolean getisFinished() {
		return isFinished;
	}
	public void setisFinished(boolean isFinished) {
		this.isFinished = isFinished;
	}
}