import java.util.Scanner;

public class ST_1_9_1 {
    public static void main(String[] args) {
        // 输入
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个华氏温度，浮点数（取值范围：10~35）：");
        int F = sc.nextInt();
        double C = 5 * (F - 32) / 9.0;
        System.out.printf("C=%.2f\n", C);
    }
}
