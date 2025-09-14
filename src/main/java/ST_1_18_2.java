import java.io.IOException;
import java.util.Scanner;

public class ST_1_18_2 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据个数 n：");
        int n = sc.nextInt();
        int f1 = 1, f2 = 1, sum = 0;
        for (int i = 1; i <= n; i++) {
            f1 = f1 + f2;
            f2 = f1 - f2;
            if (f2 % 2 == 0) {
                sum += f2;
            }
        }
        System.out.println("前 n 项其中偶数斐波那契数的和是：" + sum);
    }
}
