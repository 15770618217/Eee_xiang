package com.transform;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor2 implements JsonValueProcessor {  

    // ת���ĸ�ʽ
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

    // ���巽���Լ������Զ��崦��.
    private Object process(Object value){  
        if(value instanceof Date){    
            SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.CHINA);    
            return sdf.format(value);  
        }    
        return value == null ? "" : value.toString();    
    }  

}  