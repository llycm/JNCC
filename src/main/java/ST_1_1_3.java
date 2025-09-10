import java.util.Scanner;

public class ST_1_1_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个字符串：");
        String s = sc.nextLine();
        StringBuilder r = new StringBuilder(s);
        r.reverse();
        if (s.contentEquals(r)) {
            System.out.println("字符串" + s + "是回文");
        } else {
            System.out.println("字符串" + s + "不是回文");
        }
    }
}
