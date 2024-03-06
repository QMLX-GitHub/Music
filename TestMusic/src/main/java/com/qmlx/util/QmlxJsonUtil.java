package com.qmlx.util;

import java.util.Arrays;

public class QmlxJsonUtil {
    public static int[] convertStringToIntArray(String input) {
        // 去除字符串中的空格和方括号
        String[] strArray = input.replace("[", "").replace("]", "").split(",");

        // 使用Java 8的Stream API将字符串数组转换为int数组
        int[] intArray = Arrays.stream(strArray)
                .mapToInt(Integer::parseInt)
                .toArray();

        return intArray;
    }
}
