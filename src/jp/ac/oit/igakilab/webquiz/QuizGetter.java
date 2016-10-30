package jp.ac.oit.igakilab.webquiz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

	public List<String> getCurrentQuiz2(int guestAnswerID) {
		List<String> list2 = new ArrayList<String>();
		DBController dr = new DBController();
		dr.beginTransaction();
		list2.add(dr
				.doGet("SELECT quizString FROM guestanswer2 NATURAL JOIN currentquiz NATURAL JOIN quiz2 WHERE guestAnswerID = "
						+ guestAnswerID)[0]);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
		try {
			list2.add(String.valueOf(sdf.parse(
					dr.doGet("SELECT quizDeadline FROM guestanswer2 NATURAL JOIN currentquiz WHERE guestAnswerID = "
							+ guestAnswerID)[0])
					.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		dr.endTransaction();
		return list2;
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

	public int quizJoin2(String name) {
		DBController dr = new DBController();
		dr.beginTransaction();
		int quizID = Integer.parseInt(dr.doGet("SELECT currentQuizID FROM currentQuiz WHERE quizState = 0")[0]);
		String[] ids = dr.doGet("SELECT guestAnswerID FROM guestanswer2");
		int guestID;
		if (ids.length == 0) {
			guestID = 1;
		} else {
			guestID = Integer.valueOf(ids[ids.length - 1]) + 1;
		}
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO guestanswer2 VALUES ('");
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
	public List<String> quizFinish2(int guestAnswerID) {
		List<String> list2 = new ArrayList<String>();
		DBController dr = new DBController();
		dr.beginTransaction();
		int quizID = Integer.parseInt(dr
				.doGet("SELECT quizID FROM guestanswer NATURAL JOIN currentquiz NATURAL JOIN quiz4select  WHERE guestAnswerID = "
						+ guestAnswerID)[0]);
		list2.add(dr.doGet("SELECT quizString FROM quiz4select WHERE quizID = " + quizID)[0]);
		int guestans = Integer
				.parseInt(dr.doGet("SELECT answer FROM guestanswer WHERE guestAnswerID = " + guestAnswerID)[0]);
		list2.add(answerConvert2(guestans));
		int ans = Integer.parseInt(dr.doGet("SELECT quizAnswer FROM quiz4select WHERE quizID = " + quizID)[0]);
		list2.add(answerConvert2(ans));
		if (guestans > 0) {
			dr.doUpdate("UPDATE quiz4select SET answers = answers + 1 WHERE quizID = " + quizID);
			if (guestans == ans) {
				dr.doUpdate("UPDATE quiz4select SET corrects = corrects + 1 WHERE quizID = " + quizID);
			}
			dr.doUpdate("UPDATE guestanswer SET answer = -answer WHERE guestAnswerID = " + guestAnswerID);
		}
		int corrects = Integer.parseInt(dr.doGet("SELECT corrects FROM quiz4select WHERE quizID = " + quizID)[0]);
		int answers = Integer.parseInt(dr.doGet("SELECT answers FROM quiz4select WHERE quizID = " + quizID)[0]);
		if (answers == 0) {
			list2.add("0%");
		} else {
			list2.add(String.valueOf((int) (corrects * 100.0 / answers)) + "%");
		}

		dr.endTransaction();
		return list2;
	}


	public List<String> quizFinish3(int guestAnswerID) {
		List<String> list3 = new ArrayList<String>();
		DBController dr = new DBController();
		dr.beginTransaction();
		int quizID = Integer.parseInt(dr
				.doGet("SELECT quizID FROM guestanswer2 NATURAL JOIN currentquiz NATURAL JOIN quiz2 WHERE guestAnswerID = "
						+ guestAnswerID)[0]);
		list3.add(dr.doGet("SELECT quizString FROM quiz2 WHERE quizID = " + quizID)[0]);
		int guestans = Integer
				.parseInt(dr.doGet("SELECT answer FROM guestanswer2 WHERE guestAnswerID = " + guestAnswerID)[0]);
		list3.add(answerConvert(guestans));
		int ans = Integer.parseInt(dr.doGet("SELECT quizAnswer FROM quiz2 WHERE quizID = " + quizID)[0]);
		list3.add(answerConvert(ans));
		if (guestans > 0) {
			dr.doUpdate("UPDATE quiz2 SET answers = answers + 1 WHERE quizID = " + quizID);
			if (guestans == ans) {
				dr.doUpdate("UPDATE quiz2 SET corrects = corrects + 1 WHERE quizID = " + quizID);
			}
			dr.doUpdate("UPDATE guestanswer SET answer = -answer WHERE guestAnswerID = " + guestAnswerID);
		}
		int corrects = Integer.parseInt(dr.doGet("SELECT corrects FROM quiz2 WHERE quizID = " + quizID)[0]);
		int answers = Integer.parseInt(dr.doGet("SELECT answers FROM quiz2 WHERE quizID = " + quizID)[0]);
		if (answers == 0) {
			list3.add("0%");
		} else {
			list3.add(String.valueOf((int) (corrects * 100.0 / answers)) + "%");
		}

		list3.add(dr.doGet("SELECT answerword FROM quiz2 WHERE quizID = " + quizID)[0]);
		dr.endTransaction();
		return list3;
	}

	//○や×のところに語群を入れられるようにする
	private String answerConvert(int ans) {
		String str;
		ans = Math.abs(ans);
		if (ans == 1) {
			str = "○";
		} else if (ans == 2) {
			str = "×";
		}
		else {
			str = "未回答";
		}
		return str;
	}



	private String answerConvert2(int ans) {
		String str;
		ans = Math.abs(ans);
		if (ans == 1) {
			str = "1";
		} else if (ans == 2) {
			str = "2";
		} else if (ans == 3) {
			str = "3";
		}
		 else if (ans == 4) {
				str = "4";
			}
		else {
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

	public void changeGuestAnswer2(AnswerChangeRequest ans) {
		DBController dr = new DBController();
		int id = ans.getguestID();
		int answer = ans.getanswer();
		dr.doUpdate("UPDATE guestanswer2 SET answer = " + answer + " WHERE guestAnswerID = " + id);
	}







	public String getDeadline(int currentQuizID) {
		DBController dr = new DBController();
		return dr.doGet("SELECT quizDeadline FROM currentquiz WHERE currentQuizID = " + currentQuizID)[0];
	}


	public static void QuizChange(){

			DBController dr = new DBController();
			dr.beginTransaction();
			// 11分経ったクイズを削除
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
			//Date dead = new Date(System.currentTimeMillis() - 10000 * 55);
			//dr.doUpdate(
					//"DELETE currentquiz, guestanswer FROM currentquiz LEFT JOIN guestanswer ON currentquiz.currentQuizID = guestanswer.currentQuizID WHERE quizDeadline < '"
							//+ sdf.format(dead) + "'");
			// 1分経ったクイズを答え合わせ専用に
			//Date now = new Date();
			//dr.doUpdate("UPDATE currentquiz SET quizState = 1 WHERE quizDeadline < '" + sdf.format(now) + "'");


			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO currentquiz VALUES ('");
			sb.append((int) (Math.random() * 1000 + 1));
			sb.append("', '0', '");
			sb.append((int) (Math.random() * 10 + 1));

			//sb.append((int) (Math.random() * dr.doGet("select quizID from quiz").length + 1));//
			sb.append("', '");
			Date deadline = new Date(System.currentTimeMillis() + 1000 * 55);
			sb.append(sdf.format(deadline));
			sb.append("', '0', '0', '0')");
			dr.doUpdate(sb.toString());
			dr.endTransaction();
		}




}
