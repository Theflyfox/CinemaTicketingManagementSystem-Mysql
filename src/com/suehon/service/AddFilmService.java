package com.suehon.service;

import com.suehon.model.FilmBean;
import com.suehon.util.DbHelper;

public class AddFilmService {

	private DbHelper dbHelper = new DbHelper();
	
	public void addFilm(FilmBean fb) {
	
		String sql1 = "insert into film (filmname, filmcountry, filmdirector, filmleadingrole, filmlanguage, filmlasttime, filetype, filmonline, filmpost, filmcontent, filmbackstory, filmaward) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		//向film表插入记录
		dbHelper.update(sql1, new Object[] {fb.getFilmName(), fb.getFilmCountry(), fb.getFilmDirector(), fb.getFilmLeadingRole(), fb.getFilmLanguage(), fb.getFilmLastTime(), fb.getFilmType(), fb.getFilmOnline(), fb.getFilmPost(), fb.getFilmContent(), fb.getFilmBackStory(), fb.getFilmAward()});
		
		String sql2 = "select filmid from film where filmname = '" +fb.getFilmName() +"'";
		int filmId = Integer.parseInt(dbHelper.query(sql2).get(0).get("filmid").toString());
		String []filmAliasStr = fb.getFilmAlias().split("/");
		String [] sqls = new String[filmAliasStr.length];
		for(int i = 0; i < filmAliasStr.length; i++) {
			sqls[i] = "insert into datadictionary (ddcontent, ddtype) values ('" + filmAliasStr[i] + "', '"+ filmId + "')";
		}
		
		dbHelper.executeBatch(sqls);
		
	}
	
	
	
	
}
