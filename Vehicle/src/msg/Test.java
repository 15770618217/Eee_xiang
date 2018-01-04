package msg;

/**  
 * @Title: http://www.smschinese.cn/api.shtml
 * @date 2011-3-22
 * @version V1.2  
 */
public class Test {
	
	//用户名
	private static String Uid = "Mineing";
	
	//接口安全秘钥
	private static String Key = "Mineingyinxiang0110";
	
	//手机号码，多个号码如13800000000,13800000001,13800000002
	private static String smsMob = "15770618217";
	
	//短信内容
	private static String smsText = "注册了祥哥哥的毕设不？当前验证码：";
	
	
	public static void main(String[] args) {
		String code="";
		for(int i=0;i<6;i++){
			code+=(int)(Math.random()*10);
		}
		HttpClientUtil client = HttpClientUtil.getInstance();
		
		//UTF发送
		int result = client.sendMsgUtf8(Uid, Key, smsText+code+"打死你都不能告诉别人哦！", smsMob);
		if(result>0){
			System.out.println("UTF8成功发送条数=="+result);
		}else{
			System.out.println(client.getErrorMsg(result));
			System.out.println(code);
		}
	}
}
