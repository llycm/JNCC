import java.io.IOException;
import java.util.Scanner;

public class ST_1_15_1 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入书的页数 n：");
        int n = sc.nextInt();
        int s = 1, day = 0;
        while (n > 0) {
            n -= s;
            s += 2;
            day++;
        }
        System.out.printf("小明看完整本书需要：%d 天\n", day);
    }
}
