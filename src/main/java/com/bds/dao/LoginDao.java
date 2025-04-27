package com.bds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bds.bean.UserBean;
import com.bds.util.Constants;
import com.bds.util.DbConnection;

public final class LoginDao {

	public static UserBean validateLogin(UserBean userBean) {

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		userBean.setUserRole("NOT_FOUND");
		try {
			connection = DbConnection.getConnObj();
			if (null != connection) {
				statement = connection.prepareStatement(Constants.QUERY_SELECT_USR);
				statement.setString(1, userBean.getUserEmail());
				statement.setString(2, userBean.getUserPwd());
				resultSet = statement.executeQuery();
				while (resultSet.next()) {
					userBean.setUserName(resultSet.getString("user_name"));
					userBean.setUserMob(resultSet.getString("user_mob"));
					userBean.setUserRole(resultSet.getString("user_role"));
					userBean.setBloodGrp(resultSet.getString("blood_grp"));
				}
			}
		} catch (Exception e) {
			System.out.println("LoginDao : Exception : During data fetch" + e.getMessage());
		} finally {
			if (null != connection) {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println("LoginDao : Exception : During Closing connection obj : " + e.getMessage());
				}
			}
			if (null != statement) {
				try {
					statement.close();
				} catch (Exception e) {
					System.out.println("LoginDao : Exception : During Closing statement obj : " + e.getMessage());
				}
			}
			if (null != resultSet) {
				try {
					resultSet.close();
				} catch (Exception e) {
					System.out.println("LoginDao : Exception : During Closing resultSet obj : " + e.getMessage());
				}
			}
		}
		return userBean;
	}
}