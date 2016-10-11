package jp.ac.oit.igakilab.webquiz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class QuizGetter {
	public List<String> getCurrentQuiz(int guestAnswerID) {
		List<String> list = new ArrayList<String>();
		DBController dr = new DBController();
		dr.beginTransaction();
		list.add(dr
				.doGet("SELECT quizString FROM guestanswer NATURAL JOIN currentquiz NATURAL JOIN quiz WHERE guestAnswerID = "
						+ guestAnswerID)[0]);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
		try {
			list.add(String.valueOf(sdf.parse(
					dr.doGet("SELECT quizDeadline FROM guestanswer NATURAL JOIN currentquiz WHERE guestAnswerID = "
							+ guestAnswerID)[0])
					.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dr.endTransaction();
		return list;
	}

	public List<QuizData> getCurrentQuizList() {
		List<QuizData> list = new ArrayList<QuizData>();
		DBController dbc = new DBController();
		dbc.beginTransaction();
		String[] currentQuiz = dbc.doGet("SELECT currentQuizID FROM currentquiz");
		for (String current : currentQuiz) {
			QuizData quiz = new QuizData();
			quiz.setquizID(Integer.valueOf(current));
			quiz.setquizOwnerName(dbc.doGet("SELECT quizOwnerName FROM quizowner NATURAL JOIN currentquiz"
										     + " WHERE currentQuizID = " + current)[0]);
			quiz.setquizAnswerNumber(dbc.doGet("SELECT guestAnswerID FROM guestanswer NATURAL JOIN currentquiz"
												+ " WHERE currentQuizID = " + current).length);
			int qs = Integer.parseInt(dbc.doGet("SELECT quizState FROM currentquiz WHERE currentQuizID = " + current)[0]);
			quiz.setisFinished(qs == 1);
			list.add(quiz);
		}
		dbc.endTransaction();
		return list;
	}

	public int quizJoin(String name) {
		DBController dr = new DBController();
		dr.beginTransaction();
		int quizID = Integer.parseInt(dr.doGet("SELECT currentQuizID FROM currentQuiz WHERE quizState = 0")[0]);
		String[] ids = dr.doGet("SELECT guestAnswerID FROM guestanswer");
		int guestID;
		if (ids.length == 0) {
			guestID = 1;
		} else {
			guestID = Integer.valueOf(ids[ids.length - 1]) + 1;
		}
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO guestanswer VALUES ('");
		sb.append(guestID);
		sb.append("', '");
		sb.append(name);
		sb.append("', '");
		sb.append(quizID);
		sb.append("', '0')");
		dr.doUpdate(sb.toString());
		dr.endTransaction();
		return guestID;
	}

	// 問題文, 自分の答え, 実際の答え, 問題の正答率
	public List<String> quizFinish(int guestAnswerID) {
		List<String> list = new ArrayList<String>();
		DBController dr = new DBController();
		dr.beginTransaction();
		int quizID = Integer.parseInt(dr
				.doGet("SELECT quizID FROM guestanswer NATURAL JOIN currentquiz NATURAL JOIN quiz WHERE guestAnswerID = "
						+ guestAnswerID)[0]);
		list.add(dr.doGet("SELECT quizString FROM quiz WHERE quizID = " + quizID)[0]);
		int guestans = Integer
				.parseInt(dr.doGet("SELECT answer FROM guestanswer WHERE guestAnswerID = " + guestAnswerID)[0]);
		list.add(answerConvert(guestans));
		int ans = Integer.parseInt(dr.doGet("SELECT quizAnswer FROM quiz WHERE quizID = " + quizID)[0]);
		list.add(answerConvert(ans));
		if (guestans > 0) {
			dr.doUpdate("UPDATE quiz SET answers = answers + 1 WHERE quizID = " + quizID);
			if (guestans == ans) {
				dr.doUpdate("UPDATE quiz SET corrects = corrects + 1 WHERE quizID = " + quizID);
			}
			dr.doUpdate("UPDATE guestanswer SET answer = -answer WHERE guestAnswerID = " + guestAnswerID);
		}
		int corrects = Integer.parseInt(dr.doGet("SELECT corrects FROM quiz WHERE quizID = " + quizID)[0]);
		int answers = Integer.parseInt(dr.doGet("SELECT answers FROM quiz WHERE quizID = " + quizID)[0]);
		if (answers == 0) {
			list.add("0%");
		} else {
			list.add(String.valueOf((int) (corrects * 100.0 / answers)) + "%");
		}

		list.add(dr.doGet("SELECT answerword FROM quiz WHERE quizID = " + quizID)[0]);
		dr.endTransaction();
		return list;
	}

	//○や×のところに語群を入れられるようにする
	private String answerConvert(int ans) {
		String str;
		ans = Math.abs(ans);
		if (ans == 1) {
			str = "○";
		} else if (ans == 2) {
			str = "×";
		} else {
			str = "未回答";
		}
		return str;
	}

	public void changeGuestAnswer(AnswerChangeRequest ans) {
		DBController dr = new DBController();
		int id = ans.getguestID();
		int answer = ans.getanswer();
		dr.doUpdate("UPDATE guestanswer SET answer = " + answer + " WHERE guestAnswerID = " + id);
	}

	public List<GuestAnswerData> getGuestAnswersData(int currentQuizID) {
		List<GuestAnswerData> data = new ArrayList<GuestAnswerData>();
		DBController dbc = new DBController();
		dbc.beginTransaction();
		String[] str = dbc.doGet("SELECT guestAnswerID, guestName, answer "
								+ "FROM guestanswer NATURAL JOIN currentquiz "
								+ "WHERE currentQuizID = " + currentQuizID);
		for (int i = 0; i < str.length; i += 3) {
			GuestAnswerData gad = new GuestAnswerData();
			gad.setguestID(Integer.parseInt(str[i]));
			gad.setguestName(str[i+1]);
			gad.setanswer(answerConvert(Integer.parseInt(str[i+2])));
			data.add(gad);
		}
		dbc.endTransaction();
		return data;
	}
	public String getDeadline(int currentQuizID) {
		DBController dr = new DBController();
		return dr.doGet("SELECT quizDeadline FROM currentquiz WHERE currentQuizID = " + currentQuizID)[0];
	}
}
