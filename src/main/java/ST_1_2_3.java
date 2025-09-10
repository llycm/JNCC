import java.util.Scanner;

public class ST_1_2_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入n的值（n<=10）：");
        int n = sc.nextInt();
        int factorial_sum = 0;
        for(int i = 1; i <= n; i++){
            int factorial = 1;
            for (int j = 1; j <= i; j++){
                factorial *= j;
            }
            factorial_sum += factorial;
        }
        System.out.println("Sn="+factorial_sum);
    }
}