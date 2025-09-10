import java.util.Scanner;

public class ST_1_2_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入一个非负整数：");
        int x = sc.nextInt();
        for (int i = 2; i <= Math.sqrt(x); i++) {
            if (x % i == 0) {
                System.out.println(x + "不是素数");
                return;
            }
        }
        System.out.println(x + "是素数");
    }
}
