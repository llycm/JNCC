import java.util.Scanner;

public class ST_1_7_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入字符串:");
        String s = sc.nextLine();
        System.out.println("长度为：" + getStringLength(s));
    }

    public static int getStringLength(String s) {
        if (s == null) {
            return -1;
        }
        return s.length();
    }
}
