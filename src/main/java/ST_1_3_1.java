import java.util.Scanner;

public class ST_1_3_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入 3 个整数（用空格隔开）：");
        int x = sc.nextInt(), y = sc.nextInt(), z = sc.nextInt();
        if (x > y) {
            int temp = x;
            x = y;
            y = temp;
        }
        if (x > z) {
            int temp = x;
            x = z;
            z = temp;
        }
        if (y > z) {
            int temp = y;
            y = z;
            z = temp;
        }
        System.out.println("由小到大排序为：" + x + " " + y + " " + z);
    }
}