package jp.ac.oit.igakilab.webquiz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class QuizChangeServlet extends HttpServlet {

	private QuizChangeTask task = null;

	public void init(ServletConfig config) throws ServletException {
		start();
	}

	private void start() {
		if (task == null) {
			task = new QuizChangeTask();
		}
		Timer timer = new Timer(true);
		timer.schedule(task, 0, 60000);
	}

	private class QuizChangeTask extends TimerTask {
		public void run() {
			DBController dr = new DBController();
			dr.beginTransaction();
			// 11分経ったクイズを削除
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd' 'HH':'mm':'ss");
			Date dead = new Date(System.currentTimeMillis() - 10000 * 60);
			dr.doUpdate(
					"DELETE currentquiz, guestanswer FROM currentquiz LEFT JOIN guestanswer ON currentquiz.currentQuizID = guestanswer.currentQuizID WHERE quizDeadline < '"
							+ sdf.format(dead) + "'");
			// 1分経ったクイズを答え合わせ専用に
			Date now = new Date();
			dr.doUpdate("UPDATE currentquiz SET quizState = 1 WHERE quizDeadline < '" + sdf.format(now) + "'");

			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO currentquiz VALUES ('");
			sb.append((int) (Math.random() * 1000 + 1));
			sb.append("', '0', '");
			sb.append((int) (Math.random() * 2 + 1));
			sb.append("', '");
			Date deadline = new Date(System.currentTimeMillis() + 1000 * 55);
			sb.append(sdf.format(deadline));
			sb.append("', '0', '0', '0')");
			dr.doUpdate(sb.toString());
			dr.endTransaction();
		}
	}
}
