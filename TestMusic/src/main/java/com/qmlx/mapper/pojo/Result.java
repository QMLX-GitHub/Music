package com.qmlx.mapper.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Result {
    private Integer code;//表示请求的结果，和前端约定好 1代表成功之类的
    private String msg;//表示提示信息
    private Object data;//表示返回之后的数据

    public static Result success(Object data){
        //表示请求成功，并且有数据返回
        return new Result(1,"success",data);
    }
    public static Result success(){
        //表示请求成功，但是没有数据传输
        return new Result(1,"success",null);
    }
    public static Result error(String msg){
        //表示请求失败，返回错误信息
        return new Result(0,msg,null);
    }
}
