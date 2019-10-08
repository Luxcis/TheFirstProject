package cn.tedu.util;

import java.sql.ResultSet;

/**
 * @Author: Luxcis
 * @Date: 2019/9/18 10:16
 * @Version: 1.0
 * @Description:
 */
public interface ResultSetHandler<T> {
    T handle(ResultSet rs) throws Exception;
}
