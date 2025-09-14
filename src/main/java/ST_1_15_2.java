import java.io.IOException;
import java.util.Scanner;

public class ST_1_15_2 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据个数：");
        int n = sc.nextInt();
        System.out.printf("输入 %d 个整数：", n);
        int max1 = Integer.MIN_VALUE, max2 = Integer.MIN_VALUE;
        for (int i = 1; i <= n; i++) {
            int x = sc.nextInt();
            if (x > max1) {
                max2 = max1;
                max1 = x;
            } else if (x > max2) {
                max2 = x;
            }
        }
        System.out.println("最高成绩：" + max1);
        System.out.println("第二高成绩：" + max2);
    }
}
