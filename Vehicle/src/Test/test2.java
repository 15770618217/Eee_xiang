package Test;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class test2 {

	public static void main(String[] args) {
		 Map<String, Object> map = new HashMap<String, Object>();
		 	map.put("GG", 1223);
			map.put("aa", "first");
			map.put("AA","first");
	        System.out.println(getRunnableSql("select * from T1 where 1=1 and (((a = :AA or B like :BB or c in :CC) and d in :DD) or e =:EE) and f like :FF", map));

	}
	
	 public static String getRunnableSql(String labelSql, Map<String, Object> param) {
		 
	        String regex1 = "(or|and)?\\s?[\\(?\\w?\\s?]\\s?(=|like|in)?\\s?:\\w+";
	 
	        String regex2 = "(?<=:)\\w+";
	 
	        Pattern pattern1 = Pattern.compile(regex1);
	 
	        Pattern pattern2 = Pattern.compile(regex2);
	 
	        Matcher matcher = pattern1.matcher(labelSql);
	 
	        // ƥ���ҳ�����
	        // and a = :aa
	        // b=:bb
	        // or b =:cc
	        // and e like :ee
	        while (matcher.find()) {
	            // ����aa bb��Щ
	            String paramXX = null;
	            // ��ȡ��Ҫ�滻���ַ���
	            String paramReplace = matcher.group();
	 
	            Matcher matcher2 = pattern2.matcher(paramReplace);
	            // ���ҳ�:aa�е�aa
	            if (matcher2.find()) {
	                paramXX = matcher2.group();
	 
	            }
	            // �ҳ�map�еĲ���
	            Object mapParam = param.get(paramXX);
	 
	            // �ж��Ƿ�Ϊnull��Ϊnull��ɾ��
	            if (mapParam == null) {
	            	labelSql = labelSql.replaceAll("(and|or)\\s?\\(\\s*+\\)\\s", "");
	                labelSql = labelSql.replaceAll(paramReplace, "");
	            } else {
	                // �滻
	                labelSql = labelSql.replaceAll(":" + paramXX, mapParam.toString());
	            }
	 
	        }
	        labelSql=labelSql.replaceAll("\\(|\\)", "");
	        return labelSql;
	 
	    }
}
