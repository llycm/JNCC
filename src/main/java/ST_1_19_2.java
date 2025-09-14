import java.io.IOException;
import java.util.Scanner;

public class ST_1_19_2 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据：");
        int n = sc.nextInt();
        boolean flag1 = n % 2 == 0;
        boolean flag2 = n > 4 && n <= 12;

        System.out.printf("%d %d %d", (flag1 && flag2) ? 1 : 0, (flag1 || flag2) ? 1 : 0, (!flag1 && !flag2) ? 1 : 0);
    }
}
