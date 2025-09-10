import java.util.Scanner;

public class ST_1_2_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入一个十进制正整数：");
        int n = sc.nextInt();

        StringBuilder octal = new StringBuilder();

        while (n > 0) {
            int remainder = n % 8;
            octal.append(remainder);
            n = n / 8;
        }
        String s = octal.reverse().toString();
        System.out.println("转换成进制为：" + s);
    }
}