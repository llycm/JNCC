import java.util.Scanner;

public class ST_1_9_2 {
    public static void main(String[] args) {
        // 输入
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一行字符串（不超过 255 个字符）：");
        String s = sc.nextLine();
        String newString = s.replaceAll(" ", "");
        System.out.println("删除空格后的的字符串：" + newString);
    }
}
