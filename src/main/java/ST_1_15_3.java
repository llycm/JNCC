import java.io.IOException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ST_1_15_3 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个密码字符串：");
        String password = sc.nextLine();
        boolean b = validatePassword(password);
        System.out.printf("字符串 %s 是否有效密码：", password);
        if (b) {
            System.out.println("是");
        } else {
            System.out.println("否");
        }
    }

    public static boolean validatePassword(String password) {
        String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

}
