import java.io.IOException;
import java.util.Scanner;

public class ST_1_16_3 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt(), b = sc.nextInt(), c = sc.nextInt();
        double s = (a + b + c) / 2.0;
        double area = Math.sqrt(s * (s - a) * (s - b) * (s - c)), perimeter = a + b + c;
        if (Double.isNaN(area)) {
            System.out.println("三条边无法构成三角形");
        } else {
            System.out.printf("边长为 %d，%d，%d 的三角形周长为 %.2f，面积为 %.2f", a, b, c, perimeter, area);
        }
    }
}
