import java.util.Scanner;

public class ST_1_1_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("请输入学生人数：");
        int n = sc.nextInt();
        double[][] arr = new double[n][3];
        String[] status = new String[n];
        for (int i = 0; i < n; i++) {
            System.out.print("请输入第" + (i + 1) + "个学生的体重和身高：");
            arr[i][0] = sc.nextDouble();
            arr[i][1] = sc.nextDouble();
            arr[i][2] = arr[i][0] / Math.pow(arr[i][1], 2);
            if (arr[i][2] >= 30) {
                status[i] = "肥胖";
            } else if (arr[i][2] >= 25) {
                status[i] = "过重";
            } else if (arr[i][2] >= 18.5) {
                status[i] = "正常";
            } else {
                status[i] = "过轻";
            }
        }
        System.out.println("体重" + '\t' + "身高    " + '\t' + "BMI指数" + '\t' + "胖瘦情况");
        for (int i = 0; i < n; i++) {
            System.out.printf("%.0f\t%.2f\t%.2f\t%s\n", arr[i][0], arr[i][1], arr[i][2], status[i]);
        }
    }
}
