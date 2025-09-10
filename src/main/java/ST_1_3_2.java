import java.util.Scanner;

public class ST_1_3_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入一个三位整数：");
        int n = sc.nextInt();
        int sum = 0;
        for (int i = 0; i < 3; i++) {
            sum += (n % 10) * (n % 10);
            n /= 10;
        }
        System.out.println("各位数字平方和为：" + sum);
    }
}