import java.util.Scanner;

public class ST_1_5_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("输入数值 m 和 n:");
        int m = sc.nextInt(), n = sc.nextInt();
        for (int child = 0; child <= n; child += 2) {
            for (int woman = 0; woman <= n - child; woman++) {
                int man = n - woman - child;
                if (child / 2 + woman * 3 + man * 4 == m) {
                    System.out.printf("%d %d %d\n", man, woman, child);
                    return;
                }
            }
        }
        System.out.println("无法一次搬完所有砖");
    }
}

//import java.util.Scanner;
//
//public class ST_1_4_3 {
//    public static void main(String[] args) {
//        Scanner sc = new Scanner(System.in);
//        System.out.print("输入数值 m 和 n:");
//        int m = sc.nextInt(), n = sc.nextInt();
//        int child = -1, woman = -1, man = -1;
//        boolean flag = false;
//        for (child = 0; !flag && child <= n; child += 2) {
//            for (woman = 0; woman <= n - child; woman++) {
//                man = n - woman - child;
//                if (child / 2 + woman * 3 + man * 4 == m) {
//                    flag = true;
//                    break;
//                }
//            }
//        }
//        if (flag) {
//            System.out.printf("%d %d %d\n", man, woman, child);
//        } else {
//            System.out.println("无法一次搬完所有砖");
//        }
//    }
//}

