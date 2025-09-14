import java.io.IOException;
import java.util.Scanner;

public class ST_1_19_3 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入一个字符串：");
        String s = sc.nextLine();
        String[] split = s.split("\\D+");
        int sum = 0;
        for (String string : split) {
            sum += Integer.parseInt(string);
        }
        System.out.println(sum);
    }
}
