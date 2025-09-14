import java.io.IOException;
import java.util.Scanner;

public class ST_1_19_1 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        for (int i = 0; i < n; i++) {
            int x = sc.nextInt();
            if (x % 3 == 0) {
                System.out.print(x + " ");
            }
        }
    }
}
