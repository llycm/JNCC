import java.util.Scanner;

public class ST_1_8_3 {
    public static void main(String[] args) {
        // 输入
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入您购物的消费金额：");
        int x = sc.nextInt();
        //折扣
        double y = switch (x / 800) {
            case 0, 1 -> 0;
            case 2 -> 0.05;
            case 3 -> 0.1;
            case 4, 5, 6, 7 -> 0.15;
            default -> 0.2;
        };
        System.out.printf("您实际应付的购物金额为：%.2f\n", x - x * y);
    }
}
