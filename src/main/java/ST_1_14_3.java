import java.io.IOException;
import java.util.Scanner;

public class ST_1_14_3 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个数 n：");
        int n = sc.nextInt();
        int sum = 0;
        for (int i = 1; i <= n; i++) {
            if (i % 3 == 0 || i % 5 == 0) {
                sum += i;
            }
        }
        System.out.printf("1 到 %d 之间能够被 3 或者 5 整除的数之和是", n);
        System.out.println(sum);
    }
}
