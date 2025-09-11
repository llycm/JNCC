import java.util.Scanner;

public class ST_1_8_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据个数：");
        int n = sc.nextInt();
        System.out.print("输入整数：");
        int sum = 0;
        for (int i = 1; i <= n; i++) {
            int x = sc.nextInt();
            if (x % 2 == 1) {
                sum += x;
            }
        }
        System.out.println(sum);
    }
}
