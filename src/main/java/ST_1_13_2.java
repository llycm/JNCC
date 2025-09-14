import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ST_1_13_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入 10 个有序的数组元素值（元素取值范围：0~1000）：");
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= 10; i++) {
            int x = sc.nextInt();
            if (!list.contains(x)) {
                list.add(x);
            }
        }
        System.out.println(list.size());
        for (Integer i : list) {
            System.out.print(i + " ");
        }
    }
}
