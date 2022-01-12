package org.mypetstore.persistence;

import java.sql.*;

public class DBUtil {
    private static String driverString = "com.mysql.jdbc.Driver";
    private static String connectionString = "jdbc:mysql://localhost:3306/myjpetstore?useUnicode=true&characterEncoding=utf8";
    private static String username = "root";
    private static String password = "081123";

    public static Connection getConnection() throws Exception{
        Connection connection = null;
        try{
            Class.forName(driverString);
            connection = DriverManager.getConnection(connectionString,username,password);
        }catch (Exception e){
            throw e;
        }
        return connection;
    }
    public static void closeStatement(Statement statement)throws Exception{
        statement.close();
    }
    public static void closePreparedStatement(PreparedStatement pStatement)throws Exception{
        pStatement.close();
    }
    public static void closeResultSet(ResultSet resultSet)throws Exception{
        resultSet.close();
    }
    public static void closeConnection(Connection connection)throws Exception{
        connection.close();
    }
    public static void closeAll(Connection conn, PreparedStatement ps, ResultSet rs){
        try {
            if(conn != null)
                conn.close();
            if(ps != null)
                ps.close();
            if (rs != null)
                rs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


//    public static void main(String[] args) throws Exception{
//        Connection conn = DBUtil.getConnection();
//        System.out.println(conn);
//    }
}
