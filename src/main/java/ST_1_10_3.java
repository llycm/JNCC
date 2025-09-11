public class ST_1_10_3 {
    public static void main(String[] args) {
        System.out.println("100 到 999 之间的水仙花数有：");
        for (int x = 100; x <= 999; x++) {
            int ge = x % 10, shi = x / 10 % 10, bai = x / 100;
            if (ge * ge * ge + shi * shi * shi + bai * bai * bai == x) {
                System.out.print(x + " ");
            }
        }
    }
}
