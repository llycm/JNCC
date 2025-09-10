import java.util.Scanner;

public class ST_1_4_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入一个三位整数：");
        int n = sc.nextInt();
        int a = n / 100, b = (n / 10) % 10, c = n % 10;

        System.out.println("交换个位和百位后：" + (c * 100 + b * 10 + a));
    }
}
