package jp.ac.oit.igakilab.webquiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBController {
	// スキーマ名、ユーザ名、パスワードはMySQLとの接続に必要なため
	// ここで定数として定義しておく、使う時はここ変えてね
	private static final String SCHEMA = "test";
	private static final String USER = "user";
	private static final String PASSWORD = "smash";
	private Connection connection = null;
	private Statement statement = null;
	private boolean isTransactionStarted = false;

	public void beginTransaction() {
		if (connection != null || statement != null) {
			return;
		}
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// DBとのコネクションを張る
			connection = DriverManager
					.getConnection("jdbc:mysql://localhost/" + SCHEMA + "?user=" + USER + "&password=" + PASSWORD);
			connection.setAutoCommit(false);
			statement = connection.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		isTransactionStarted = true;
	}

	public void endTransaction() {
		try {
			connection.commit();
			if (statement != null) {
				statement.close();
				statement = null;
			}
			if (connection != null) {
				connection.close();
				connection = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		isTransactionStarted = false;
	}

	private void doTransactionUpdate(String sql) {
		try {
			statement.executeUpdate(sql);
		} catch (Exception e) {
			// 例外処理(スタックトレースを表示)
			e.printStackTrace();
		}
	}

	private String[] doTransactionGet(String sql) {
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try {
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
					list.add(rs.getString(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list.toArray(new String[0]);
	}

	public void doUpdate(String sql) {
		if (isTransactionStarted) {
			doTransactionUpdate(sql);
			return;
		}
		// DBとのコネクション
		Connection conn = null;
		// DBの状態
		Statement stmt = null;
		// ファイルに触る関係上例外発生の可能性があるためcatchできるように
		try {
			// DBと接続するのに必要,詳しく知りたいなら"Class.forName"で検索(難しい話が山ほど出てくる)
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// DBとのコネクションを張る
			conn = DriverManager
					.getConnection("jdbc:mysql://localhost/" + SCHEMA + "?user=" + USER + "&password=" + PASSWORD);
			// DBの状態を生成(？)
			stmt = conn.createStatement();
			// SQL文を実行
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			// 例外処理(スタックトレースを表示)
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public String[] doGet(String sql) {
		if (isTransactionStarted) {
			return doTransactionGet(sql);
		}

		Connection conn = null;
		Statement stmt = null;
		// DBにSQL文を投げて戻ってきた結果
		ResultSet rs = null;
		// 結果を1つずつ格納するリスト
		List<String> list = new ArrayList<String>();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager
					.getConnection("jdbc:mysql://localhost/" + SCHEMA + "?user=" + USER + "&password=" + PASSWORD);
			stmt = conn.createStatement();
			// SQL文を実行し結果をrsに格納
			rs = stmt.executeQuery(sql);

			// SQL文の結果が空になるまで1行ずつ読み込み
			while (rs.next()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
					list.add(rs.getString(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		// リストを配列に戻して返却
		return list.toArray(new String[0]);
	}
}