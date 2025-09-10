import java.util.Scanner;

public class ST_1_4_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入n和m：");
        int n = sc.nextInt(), m = sc.nextInt();
        int sum = 0;
        for (int i = n; i <= m; i++) {
            sum += i;
        }
        System.out.println("从" + n + "到" + m + "的和为：" + sum);
    }
}
