import java.io.IOException;
import java.util.Scanner;

public class ST_1_16_1 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入学生人数：");
        int n = sc.nextInt();
        System.out.printf("输入 %d 个学生的身高：", n);
        int avg = 0;
        for (int i = 1; i <= n; i++) {
            int x = sc.nextInt();
            avg += x;
        }
        avg /= n;
        System.out.println("平均身高：" + avg);
    }
}
