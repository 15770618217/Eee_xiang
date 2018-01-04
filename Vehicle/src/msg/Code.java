package msg;

public class Code {
public static void main(String[] args) {
	String code="";
	for(int i=0;i<6;i++){
		code+=(int)(Math.random()*10);
	}
	System.out.println(code);
}
}
