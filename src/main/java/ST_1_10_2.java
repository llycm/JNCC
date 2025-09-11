import java.util.Scanner;

public class ST_1_10_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一行字符串（不超过 255 个字符）：");
        String s = sc.nextLine();
        String[] split = s.split(",");
        for (String string : split) {
            System.out.println(string);
        }
    }
}
