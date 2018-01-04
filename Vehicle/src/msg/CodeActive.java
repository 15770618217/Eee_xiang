package msg;

public class CodeActive {
 public String code(){
	 String num="";
	 num+=(int)(Math.random()*10000);
	 return num;
 }
}
