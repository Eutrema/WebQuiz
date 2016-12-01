# WebQuiz
WEB上でできるクイズ
#準備
①mergedocからeclipse Pleiades All in One 4.5 Java 64bit Full Editionをダウンロードし，下記ディレクトリ構成になるように展開する
◦ c:\pleiades4.5\eclipse, java, tomcat                     

②Windowsの環境変数設定          
◦ コンピュータを右クリック->プロパティ(あるいはコントロールパネルの「システム」）->システムの詳細設定->環境変数　　　　　　  
◦ 環境変数でユーザ/システム環境変数のどちらかに，変数名：JAVA_HOME，変数値：C:\pleiades4.5\java\8 (要はJDKのbinがあるディレクトリの一つ上）を指定する．同じく変数名：JRE_HOME, 変数値：C:\pleiades4.5\java\8\jre (JREのbinがあるディレクトリの一つ上)を指定する      

③eclipseの設定       
◦ JDK1.8を明示的に下記のように指定する．
ウィンドウ->設定->コンパイラー->コンパイラー準拠レベルを1.8に変更．下の方にインストール済みJREが．．とか警告がでるので，そこでもJRE8を選択する．フルビルドはしてもしなくても良い．     

④クローンの生成       
◦ https://github.com/igakilab/WebQuiz  
上記のページにあるClone or downloadをクリック->open in desktopをクリック->githubdesktopが開き、クローンを作る場所を選択するページになるので、GitHubのファイルを選択する。    

⑤ MYSQLのダウンロード   
http://dev.mysql.com/downloads/mysql/  
◦ 上記のリンク先に飛んで,Windows(x86,32-bit),MYSQL Installer MSIをダウンロードする   

⑥ MYSQLのインポート   
MYSQLを開き、初期設定を行う(名前,パスワードは何でもよい)->Serverのimportのボタンをクリック->Importfrom-Self-ContainedFileをクリックする->右端にある...をクリックし、20161103.sqlのファイルを選択する->NEW...をクリックし、testと入力する->StartImportをクリックする。-> ImportCompletedと表示されればOK-> ImportCompletedの後にwitherrorsというコメントが表示されれば、importからやり直す    

⑦プロジェクトの作成  
◦ eclipseを起動し,ファイル->インポート->選択画面でGitファイルを開き,Gitからプロジェクトで次へをクリック->既存ローカルリポジトリの中のWebQuizを開き,次へをクリック
->次へをクリック->完了をクリックする．

#実行方法
①eclipseを起動し、WebQuizを開き、build.xmlを右クリック->実行->Ant Build(2つ並んでるもののうえのほう）を選択   
◦ buildファイルに従って，コンパイルしてwarファイルが作成され，tomcatのwebappsディレクトリに配置される．   

②tomcatのbinディレクトリ内のstartup.batを実行->tomcatが起動し，webquiz.warが配備（デプロイ）される．   

③正常にtomcatが起動したのを確認後，「http://localhost:8080/webquiz/menu.html」にアクセス->
黒板の背景の画像とクイズに参加,回答状況を見るの2つのボタンが表示されればOK->クイズに参加のボタンを押すと,○×クイズと4択クイズを選択できるページに移動し,正常に解くことが出来れば成功．また,回答状況を見るのページには自分の答えがリアルタイムで反映されている．

◎404エラーなどが出る場合は,C:\pleiades4.5\tomcat\7\webappsのwebquiz.warとwebquizフォルダを削除してant buildからやり直してみる   
補足:startup.batを右クリックし、編集をクリック→rmdir /S /Q C:\pleiades4.5\tomcat\7\webapps\webquizの文を追加すれば、削除をする必要はなく、Ant Buildからやり直しすれば良い．

参考ページ：https://github.com/igakilab/multiple-dwr
