import java.util.Scanner;

public class ST_1_11_1 {
    public static void main(String[] args) {
        // 输入
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个数 x（取值范围：0<x<1000）：");
        int x = sc.nextInt();
        int y;
        //判断
        if (x < 1) {
            y = x;
        } else if (x < 10) {
            y = 2 * x - 1;
        } else {
            y = 3 * x - 11;
        }
        System.out.println("y=" + y);
    }
}
