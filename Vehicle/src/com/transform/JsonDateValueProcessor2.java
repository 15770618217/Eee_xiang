package com.transform;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor2 implements JsonValueProcessor {  

    // 转换的格式
    private String format ="yyyy-MM-dd";  

    public JsonDateValueProcessor2() {  
        super();  
    }  

    public JsonDateValueProcessor2(String format) {  
        super();  
        this.format = format;  
    }  


    public Object processArrayValue(Object paramObject,  
            JsonConfig paramJsonConfig) {  
        return process(paramObject);  
    }  

    public Object processObjectValue(String paramString, Object paramObject,  
            JsonConfig paramJsonConfig) {  
        return process(paramObject);  
    }  

    // 定义方法自己进行自定义处理.
    private Object process(Object value){  
        if(value instanceof Date){    
            SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.CHINA);    
            return sdf.format(value);  
        }    
        return value == null ? "" : value.toString();    
    }  

}  