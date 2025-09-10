import java.util.Scanner;

public class ST_1_1_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数据个数：");
        int n = sc.nextInt();
        int[] arr = new int[n];
        System.out.print("输入" + n + "个整数：");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        int max = arr[0], maxIndex = 0;
        for (int i = 1; i < arr.length; i++) {
            if (max < arr[i]) {
                max = arr[i];
                maxIndex = i;
            }
        }
        System.out.println("最大值：" + max + "，第" + (maxIndex + 1) + "个位置");

        int min = arr[0], minIndex = 0;
        for (int i = 1; i < arr.length; i++) {
            if (min > arr[i]) {
                min = arr[i];
                minIndex = i;
            }
        }
        System.out.println("最小值：" + min + "，第" + (minIndex + 1) + "个位置");
    }
}
