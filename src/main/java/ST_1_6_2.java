import java.util.Scanner;

public class ST_1_6_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数值 n（n>0）：");
        int n = sc.nextInt();
        int sum = 0;
        for (int i = 1; i <= n; i++) {
            int x = sc.nextInt();
            if (x % 2 == 0) {
                sum += x;
            }
        }
        System.out.println(sum);
    }
}