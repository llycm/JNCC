import java.util.Scanner;

public class ST_1_12_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入十个整数：");
        int[] arr = new int[10];
        for (int i = 0; i < 10; i++) {
            arr[i] = sc.nextInt();
        }
        for (int i = arr.length - 1; i >= 0; i--) {
            System.out.print(arr[i] + " ");
        }
    }
}
