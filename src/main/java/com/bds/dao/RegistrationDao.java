package com.bds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bds.bean.UserBean;
import com.bds.util.Constants;
import com.bds.util.DbConnection;

public final class RegistrationDao {

	public static Integer createUser(UserBean userBean) {

		Connection connection = null;
		PreparedStatement statement = null;
		int status = 0;
		try {
			connection = DbConnection.getConnObj();
			if (null != connection) {
				statement = connection.prepareStatement(Constants.QUERY_CREATE_USR);
				statement.setString(1, userBean.getUserName());
				statement.setString(2, userBean.getUserEmail());
				statement.setString(3, userBean.getUserPwd());
				statement.setString(4, userBean.getUserMob());
				statement.setString(5, userBean.getUserRole());
				statement.setString(6, userBean.getBloodGrp());
				status = statement.executeUpdate();
			}
			if (status > 0) {
				System.out.println("User created successfully!");
			}
		} catch (Exception e) {
			System.out.println("RegistrationDao : Exception : During inserting record : " + e.getMessage());
		} finally {
			if (null != connection) {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println("RegistrationDao : Exception : During Closing connection obj : " + e.getMessage());
				}
			}
			if (null != statement) {
				try {
					statement.close();
				} catch (Exception e) {
					System.out.println("RegistrationDao : Exception : During Closing statement obj : " + e.getMessage());
				}
			}
		}
		return status;
	}
}