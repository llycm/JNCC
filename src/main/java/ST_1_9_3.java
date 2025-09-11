import java.util.Scanner;

public class ST_1_9_3 {
    public static void main(String[] args) {
        // 输入
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一行字符串（字符串长度不超过 15）：");
        String s = sc.nextLine();
        String vowelString = vowel(s);
        System.out.println("输出其中的元音字母：" + vowelString);
    }

    public static String vowel(String s) {
        StringBuilder v = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == 'a' || s.charAt(i) == 'e' || s.charAt(i) == 'i' || s.charAt(i) == 'o' || s.charAt(i) == 'u') {
                v.append(s.charAt(i));
            }
        }
        return v.toString();
    }
}
