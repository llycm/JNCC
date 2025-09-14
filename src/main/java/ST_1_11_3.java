import java.util.Scanner;

public class ST_1_11_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个整数：");
        int n = sc.nextInt();
        int f1 = 0, f2 = 1;
        System.out.print("“斐波纳契数列”：");
        for (int i = 1; i <= n; i++) {
            f1 = f1 + f2;
            f2 = f1 - f2;
            System.out.print(f1 + " ");
        }
    }
}
