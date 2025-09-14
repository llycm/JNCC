import java.io.IOException;
import java.util.Scanner;

public class ST_1_20_2 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        int[][] matrix = new int[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                matrix[i][j] = sc.nextInt();
            }
        }

        int d1 = 0, d2 = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (i == j) {
                    d1 += matrix[i][j];
                }
                if (i + j == 2) {
                    d2 += matrix[i][j];
                }
            }
        }
        System.out.println(d1 + " " + d2);
    }
}
