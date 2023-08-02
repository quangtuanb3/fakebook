package Utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class AppUtil {
    private static final ObjectMapper mapper = new ObjectMapper();

    public static Object getObject(HttpServletRequest request, Class clazz) {
        // tạo object bằng contructor không tham số.
        Object object;
        try {
            object = clazz.newInstance();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

        java.util.Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();

            if (AppConstant.ACTION.equals(paramName)) {
                continue;
            }
            System.out.println(request.getParameter(paramName));
            // Use reflection to set the parameter value to the corresponding field in the User class
            try {
                // lấy value ra
                String paramValue = mapper.writeValueAsString(request.getParameter(paramName));
                Field field = clazz.getDeclaredField(paramName);
                field.setAccessible(true); // Set accessible, as the fields may be private
                Class<?> fieldType = field.getType();

                var value = mapper.readValue(paramValue, fieldType);
                field.set(object, value);
                //set cho tung field
                // Add more type conversions as needed for other field types (e.g., boolean, double, etc.)
            } catch (NoSuchFieldException | IllegalAccessException | NumberFormatException e) {
                // Handle exceptions as needed
                System.out.println(e.getMessage());
            } catch (JsonProcessingException e) {
                System.out.println(e.getMessage());
            }

        }
        return object;
    }

    public static Object getObjectWithValidation(HttpServletRequest request, Class clazz, Map<String, RunnableCustom> validators) {
        // tạo object bằng contructor không tham số.
        Object object;
        try {
            object = clazz.newInstance();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

        java.util.Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();

            if (AppConstant.ACTION.equals(paramName)) {
                continue;
            }
            System.out.println(request.getParameter(paramName));
            // Use reflection to set the parameter value to the corresponding field in the User class
            try {
                // lấy value ra
                String paramValue = mapper.writeValueAsString(request.getParameter(paramName));
                RunnableCustom validator = validators.get(paramName);
                if (validator != null) {
                    validator.setValue(request.getParameter(paramName));
                    validator.run();
                }
                Field field = clazz.getDeclaredField(paramName);
                field.setAccessible(true); // Set accessible, as the fields may be private
                Class<?> fieldType = field.getType();

                var value = mapper.readValue(paramValue, fieldType);
                field.set(object, value);
                //set cho tung field
                // Add more type conversions as needed for other field types (e.g., boolean, double, etc.)
            } catch (NoSuchFieldException | IllegalAccessException | NumberFormatException e) {
                // Handle exceptions as needed
                System.out.println(e.getMessage());
            } catch (JsonProcessingException e) {
                System.out.println(e.getMessage());
            }

        }
        return object;
    }


    public static <T> T getObjdectResultSet(ResultSet rs, Class<T> clazz) throws SQLException {
        T object;
        try {
            object = clazz.getDeclaredConstructor().newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            try {
                String fieldName = field.getName();
                if (fieldName.equals("serialVersionUID")) {
                    continue;
                }
                field.setAccessible(true);
                Class<?> fieldType = field.getType();

                String paramValue = mapper.writeValueAsString(rs.getObject(camelCaseToSnakeCase(fieldName)));
                Object value = mapper.readValue(paramValue, fieldType);
                field.set(object, value);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return object;
    }

    public static String camelCaseToSnakeCase(String input) {
        if (input == null || input.isEmpty()) {
            return "";
        }
        StringBuilder result = new StringBuilder();
        char prevChar = '\0';

        for (char currentChar : input.toCharArray()) {
            if (Character.isUpperCase(currentChar)) {
                if (prevChar != '\0' && !Character.isUpperCase(prevChar)) {
                    result.append('_');
                }
                result.append(Character.toLowerCase(currentChar));
            } else {
                result.append(currentChar);
            }
            prevChar = currentChar;
        }
        return result.toString();
    }

    public static <T> void saveObjectToDatabase(Connection connection, String tableName, T object, String... excludedFields) throws SQLException {
        String sql;
        Field idField;
        try {
            idField = object.getClass().getDeclaredField("id");
            idField.setAccessible(true);
            Long idValue = (Long) idField.get(object);
            if (idValue != null) {
                sql = buildUpdateSql(tableName, object, excludedFields);
            } else {
                sql = buildInsertSql(tableName, object, excludedFields);
            }
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
            return;
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            int parameterIndex = 1;
            Field[] fields = object.getClass().getDeclaredFields();
            for (Field field : fields) {
                String fieldName = field.getName();
                if (fieldName.equals("serialVersionUID") || isExcluded(fieldName, excludedFields)) {
                    continue;
                }
                field.setAccessible(true);
                Class<?> fieldType = field.getType();
                try {
                    Object value = field.get(object);
                    preparedStatement.setObject(parameterIndex, value);
                    parameterIndex++;
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
            if (sql.contains("UPDATE")) {
                // Set the id value for the WHERE clause in the UPDATE statement
                preparedStatement.setLong(parameterIndex, (Long) idField.get(object));
            }
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String buildInsertSql(String tableName, Object object, String... excludedFields) {
        String sql = "INSERT INTO " + tableName + " (";
        Field[] fields = object.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            String fieldName = field.getName();
            if (fieldName.equals("serialVersionUID") || fieldName.equals("id") || isExcluded(fieldName, excludedFields)) {
                continue;
            }
            sql += camelCaseToSnakeCase(fieldName);
            if (i < fields.length - 1) {
                sql += ",";
            }
        }
        sql += ") VALUES (";
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            String fieldName = field.getName();
            if (fieldName.equals("serialVersionUID") || fieldName.equals("id") || isExcluded(fieldName, excludedFields)) {
                continue;
            }
            sql += "?";
            if (i < fields.length - 1) {
                sql += ",";
            }
        }
        sql += ")";
        return sql;
    }

    private static String buildUpdateSql(String tableName, Object object, String... excludedFields) {
        String sql = "UPDATE " + tableName + " SET ";
        Field[] fields = object.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            String fieldName = field.getName();
            if (fieldName.equals("serialVersionUID") || fieldName.equals("id") || isExcluded(fieldName, excludedFields)) {
                continue;
            }
            sql += camelCaseToSnakeCase(fieldName) + "=?";
            if (i < fields.length - 1) {
                sql += ",";
            }
        }
        sql += " WHERE (id = ?)";
        return sql;
    }


    private static boolean isExcluded(String fieldName, String[] excludedFields) {
        for (String excludedField : excludedFields) {
            if (excludedField.equals(fieldName)) {
                return true;
            }
        }
        return false;
    }

}
