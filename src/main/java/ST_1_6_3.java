import java.util.Scanner;

public class ST_1_6_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s1, s2;
        System.out.print("输入字符串 1：");
        s1 = sc.nextLine();
        System.out.print("输入字符串 2：");
        s2 = sc.nextLine();
        System.out.println(stringConcat(s1, s2));
    }

    public static String stringConcat(String s1, String s2) {
        return s1 + s2;
    }
}