package com.bds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bds.bean.ContactUsBean;
import com.bds.util.Constants;
import com.bds.util.DbConnection;

public final class MessagesDao {

	public static List<ContactUsBean> getMessages() {
		
		List<ContactUsBean> messageList = null;
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DbConnection.getConnObj();
			if (null != connection) {
				statement = connection.prepareStatement(Constants.QUERY_MESSAGES);
				resultSet = statement.executeQuery();
				messageList = new ArrayList<>();
				while (resultSet.next()) {
					ContactUsBean bean = new ContactUsBean();
					bean.setUserEmail(resultSet.getString("user_email"));
					bean.setUserMob(resultSet.getString("user_mob"));
					bean.setUserMsg(resultSet.getString("user_msg"));
					bean.setUserName(resultSet.getString("user_name"));
					messageList.add(bean);
				}
			}
		} catch (Exception e) {
			System.out.println("MessagesDao : Exception : During data fetch" + e.getMessage());
		} finally {
			if (null != connection) {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println("MessagesDao : Exception : During Closing connection obj : " + e.getMessage());
				}
			}
			if (null != statement) {
				try {
					statement.close();
				} catch (Exception e) {
					System.out.println("MessagesDao : Exception : During Closing statement obj : " + e.getMessage());
				}
			}
			if (null != resultSet) {
				try {
					resultSet.close();
				} catch (Exception e) {
					System.out.println("MessagesDao : Exception : During Closing resultSet obj : " + e.getMessage());
				}
			}
		}
		return messageList;
	}
}