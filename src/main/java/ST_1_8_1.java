import java.util.Scanner;

public class ST_1_8_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个三位数：");
        int n = sc.nextInt();
        int ge = n % 10, shi = n / 10 % 10, bai = n / 100;
        System.out.println(ge + " " + shi + " " + bai);
    }
}
