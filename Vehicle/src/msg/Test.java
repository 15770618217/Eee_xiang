package msg;

/**  
 * @Title: http://www.smschinese.cn/api.shtml
 * @date 2011-3-22
 * @version V1.2  
 */
public class Test {
	
	//�û���
	private static String Uid = "Mineing";
	
	//�ӿڰ�ȫ��Կ
	private static String Key = "Mineingyinxiang0110";
	
	//�ֻ����룬���������13800000000,13800000001,13800000002
	private static String smsMob = "15770618217";
	
	//��������
	private static String smsText = "ע��������ı��費����ǰ��֤�룺";
	
	
	public static void main(String[] args) {
		String code="";
		for(int i=0;i<6;i++){
			code+=(int)(Math.random()*10);
		}
		HttpClientUtil client = HttpClientUtil.getInstance();
		
		//UTF����
		int result = client.sendMsgUtf8(Uid, Key, smsText+code+"�����㶼���ܸ��߱���Ŷ��", smsMob);
		if(result>0){
			System.out.println("UTF8�ɹ���������=="+result);
		}else{
			System.out.println(client.getErrorMsg(result));
			System.out.println(code);
		}
	}
}
