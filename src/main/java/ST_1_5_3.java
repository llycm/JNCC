import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class ST_1_5_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数值 n，m:");
        int n = sc.nextInt(), m = sc.nextInt();
        int cur = 1;
        Queue<Integer> q = new LinkedList<>();
        for (int i = 1; i <= n; i++) {
            q.add(i);
        }
        while (!q.isEmpty()) {
            int temp = q.poll();
            if (cur == m) {
                cur = 1;
                System.out.print(temp + " ");
            } else {
                cur++;
                q.add(temp);
            }
        }
    }
}