import java.io.IOException;
import java.util.Scanner;

public class ST_1_17_2 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入整数 n：");
        int n = sc.nextInt();
        System.out.print("符合该要求的数有：");
        for (int i = 1; i <= n; i++) {
            if (5 * i - 14 == 2 * i + 4) {
                System.out.print(i + " ");
            }
        }
    }
}
