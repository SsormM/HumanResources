package com.iotek.util;


import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaseDao<T> {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/auction";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    //加载驱动
    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //链接数据库
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //关闭数据库
    public static void close(ResultSet resultSet, Statement statement, Connection conn) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //修改数据库信息操作(增加,删除,修改)
    public static Integer update(String s, Object... params) throws SQLException {
        Connection conn = getConnection();
        PreparedStatement preparedStatement = conn.prepareStatement(s,Statement.RETURN_GENERATED_KEYS);
        if (params != null) {
            for (int j = 0; j < params.length; j++) {
                preparedStatement.setObject(j + 1, params[j]);
            }
        }
        int i = preparedStatement.executeUpdate();
        ResultSet resultSet = null;
        Integer id = 0;
        if (i > 0) {
            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()){
                id = resultSet.getInt(1);
            }else{
                id=i;
            }
            close(resultSet, preparedStatement, conn);
            return id;
        } else {
            close(resultSet, preparedStatement, conn);
            return i;
        }
    }

    //查询数据库信息操作
    public List<T> query(Class<T> tClass, String sql, Object... params) throws SQLException, IllegalAccessException, InstantiationException {
        List<T> list = new ArrayList<T>();
        Connection conn = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ps = conn.prepareStatement(sql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }
        }
        rs = ps.executeQuery();
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();//查询结果的列数
        while (rs.next()) {
            T t = tClass.newInstance();//外层循环创建对象
            for (int i = 1; i < columnCount + 1; i++) { //内存循环给对象的每个属性赋值
                String columnLabel = metaData.getColumnLabel(i);//第i列的字段名
                String filedName = parse(columnLabel);
                try {
                    Field field = tClass.getDeclaredField(filedName);
                    field.setAccessible(true);
                    field.set(t, rs.getObject(columnLabel));
                } catch (NoSuchFieldException ignored) {

                }
            }
            list.add(t);
        }
        close(rs, ps, conn);
        return list;
    }

    //将数据库列字段转换成对象字段
    private static String parse(String cname) {
        if (cname == null || cname.length() == 0) {
            throw new NullPointerException();
        }
        String[] split = cname.trim().toLowerCase().split("_");
        String s = split[0];
        for (int i = 1; i < split.length; i++) {
            String trim = split[i].trim();
            char c = trim.charAt(0);
            c -= 32;
            s += c;
            s += trim.substring(1, trim.length());
        }
        return s;
    }

}