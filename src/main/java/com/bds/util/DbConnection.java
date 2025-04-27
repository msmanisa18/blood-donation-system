package com.bds.util;

import java.sql.Connection;
import java.sql.DriverManager;

public final class DbConnection {

	public static Connection getConnObj() {
		String dbCompleteUrl = Constants.DB_URL
								+ Constants.COLON
								+ Constants.SLASH
								+ Constants.SLASH
								+ Constants.DB_HOST
								+ Constants.COLON
								+ Constants.DB_PORT
								+ Constants.SLASH
								+ Constants.DB_NAME;
		try {
			Class.forName(Constants.DB_DRIVER);
			return DriverManager.getConnection(dbCompleteUrl, Constants.DB_USR, Constants.DB_PWD);			
		} catch (Exception e) {
			return null;
		}
	}
}