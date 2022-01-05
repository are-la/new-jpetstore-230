package org.mypetstore.persistence.impl;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Log;
import org.mypetstore.persistence.DBUtil;
import org.mypetstore.persistence.LogDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LogDAOImpl implements LogDAO {

    private static final String InsertBrowseLog = "INSERT INTO BROWSELOG (USERID,BROWSEITEMID,BROWSETIME) VALUES (?,?,?)";

    private static final String InsertAddLog = "INSERT INTO ADDLOG (USERID,ADDITEMID,ADDTIME) VALUES (?,?,?)";

    private static final String GetBrowseList = "SELECT BROWSEITEMID,BROWSETIME FROM BROWSELOG WHERE USERID = ?";

    private static final String GetAddList = "SELECT ADDITEMID,ADDTIME FROM ADDLOG WHERE USERID = ?";


    @Override
    public void insertBrowseLog(Account account, String itemid) {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(InsertBrowseLog);
            ps.setString(1,account.getUsername());
            ps.setString(2,itemid);
            Date date = new Date(System.currentTimeMillis());
            ps.setDate(3,date);
            System.out.println(ps.toString());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void insertAddLog(Account account, String itemid) {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(InsertAddLog);
            ps.setString(1,account.getUsername());
            ps.setString(2,itemid);
            Date date = new Date(System.currentTimeMillis());
            ps.setDate(3,date);
            System.out.println(ps.toString());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Log> getBrowseLogListByUsername(String username) {
        List<Log> browseLogList = new ArrayList<Log>();
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(GetBrowseList);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                Log log = new Log();
                log.setItemId(rs.getString(1));
                log.setLogDate(rs.getDate(2));
                browseLogList.add(log);
            }
            DBUtil.closeAll(conn,ps,rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return browseLogList;
    }

    @Override
    public List<Log> getAddListByUsername(String username) {
        List<Log> addList = new ArrayList<Log>();
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(GetAddList);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                Log log = new Log();
                log.setItemId(rs.getString(1));
                log.setLogDate(rs.getDate(2));
                addList.add(log);
            }
            DBUtil.closeAll(conn,ps,rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return addList;
    }
}
