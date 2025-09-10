import java.util.Scanner;

public class ST_1_7_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入 10 位整数：");
        int cnt = 0;
        for (int i = 1; i <= 10; i++) {
            int x = sc.nextInt();
            if (x < 0) {
                cnt++;
            }
        }
        System.out.println("负数个数为：" + cnt);
    }
}
