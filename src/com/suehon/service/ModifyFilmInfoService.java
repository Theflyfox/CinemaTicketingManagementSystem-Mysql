package com.suehon.service;

import com.suehon.model.FilmBean;
import com.suehon.util.DbHelper;

public class ModifyFilmInfoService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 更新电影信息
	 * @param fb 存放电影信息的javaBean
	 * @return	受影响行数
	 */
	public int modifyFilmInfo(FilmBean fb) {
		
		
		String sql = "update film set FILMNAME = ?, FILMCOUNTRY = ?, FILMDIRECTOR = ?, " +
				"		FILMLEADINGROLE = ?, FILMLANGUAGE = ?, FILMLASTTIME = ?, FILETYPE = ?, " +
						"FILMONLINE = ?, FILMCONTENT = ?, FILMBACKSTORY = ?, FILMAWARD = ? where FILMID = ?";
		
		return dbHelper.update(sql, new Object [] {fb.getFilmName(), fb.getFilmCountry(), fb.getFilmDirector(),
													fb.getFilmLeadingRole(), fb.getFilmLanguage(), fb.getFilmLastTime(),
													fb.getFilmType(), fb.getFilmOnline(), fb.getFilmContent(), fb.getFilmBackStory(),
													fb.getFilmAward(), fb.getFilmId()	
												});
	}
	
}
