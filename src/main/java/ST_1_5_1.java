import java.util.Scanner;

public class ST_1_5_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入字符串：");
        String s = sc.nextLine();
        StringBuilder r = new StringBuilder(s);
        r.reverse();
        System.out.print("反转后字符串：" + r);
    }
}
