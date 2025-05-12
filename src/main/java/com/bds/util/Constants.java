package com.bds.util;

public final class Constants {

	private Constants() {

	}

	public static final String COLON = ":";
	public static final String SLASH = "/";
	public static final String DB_URL = "jdbc:mysql";
	public static final String DB_HOST = "localhost";
	public static final String DB_PORT = "3306";
	public static final String DB_NAME = "appdb";
	public static final String DB_USR = "root";
	public static final String DB_PWD = "root";
	public static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	public static final String SECRET_KEY = "my_secret_key_12345";
	public static final String SALT = "1234567890";
	public static final String SHA_KEY = "PBKDF2WithHmacSHA256";
	public static final String AES = "AES";
	public static final String AES_PADDING = "AES/CBC/PKCS5Padding";
	public static final String QUERY_SELECT_USR = "SELECT user_name, user_mob, user_role, blood_grp FROM user_dtls WHERE user_email = ? and user_passwd = ?";
	public static final String QUERY_CREATE_USR = "INSERT INTO user_dtls (user_name, user_email, user_passwd, user_mob, user_role, blood_grp) VALUES (?, ?, ?, ?, ?, ?)";
	public static final String QUERY_CONTACT_US = "INSERT INTO contact_us (user_name, user_email, user_mob, user_msg) VALUES (?, ?, ?, ?)";
	public static final String QUERY_COUNT_USR = "select user_role from user_dtls";
	public static final String QUERY_MESSAGES = "SELECT user_name, user_email, user_mob, user_msg FROM contact_us";
}