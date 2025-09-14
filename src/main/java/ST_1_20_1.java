import java.io.IOException;
import java.util.Scanner;

public class ST_1_20_1 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入学生人数：");
        int n = sc.nextInt();
        System.out.println(n * (n - 1) / 2);
    }
}
