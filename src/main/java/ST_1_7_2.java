import java.util.Scanner;

public class ST_1_7_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入 n 个学生成绩：");
        
        int x = sc.nextInt();
        int youxiu = 0, jige = 0, bujige = 0;
        while (x != -1) {
            if (x >= 85) {
                youxiu++;
            } else if (x >= 60) {
                jige++;
            } else {
                bujige++;
            }
            x = sc.nextInt();
        }
        System.out.println("优秀（大于 85）：" + youxiu);
        System.out.println("及格（60～84）：" + jige);
        System.out.println("不及格（小于 60）：" + bujige);
    }
}
