import java.util.Scanner;

public class ST_1_10_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个半径，浮点类型：");
        double r = sc.nextDouble();
        double PI = 3.14;
        System.out.println("圆的面积：" + PI * r * r);
    }
}
