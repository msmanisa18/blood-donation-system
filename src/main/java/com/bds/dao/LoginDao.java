package com.bds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bds.bean.UserBean;
import com.bds.bean.UserDtlsBean;
import com.bds.bean.UserRoleBean;
import com.bds.util.Constants;
import com.bds.util.DbConnection;

public final class LoginDao {

	public static UserDtlsBean validateLogin(UserBean userBean) {

		UserDtlsBean userDtlsBean = new UserDtlsBean();
		UserRoleBean userRoleBean = new UserRoleBean();
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
			List<String> userTypeList = new ArrayList<>();
			if ("ADMIN".equals(userBean.getUserRole())) {
				statement = connection.prepareStatement(Constants.QUERY_COUNT_USR);
				resultSet = statement.executeQuery();
				while (resultSet.next()) {
					userTypeList.add(resultSet.getString("user_role"));
				}
			}
			if (!userTypeList.isEmpty()) {
				int donorCount = 0;
				int organizerCount = 0;
				int patientCount = 0;
				int volunteerCount = 0;
				for (String type : userTypeList) {
					if ("DONOR".equals(type)) {
						donorCount++;
					} else if ("ORGANIZER".equals(type)) {
						organizerCount++;
					} else if ("PATIENT".equals(type)) {
						patientCount++;
					}else if ("VOLUNTEER".equals(type)) {
						volunteerCount++;
					} else {
						System.out.println("Role is ADMIN");
					}
				}
				userRoleBean.setDonorCount(String.valueOf(donorCount));
				userRoleBean.setOrganizerCount(String.valueOf(organizerCount));
				userRoleBean.setPatientCount(String.valueOf(patientCount));
				userRoleBean.setVolunteerCount(String.valueOf(volunteerCount));
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
		userDtlsBean.setUserBean(userBean);
		userDtlsBean.setUserRoleBean(userRoleBean);
		return userDtlsBean;
	}
}