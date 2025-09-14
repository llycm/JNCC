import java.util.Scanner;

public class ST_1_13_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入整数n：");
        int n = sc.nextInt();
        double fm = 1, sum = 0;
        for (int i = 1; i <= n; i++) {
            sum += (i % 2 == 0 ? -1 : 1) / fm;
            fm++;
        }
        System.out.printf("%.2f", sum);
    }
}
