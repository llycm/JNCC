import java.io.IOException;
import java.util.Scanner;

public class ST_1_18_1 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据量 n：");
        int n = sc.nextInt(), sum = 0;
        System.out.print("输入 2*n 个数据：");
        for (int i = 1; i <= n; i++) {
            sum += sc.nextInt();
        }
        for (int i = 1; i <= n; i++) {
            sum -= sc.nextInt();
        }
        System.out.println("企业盈利：" + sum);
    }
}
