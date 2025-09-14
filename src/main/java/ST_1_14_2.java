import java.io.IOException;
import java.util.Scanner;

public class ST_1_14_2 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据个数：");
        int n = sc.nextInt();
        System.out.printf("输入 %d 个出生年份：", n);
        for (int i = 1; i <= n; i++) {
            int year = sc.nextInt();
            if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
                System.out.print("是" + " ");
            } else {
                System.out.print("否" + " ");
            }
        }
    }
}
