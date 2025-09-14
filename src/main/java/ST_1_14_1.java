import java.util.Scanner;

public class ST_1_14_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入学生成绩：");
        double score = sc.nextDouble();
        if (score >= 90) {
            System.out.println("优秀");
        } else if (score >= 80) {
            System.out.println("良好");
        } else if (score >= 70) {
            System.out.println("中等");
        } else if (score >= 60) {
            System.out.println("合格");
        } else {
            System.out.println("不及格");
        }
    }
}
