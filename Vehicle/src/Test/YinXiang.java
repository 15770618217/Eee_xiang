package Test;

import java.util.HashMap;
import java.util.Map;


public class YinXiang{

	public static void main(String[] args) {
		String string="select * from T1 where 1=1 and (((a = :AA or B like :BB or c in :CC) and d in :DD) or e =:EE) and f like :FF";
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("GG", 1223);
		map.put("aa", "first");
		map.put("AA","first");
		System.out.println(getRunnableSql(string, map));
	}
	public static String getRunnableSql(String sql,Map<String, Object> param){
		StringBuffer stringBuffer=new StringBuffer();
		for(String str:param.keySet()){
			stringBuffer.append(":"+str);
			if(sql.contains(stringBuffer)){
				sql=sql.replace(stringBuffer, String.valueOf(param.get(str)));
			}
			stringBuffer.delete(0,stringBuffer.length());
		}
		StringBuffer sBuffer=new StringBuffer();
		StringBuffer sbBuffer=new StringBuffer();
		String[] arr=sql.split("and");
//		sBuffer.append(arr[0]);
		for(int i=1;i<arr.length;i++){
			String[] arr2=arr[i].split("or");
			for(int j=0;j<arr2.length;j++){
				if(!arr[j].contains(":")){
					sbBuffer.append(arr[j]);
				}
			}
			if(!arr[i].contains(":")){
				sBuffer.append("and");
				sBuffer.append(arr[i]);
			}
			sBuffer.append(sbBuffer);
		}
		return sBuffer.toString();
	}
}
