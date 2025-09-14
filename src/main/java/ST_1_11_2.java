import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class ST_1_11_2 {
    public static void main(String[] args) {
        // 输入
        Scanner sc = new Scanner(System.in);
        Set<Integer> set = new HashSet<>();
        for (int i = 0; i < 10; i++) {
            set.add(sc.nextInt());
        }
        Set<Integer> newSet = new HashSet<>();
        for (int i = 0; i < 10; i++) {
            int x = sc.nextInt();
            if (set.contains(x)) {
                newSet.add(x);
            }
        }
        if (set.isEmpty()) {
            System.out.println("Null");
        } else {

        }
    }
}
