import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test {
	static String python_enviroment = "C:\\Users\\dell\\AppData\\Local\\conda\\conda\\envs\\tensorflow1.0-py2.7\\python.exe";
	static String scriptFile = "D:\\idea_pycharm_projects\\python_to_java\\2.py";
	static String params="11 5";
	public static void main(String[] args) {
		System.out.println("Hello World!");
		try{
			Process process = Runtime.getRuntime().exec(python_enviroment+" "+scriptFile+ " "+params);
			BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line = null;
		    while ((line = in.readLine()) != null) {
			     System.out.println(line);
			    }
		    in.close();
		    int re = process.waitFor();
		    System.out.println("----------------------");
			System.out.println(re);
			System.out.println("----------------------");
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
