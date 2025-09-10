import java.util.Scanner;

public class ST_1_3_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();
        reversePrint(s, s.length() - 1);
    }

    public static void reversePrint(String s, int i) {
        if (i < 0) {
            return;
        }
        System.out.print(s.charAt(i));
        reversePrint(s, i - 1);
    }
}
