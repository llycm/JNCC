import java.io.IOException;

public class ST_1_16_2 {
    public static void main(String[] args) throws IOException {
        int l = 1;
        while (true) {
            if (l * 21 + 41 == l * 34 + 2) {
                System.out.println("这根绳子长：" + (l * 21 + 41));
                return;
            }
            l++;
        }
    }
}
