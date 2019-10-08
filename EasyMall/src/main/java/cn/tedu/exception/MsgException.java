package cn.tedu.exception;

/**
 * @Author: Luxcis
 * @Date: 2019/9/17 9:31
 * @Description:
 */
public class MsgException extends Exception{
    public MsgException(){}
    public MsgException(String msg){
        super(msg);
    }
}
