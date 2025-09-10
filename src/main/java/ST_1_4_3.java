import java.util.Scanner;

public class ST_1_4_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入n：");
        int n = sc.nextInt();
        int s = 2, sum = 0;
        for (int i = 1; i <= n; i++) {
            sum += s;
            s = s * 10 + 2;
        }
        System.out.println("Sn=" + sum);
    }
}
