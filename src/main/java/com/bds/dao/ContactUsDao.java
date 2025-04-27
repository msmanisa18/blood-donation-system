package com.bds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bds.bean.ContactUsBean;
import com.bds.util.Constants;
import com.bds.util.DbConnection;

public final class ContactUsDao {

	public static Integer insertContactUsData(ContactUsBean contactUsBean) {

		int status = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DbConnection.getConnObj();
			if (null != connection) {
				statement = connection.prepareStatement(Constants.QUERY_CONTACT_US);
				statement.setString(1, contactUsBean.getUserName());
				statement.setString(2, contactUsBean.getUserEmail());
				statement.setString(3, contactUsBean.getUserMob());
				statement.setString(4, contactUsBean.getUserMsg());
				status = statement.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("ContactUsDao : Exception : During data fetch" + e.getMessage());
		} finally {
			if (null != connection) {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println("ContactUsDao : Exception : During Closing connection obj : " + e.getMessage());
				}
			}
			if (null != statement) {
				try {
					statement.close();
				} catch (Exception e) {
					System.out.println("ContactUsDao : Exception : During Closing statement obj : " + e.getMessage());
				}
			}
			if (null != resultSet) {
				try {
					resultSet.close();
				} catch (Exception e) {
					System.out.println("ContactUsDao : Exception : During Closing resultSet obj : " + e.getMessage());
				}
			}
		}
		return status;
	}
}