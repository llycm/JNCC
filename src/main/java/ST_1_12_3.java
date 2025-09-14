import java.util.Scanner;

public class ST_1_12_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入 10 个数组元素值（数值元素范围 0~1000）：");
        Integer[] arr = new Integer[10];
        for (int i = 0; i < 10; i++) {
            arr[i] = sc.nextInt();
        }
        System.out.print("输入数值 val（0<val<1000）：");
        int val = sc.nextInt(), len = 10;
        for (int i = 0; i < 10; i++) {
            if (arr[i] == val) {
                arr[i] = null;
                len--;
            }
        }
        System.out.println(len);
    }
}
