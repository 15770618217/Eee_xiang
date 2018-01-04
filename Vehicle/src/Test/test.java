package Test;


public class test {
	public static void main(String[] args) {
		System.out.println(f(10,2));
	}
	public static int f(int m,int n){
		int j=1,z=1;
		for(int i=1;i<n;i++){
			j=m*(m-i);
		}
		for(int a=1;a<n;a++){
			z=n*(n-a);
		}
		return j/z;
	}
}
