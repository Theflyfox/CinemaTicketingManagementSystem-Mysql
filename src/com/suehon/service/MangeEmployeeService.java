package com.suehon.service;



import com.suehon.model.PageBean;
import com.suehon.util.DbHelper;

public class MangeEmployeeService {



	/**
	 * 获取结果集
	 * 
	 * @param tableName
	 * @param queryKey
	 * @param queryValue
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean getResult(String tableName, String queryKey,
			String queryValue, int currentPage, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();
		String sql;
		String sql2;

		if ((null != queryKey && "" != queryKey) && (null != queryValue && "" != queryValue && !"null".equals(queryValue))) {// 有条件查询

			sql = "select e.employeeid, e.name, e.photo, e.gender, e.birthdate, e.idcode, e.phoneno, e.entrytime, e.age, e.position, e.password from employee e where "
					+ queryKey + " like '%" + queryValue + "%' and e.position = '售票员'";
			sql2 = "SELECT count(*) count FROM " + tableName + " WHERE "
					+ queryKey + " LIKE '%" + queryValue + "%' and position = '售票员'";
			System.out.println("有条件查询");
		} else {// 无条件查询
			
			sql = "select e.employeeid, e.name, e.photo, e.gender, e.birthdate, e.idcode, e.phoneno, e.entrytime, e.age, e.position, e.password from employee e where  e.position = '售票员'";
			sql2 = "select count(*) count from " + tableName + " where position = '售票员'";
			System.out.println("无条件查询");
		}

		System.out.println(sql);
		System.out.println(sql2);
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
		pageBean.setTotalPage(sql2);
		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}

}
