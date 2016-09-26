package jp.ac.oit.igakilab.webquiz;

public class TeacherLoginManager {
	//ログインに成功したらsessionを保存してtrueを返す
	//失敗したらfalseを返す
	//暗号化とかいろいろやってないのでヤバい
	public boolean login(LoginData ldata) {
		DBController dbc = new DBController();
		dbc.beginTransaction();
		String[] ids = dbc.doGet("SELECT teacherID FROM teacher");
		String lid = ldata.getID();
		boolean isHit = false;
		for (String id : ids) {
			if (lid == id) {
				isHit = true;
				lid = id;
				break;
			}
		}
		if (!isHit) {
			dbc.endTransaction();
			return false;
		}
		if (ldata.getpassword() != dbc.doGet("SELECT teacherPassword FROM teacher WHERE teacherID = " + lid)[0]) {
			dbc.endTransaction();
			return false;
		}

		//ここでsessionを保存したい
		//まだsessionについてよくわかっていないのでもうちょい調べる

		dbc.endTransaction();
		return true;
	}
}
