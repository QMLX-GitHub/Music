package com.qmlx.mapper.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SearchResult {
    private Integer code;//表示请求的结果，和前端约定好 1代表成功之类的
    private Singer singer;//表示提示信息
    private Songlist songlist;
    private Object data;//表示返回之后的数据

    public static SearchResult successSinger(Singer singer,Object data){
        //表示请求成功，并且有数据返回
        return new SearchResult(1,singer,null,data);
    }
    public static SearchResult successSongList(Songlist songlist,Object data){
        //表示请求成功，但是没有数据传输
        return new SearchResult(1,null,songlist,data);
    }
}
