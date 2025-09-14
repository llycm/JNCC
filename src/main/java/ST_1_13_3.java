public class ST_1_13_3 {
    public static void main(String[] args) {
        int age = 11;
        while (true) {
            int pow3 = (int) Math.pow(age, 3);
            int pow4 = pow3 * age;
            if (pow3 >= 1000 && pow3 < 10000 && pow4 >= 100000 && pow4 < 1000000) {
                String s = "" + pow3 + pow4;
                int[] h = new int[10];
                for (int i = 0; i < s.length(); i++) {
                    h[s.charAt(i) - '0']++;
                }

                boolean flag = true;
                for (int j : h) {
                    if (j != 1) {
                        flag = false;
                        break;
                    }
                }

                if (flag) {
                    System.out.println(age);
                    return;
                }
            }
            age++;
        }
    }
}
