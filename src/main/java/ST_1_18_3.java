import java.io.IOException;
import java.util.Scanner;

public class ST_1_18_3 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个字符串：");
        String s = sc.nextLine();
        // h[0] --> 英文字母
        // h[1] --> 数字
        // h[2] --> 空格
        // h[3] --> 其他
        int[] h = new int[4];
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (Character.isUpperCase(ch) || Character.isLowerCase(ch)) {
                h[0]++;
            } else if (Character.isDigit(ch)) {
                h[1]++;
            } else if (Character.isWhitespace(ch)) {
                h[2]++;
            } else {
                h[3]++;
            }
        }
        System.out.println(h[0] + " " + h[1] + " " + h[2] + " " + h[3]);
    }
}
