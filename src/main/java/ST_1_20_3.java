import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ST_1_20_3 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入n：");
        int n = sc.nextInt();
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            for (int j = i - 1; j >= 1; j--) {
                list.set(j, list.get(j) + list.get(j - 1));
            }
            list.add(1);
        }
        for (Integer integer : list) {
            System.out.print(integer + " ");
        }
    }
}
